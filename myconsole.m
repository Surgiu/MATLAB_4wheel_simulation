result = sim("project.slx");

figure;
%x方向速度输入
subplot(2,1,1);
plot(result.vx_input.Data);
xlabel('time/s');
ylabel('input vx');
title('Input Velocities')
%y方向速度输入
subplot(2,1,2);
plot(result.vy_input.Data);
xlabel('time/s');
ylabel('input vy');




figure;
%绘制小车理论运行轨迹
subplot(2,2,1);
plot(result.x_desired.Data,result.y_desired.Data);
xlabel('x');
ylabel('y');
title('Ground Truth');
axis equal; % 使x和y轴比例相同，更适合观察轨迹
grid on;
%绘制小车仿真轨迹
subplot(2,2,2);
plot(result.x.Data, result.y.Data);
xlabel('x');
ylabel('y');
title('Generated Trajactory');
axis equal; % 使x和y轴比例相同，更适合观察轨迹
grid on;
%绘制小车y方向速度变化趋势
subplot(2,2,3);
plot(result.vy)
title('Vertical Velocity')
ylabel('v_y')
xlabel('time/s')
%四个轮子的角速度
subplot(2,2,4);
hold on
plot(result.w1,'*')
plot(result.w2,'*')
plot(result.w3)
plot(result.w4)
title('Angular Speed of Each Wheel')
legend('w1','w2','w3','w4')
xlabel('time/s')
ylabel('w')
hold off

%计算停止位置的坐标
x_end = round(result.x.Data(end),3);
y_end = round(result.y.Data(end),3);
arg_end = round(atan(y_end/(x_end-1)) * 180 / pi,3);
disp(["simulation end point:", x_end, y_end])

arg_truth = round(atan(sin(10)/(-cos(10)))* 180 / pi,3);
x_truth = round(1-cos(10),3);
y_truth = round(sin(10),3);
disp(["ground truth: ", x_truth, y_truth])

if x_end==x_truth && y_end==y_truth
    disp("match!")
else
    disp("unmatch!")
end