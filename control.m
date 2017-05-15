function [v, w] = control(robot, gpos)
    u = 2;
    k = 2;

    b = gpos - robot.pos;
    e_th = robot.theta - atan2(b(2),b(1)) ;
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