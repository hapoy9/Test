function gPose = control2( robot,gpose )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
k1 =10;
k2 =1;
angle_weight = [0.85 0.99 -0.99 -0.85 -0.53 -0.16 0 0.16 0.53];%角度权重
% angle_weight = [0.85 2 -2 -0.85 -0.53 -0.16 0 0.16 0.53];
for i = 1 : 9
    robot.sensor(2,i);
    d(i) = robot.sensor(2,i)/robot.sence_lenth;
%     w(i) = k1 * exp(-d(i)/k2) * angle_weight(i) ;
    w(i) = k1 * exp(-d(i)/k2) * angle_weight(i) * (1 - d(i));
%     w(i) = k1 * (d(i)/k2) * angle_weight(i) * (1 - d(i));

end

avoild_theta = sum(w, 2) + robot.theta     %robot.theta的目的是先旋转到机器人的角度，然后再旋转到偏角
gPose = turnth(avoild_theta) * gpose;




% function [v, w] = control2(robot, gpos)
%     u = 2;
%     k = 2;
%     k1 =1;
%     k2 =1;
%     angle_weight = [0.85 0.99 -0.99 -0.85 -0.53 -0.16 0 0.16 0.53];%角度权重
%     for i = 1 : 9
%         d(i) = robot.sensor(2,i)/5;
%         w(i) = k1 * exp(-d(i)/k2) * angle_weight(i) * (1 - d(i));
% 
%     end
% 
%     avoild_theta = sum(w, 2);
%     b = gpos - robot.pos;
%     e_th = robot.theta - atan2(b(2),b(1)) - avoild_theta;
%     v = u * Sr(norm(b)) * cos(e_th);
%     w = -k * e_th - u * Sr(norm(b)) * cos(e_th) * sin(e_th) / norm(b) ;
%     
% 
% end

% function y = Sr(b)
%     c = 2;
% 
%     if b < -c
%         y = -1;
%     elseif -c <= b && b < 0
%         y = ((b+c)/c)^2 -1;
%     elseif 0 <= b && b < c
%         y = 1 - ((b - c)/c)^2;
%     else
%         y = 1;
%     end
% end