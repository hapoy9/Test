function flag = obstacle(rpos,bound)
n = length(bound);
sign=zeros(1,n-2);
for i = 2:n-1
    sign(i) = isinbound(rpos,bound,i);
    if sign(i)
        flag(2) = i;
        break;
    else
        sign(i) = 0;
    end
end
flag(1) = max(sign);
end%判断是否在多边形内部

function sign = isinbound(rpos,bound,k)

    a = [bound(:,k)-bound(:,1);0];
    b = [bound(:,k+1)-bound(:,1);0];
    c = [rpos - bound(:,1);0];
    f1 = cross(c,a);
    f2 = cross(c,b);%矢量叉乘，判断是否在三角形两边夹角区域
    f = f1(3)*f2(3);

    a = [bound(:,1)-bound(:,k);0];
    b = [bound(:,k+1)-bound(:,k);0];
    c = [rpos - bound(:,k);0];
    g1 = cross(c,a);
    g2 = cross(c,b);
    g = g1(3)*g2(3);

    if f<=0&&g<=0
        sign = 1;
    else
        sign = 0;
    end

end%判断是否在三角形内部