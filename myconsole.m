result = sim("project.slx");

figure;
%x方向速度输入
subplot(2,1,1);
plot(result.vx_input.Data);
xlabel('time');
ylabel('input vx');
title('input veloceties')
%y方向速度输入
subplot(2,1,2);
plot(result.vy_input.Data);
xlabel('time');
ylabel('input vy');



%四个轮子的角速度
figure;
subplot(2,2,1);
hold on
plot(result.w1,'*')
plot(result.w2,'*')
plot(result.w3)
plot(result.w4)
legend('右上轮','左上轮','左下轮','右下轮')
xlabel('time')
ylabel('w')
hold off
%绘制小车y方向速度变化趋势
subplot(2,2,2);
plot(result.vy)
title('v_y')
ylabel('v_y')
%绘制小车仿真轨迹
subplot(2,2,3);
plot(result.x.Data, result.y.Data);
xlabel('Horizontal Displacement');
ylabel('Vertical Displacement');
title('Generated Trajactory');
axis equal; % 使x和y轴比例相同，更适合观察轨迹
grid on;
%绘制小车理论运行轨迹
subplot(2,2,4);
plot(result.x_desired.Data,result.y_desired.Data);
xlabel('Horizontal Displacement');
ylabel('Vertical Displacement');
title('Ground Truth');
axis equal; % 使x和y轴比例相同，更适合观察轨迹
grid on;