function Bound = makeBound(a,b)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   ���ɱ߳�Ϊ2�������Σ�������ĵ�λ�ã���a=b=0ʱ�����ĵ��ڡ�10��10��
m = a;   %�����ƶ�
n = b;   %�����ƶ�
x = 9 + m;
y = 9 + n;
Bound = [0 2 2 0;0 0 2 2]+[x x x x;y y y y] ;
line([Bound(1,:) Bound(1,1)],[Bound(2,:) Bound(2,1)]);%�ϰ���
end

