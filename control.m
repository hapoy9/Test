function [v, w] = control(robot, gpos)
    u = 2;
    k = 2;
    
    b = gpos - robot.pos;
%     a = b / norm(b);
%     robot.theta
%     atan2(b(2),b(1))
    e_th = robot.theta - atan2(b(2),b(1));
%     e_th = acos((turnth(robot.theta)*[1;0])'* a);
%     e_s = cross([turnth(robot.theta)*[1;0];0], [a;0]);
%     if e_s(3) >= 0
%         e_th = -e_th;
%     end%计算角度误差，注意符号
%     dx = -robot.v * cos(e_th);
%     dw = robot.w + robot.v/(norm(b)) *sin(e_th);
%     if(e_th == 3)
%         e_th = e_th - 0.2;
%     elseif(e_th == -3)
%         e_th = e_th + 0.2;
%     end
%为了解决atan2函数造成的-pi和pi临界状态，是角度在正值和负值之间跳变%
    if(e_th >= -2*pi && e_th <= -pi) 
        e_th;                   %调试用
        e_th = e_th + 2*pi;
        temp = e_th;           %调试用
%     elseif(e_th >= pi && e_th <=2*pi)
%         e_th = e_th - 2*pi;
    end
    v = u * Sr(norm(b)) * cos(e_th);
    w = -k * e_th - u * Sr(norm(b)) * cos(e_th) * sin(e_th) / norm(b) ;
    

end

function y = Sr(b)
    c = 2;
%     b = b -4;
    if b < -c
        y = -1;
    elseif -c <= b && b < 0
        y = ((b+c)/c)^2 -1;
    elseif 0 <= b && b < c
        y = 1 - ((b - c)/c)^2;
    else
        y = 1;
    end
end