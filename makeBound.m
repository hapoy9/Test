function Bound = makeBound(a,b)
%UNTITLED2 此处显示有关此函数的摘要
%   生成边长为2的正方形，针对中心点位置，当a=b=0时，中心点在【10；10】
m = a;   %横向移动
n = b;   %纵向移动
x = 9 + m;
y = 9 + n;
Bound = [0 2 2 0;0 0 2 2]+[x x x x;y y y y] ;
line([Bound(1,:) Bound(1,1)],[Bound(2,:) Bound(2,1)]);%障碍物
end

