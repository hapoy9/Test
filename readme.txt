2017.4.10
	实现多点目标，解决沿x轴负方向运动时的抖动问题。
2017.4.13
	机器人沿x轴避障没有问题，但是沿y轴运动时避障出现问题没有解决；
	机器人避障是将避障和目标控制分开，采用将目标点旋转避障偏角得到新的目标点，
	利用目标跟踪到新的目标，当检测不到障碍物时，跟踪正确的目标点。
2017.4.23
	2017.4.23v1版本
		将生成障碍物单独函数生成；
		解决沿y轴避障问题，方法为将目标点旋转（机器人当前角度加偏角）的角度；
		完成生成两个障碍物的避障。
	2017.4.23v2版本
		将避障和目标跟踪合起来，计算出避障的偏角，将机器人控制的角度误差减去避障偏角得到机器人实际的控制角度；
		存在问题是无法随机生成障碍物，无法满足实验要求。
	2017.4.23v3版本
		机器人到达某个目标点后生成新的障碍物，解决随机问题，避障和目标跟踪还是和在一起的，效果不错；
		由于不用同时考虑连续两个传感器的数据，sensorData函数没有使用，所以效果比较好，因为刚开始数据处理的时候，处理的不太好。
	2017.4.23v4版本
		针对办公环境的复杂任务，实现仿真，但是有个问题是第二次避障时机器人左边避障，而不是右边，不知道原因。
	2017.5.10
	创建构建房间函数createRoom，使matlab显示出办公室布局，同时调试发现机器人来回的路线不重合有可能是机器人角度计算错误，
	因为沿y正方向运动时，机器人角度并不是pi/2左右。
	2017.5.11
	将机器人的角度和误差偏角的范围都设定在-pi到pi的范围，实现了机器人沿x轴负方向时是直线不会有一个弧度，正方向还是有弧度；
	此外控制算法中的u和k的值对仿真影响很大