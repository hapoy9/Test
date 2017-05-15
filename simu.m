clear;
clc;
clf;
set(gcf,'Position',[10 30 700 600],'Color',[0.8 0.8 0.8]);
set(gca,'Position',[0.05 0.05 0.9 0.9]);
axis([0 70 0 60]);
axis on;%环境信息
% axis equal
bound1 = makeBound(5,30);%%横向障碍物%%%
bound2 = makeBound(1,20);%%纵向障碍物%%%
% gposlist = zeros(2,numofgoal);
% gposlist = [15 15 25; 5 11 12];%目标点集合
gposlist = [20 10 10 30 30 30 60 60 50 50 50 20 20;40 40 20 20 10 20 20 40 40 30 40 40 50];
j = 1;
numofgoal = size(gposlist,2)

robot = wheel([20; 50], -pi/2, 0.05);%机器人初始化

for i = 1 : 6000
%     robot = robot.dis_sence(bound1);
%     robot.sensor
    robot = sensorData(robot,bound1,bound2 );
    if max(robot.sensor(1, :))
%         disp('help me!!!');%避障策略添加在这里
%         break;
        robot.sensor
%          gposlist(:, j)
        gpos_temp = control2(robot, gposlist(:, j));
        [v, w] = control(robot, gpos_temp);
        robot = robot.wheelpos(v, w);


%         [v, w] = control2(robot, gposlist(:,j));
%         robot = robot.wheelpos(v, w); 

    else
        [v, w] = control(robot, gposlist(:,j));
        robot = robot.wheelpos(v, w); %正常运行
%         plot()
    end
      
    if norm(robot.pos - gposlist(:, j)) < 0.1 %判断与目标点的距离
        j = j + 1;
    end
    if j > numofgoal
        break;
    end
    pause(0.001);
end

