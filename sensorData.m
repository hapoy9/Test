function robot = sensorData(robot,bound1,bound2 )
%UNTITLED �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
robot = robot.dis_sence(bound1);
sensorTemp = robot.sensor;
robot = robot.dis_sence(bound2);
for i = 1:9 
    robot.sensor(1,i) = (robot.sensor(1,i) + sensorTemp(1,i))/2;
    robot.sensor(2,i) = (robot.sensor(2,i) + sensorTemp(2,i)) - robot.sence_lenth;
end

end

