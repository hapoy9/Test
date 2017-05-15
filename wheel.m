classdef wheel 
    properties (Access = private)
%         vr;
%         vl; 
        v; 
        w; 
        width = 2;
        dt;
                
        carmodel; 
%         sence_lenth;%传感器距离
        senceline;
    end
    
    properties 
        sensor;%传感器数据，第一行为是否检测到障碍物，第二行为距离
        pos;
        theta;
        sence_lenth;
    end
    
    methods
        function obj = wheel(pos, theta, dt)
            obj.pos = pos;
            obj.theta = theta;
            obj.dt = dt;
            
            
            obj.carmodel = line();
            for i = 1:9
                obj.senceline(i) = line();
            end
            obj.sensor = zeros(2, 9);
            obj.sence_lenth = 3;
        end
        %控制小车运动
        function obj = wheelpos(obj, v, w)
%             obj.vr = vr;
%             obj.vl = vl;
%             obj.v = (obj.vr + obj.vl)/2;
%             obj.w = (obj.vr - obj.vl)/obj.width;
            obj.v = v;
            obj.w = w;
            obj.theta = obj.theta + obj.w * obj.dt;
            tpos = obj.pos + turnth(obj.theta) * [1; 0] * obj.v * obj.dt;
            line([obj.pos(1) tpos(1)],[obj.pos(2) tpos(2)]);
            obj.pos = tpos;
            
            obj.frawrec();
        end
        
        %传感器检测
        function obj = dis_sence(obj, bound)
            senpos = zeros(2, 9);
            for i = 1: 9
                if i < 6
                    sendirect = turnth(obj.theta - pi/2 + i * pi/5) * [obj.sence_lenth; 0];%传感器方向
                    senpos(:,i) = obj.pos + sendirect;%传感器检测末端位置
                    flag = obstacle(senpos(:,i),bound);%检测是否在障碍物内部
                    num = 1;
                    while 1
                         flag1 = obstacle(senpos(:,i), bound);
                         if flag1(1) == 0 && flag(1) == 1
                             temp = 1;
                             break;
                         end
                         flag = flag1;
                         num = num + 1;
                         if num >= 50
                             senpos(:,i) = obj.pos + sendirect;
                             temp = 0;
                             break;
                         end
                         senpos(:,i) = senpos(:,i) - sendirect/50;
                    end
                    obj.sensor(:,i) = [temp;norm(senpos(: ,i)-obj.pos)];
                else
                    sendirect = turnth(obj.theta + pi/2 + (i - 5) * pi/4) * [obj.sence_lenth; 0];
                    senpos(:,i) = obj.pos + sendirect;
                    flag = obstacle(senpos(:,i),bound);
                    num = 1;
                    while 1
                         flag1 = obstacle(senpos(:,i), bound);   
                         if flag1(1) == 0 && flag(1) == 1
                             temp = 1;
                             break;
                         end
                         flag = flag1;
                         num = num + 1;
                         if num >= 50
                             senpos(:,i) = obj.pos + sendirect;
                             temp = 0;
                             break;
                         end
                         senpos(:,i) = senpos(:,i) - sendirect/50;
                    end
                    obj.sensor(:,i) = [temp;norm(senpos(: ,i)-obj.pos)];
                end
            end
            for i = 1: 9
                set(obj.senceline(i), 'XData',[obj.pos(1) senpos(1, i)], 'YData', [obj.pos(2) senpos(2, i)],'Marker','o','LineStyle','-.');
            end
        end
    end
    
    methods (Access = private)
        %画小车
        function frawrec(obj)
            a = turnth(obj.theta) * [1; 0];
            posset = zeros(2, 24);
            for i = -10: 10      
                    posset(: , i + 12) = obj.pos + turnth(obj.theta + pi/20 *i) * [1; 0];
            end
            posset(: , 1) = posset(: , 2) - a;
            posset(: , 23) = posset(: , 22) - a;
            posset(: , 24) = posset(: , 1);
            set(obj.carmodel, 'XData' , posset(1, : ), 'YData', posset(2 , :));
        end
    end
end





