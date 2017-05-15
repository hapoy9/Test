clear;
clc;
% clf;
set(gcf,'Position',[10 30 1300 650],'Color',[0.8 0.8 0.8]);
set(gca,'Position',[0.05 0.05 0.9 0.9]);
axis([0 50 0 25]);
axis on;

car = line();
g_x = [40 5 5 5 5 10];   %目标点横坐标
g_y = [5 5 19 5 19 5];     %目标点纵坐标
g_length = length(g_x);
gpos = [g_x(1); g_y(1)];
robot = wheel([5; 5], pi, 0.05);%初始机器人位置与角度
g_index = 1;
for i = 1 : 2000
    gpos = [g_x(g_index); g_y(g_index)];
    [v, w] = control(robot, gpos);
    
    robot = robot.wheelpos(v, w);
    robot.frawrec(car);
%     norm(robot.pos - gpos)
    if(norm(robot.pos - gpos) < 0.001 && g_index < g_length)
        g_index =g_index + 1;
        robot.pos
    end
    pause(0.01);
end
robot.pos