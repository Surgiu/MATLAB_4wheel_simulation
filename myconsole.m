result = sim("project.slx");

figure;
%x方向速度输入
plot(result.vx_input.Data);
xlabel('time');
ylabel('input vx');
figure;
%y方向速度输入
plot(result.vy_input.Data);
xlabel('time');
ylabel('input vy');

%四个轮子的角速度
figure;
hold on
plot(result.w1,'*')
plot(result.w2,'*')
plot(result.w3)
plot(result.w4)
legend('右上','左上','左下','右下')
xlabel('time')
ylabel('w')
hold off

figure;
%绘制小车仿真轨迹
hold on
plot(result.x.Data, result.y.Data);
xlim([-1,3])
ylim([-2,2])
xlabel('Horizontal Displacement');
ylabel('Vertical Displacement');
title('Trajectory of the Movement');
axis equal; % 使x和y轴比例相同，更适合观察轨迹
grid on;
%绘制小车理论运行轨迹
plot(result.x_desired.Data,result.y_desired.Data,'*');
legend("simulated trajectory","ground truth")
hold off