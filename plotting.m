% [u1,y1] = extract_UUV_data('/home/siddharth30/Rosbags/uuvTestdata2/upenn_sysid_task_2020-06-06_19-25-33/sysID_0.bag');
% [u2,y2] = extract_UUV_data('/home/siddharth30/Rosbags/uuvTestdata2/upenn_sysid_task_2020-06-06_19-49-22/sysID_0.bag');
% [u3,y3] = extract_UUV_data('/home/siddharth30/Rosbags/uuvTestdata2/upenn_sysid_task_2020-06-06_19-32-44/sysID_0.bag');
[u3,y3] = extract_UUV_data('/home/siddharth30/Rosbags/uuvTestdata2/upenn_sysid_task_2020-06-09_23-30-55/sysID_0.bag');
% [u4,y4] = extract_UUV_data('/home/siddharth30/Rosbags/uuvTestdata2/upenn_sysid_task_2020-06-10_13-18-56/sysID_0.bag');
[u4,y4] = extract_UUV_data('/home/siddharth30/Rosbags/uuvTestdata2/upenn_sysid_task_2020-06-30_18-58-53/sysID_0.bag');

% t1 = 0: 0.05: 0.05*length(u1(1,300:end));
% 
% subplot(2,2,1);
% hold on;
% plot(t1(1:end-1),u1(1,300:end),'r--');
% plot(t1(1:end-1),y1(1,300:end));
% plot(t1(1:end-1),u1(2,300:end),'b--');
% plot(t1(1:end-1),y1(2,300:end));
% xlabel('Time (s)');
% grid on;
% grid minor;
% legend('Heading Setpoint','Heading','Speed Setpoint','Speed');
% title('Speed step of 2.25 m/s');

% t2 = 0: 0.05: 0.05*length(u2(1,300:end));

% subplot(2,2,4);
% hold on;
% plot(t2(1:end-1),u2(1,300:end),'r--');
% plot(t2(1:end-1),y2(1,300:end));
% plot(t2(1:end-1),u2(2,300:end),'b--');
% plot(t2(1:end-1),y2(2,300:end));
% xlabel('Time (s)');
% grid on;
% grid minor;
% legend('Heading Setpoint','Heading','Speed Setpoint','Speed');
% title('Speed Step 1 m/s and Heading Step 5 degrees');
% 

t3 = 0: 0.05: 0.05*length(u3(1,:));
% 300:end
subplot(2,2,1);
hold on;
plot(t3(1:end-1),u3(1,:),'r--','Linewidth',2);
plot(t3(1:end-1),y3(1,:),'Linewidth',2);
xlabel('Time (s)');
ylabel('Heading (deg)');
grid on;
grid minor;
legend('Heading Setpoint','Heading');
title('Heading Step 5 degrees');

subplot(2,2,3);
hold on;
plot(t3(1:end-1),u3(2,:),'b--','Linewidth',2);
plot(t3(1:end-1),y3(2,:),'g','Linewidth',2);
xlabel('Time (s)');
ylabel('Speed m/s');
grid on;
grid minor;
legend('Speed Setpoint','Speed');
title('Heading Step 5 degrees');

t4 = 0: 0.05: 0.05*length(u4(1,:));
% 600:end
subplot(2,2,2);
hold on;
plot(t4(1:end-1),u4(1,:),'r--','Linewidth',2);
plot(t4(1:end-1),y4(1,:),'Linewidth',2);
xlabel('Time (s)');
ylabel('Heading (deg)');
grid on;
grid minor;
legend('Heading Setpoint','Heading');
title('Speed Step of 1 m/s');

subplot(2,2,4);
hold on;
plot(t4(1:end-1),u4(2,:),'b--','Linewidth',2);
plot(t4(1:end-1),y4(2,:),'g','Linewidth',2);
xlabel('Time (s)');
ylabel('Speed m/s');
grid on;
grid minor;
legend('Speed Setpoint','Speed');
title('Speed Step of 1 m/s');
