classdef wheel 
    properties
%         vr;
%         vl; 
        v; 
        w; 
        pos;  
        theta; 
        width = 2;
        dt;
    end
    methods
        function obj = wheel(pos, theta, dt)
            obj.pos = pos;
            obj.theta = theta;
            obj.dt = dt;
        end
        
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
        end
        
        function frawrec(obj, car)
                 
            b = turnth(obj.theta-pi/4) * [1;0]; 
            a = turnth(obj.theta+pi/4) * [1;0]; 
            
            dotpos(:,1) = obj.pos+a;
            dotpos(:,2) = obj.pos+b;
            dotpos(:,3) = obj.pos-a;
            dotpos(:,4) = obj.pos-b;
            dotpos(:,5) = obj.pos+a;
            dotpos(:,6) = obj.pos;
            dotpos(:,7) = obj.pos+b;
            
            set(car,'XData',dotpos(1,:),'YData',dotpos(2,:));
        end
    end
end