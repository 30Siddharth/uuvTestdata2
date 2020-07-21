clear all;
clc;

fname = '/home/siddharth30/Rosbags/uuvTestdata2/upenn_sysid_task_2020-06-10_13-18-56/sysID_0.bag';
fprintf('Importing data from ROS bag ... ');
bag = rosbag(fname);

bSel0 = select(bag,'Topic','/iver0/velocity_info');
rpyt = bSel0.MessageList.Time;
rpyMsgStructs = readMessages(bSel0,'DataFormat','struct');
rpy = zeros(3,numel(rpyt)); % ADD MORE ROWS IF USING MORE THAN HEADING, SPEED, DIRECTION
for n = 1:numel(rpyt)
    rpy(1,n) = rpyMsgStructs{n}.Roll;
    rpy(2,n) = rpyMsgStructs{n}.Pitch;
    rpy(3,n) = rpyMsgStructs{n}.Yaw;
end

subplot(3,1,1);
plot(rpy(1,:));
title('Roll');

subplot(3,1,2);
plot(rpy(2,:));
title('Pitch');

subplot(3,1,3);
plot(rpy(3,:));
title('Yaw');

bSel = select(bag,'Topic','/iver0/hsd_command');
ut = bSel.MessageList.Time;
uMsgStructs = readMessages(bSel,'DataFormat','struct');
u = zeros(3,numel(ut)); % ADD MORE ROWS IF USING MORE THAN HEADING, SPEED, DIRECTION
for n = 1:numel(ut)
    u(1,n) = uMsgStructs{n}.Heading;
    u(2,n) = uMsgStructs{n}.Speed;
    u(3,n) = uMsgStructs{n}.Depth;
end

