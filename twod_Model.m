fname = '/home/siddharth30/Rosbags/uuvTestdata2/upenn_sysid_task_2020-06-30_18-58-53/sysID_0.bag';
fprintf('Importing data from ROS bag ... ');
bag = rosbag(fname);

bSel = select(bag,'Topic','/iver0/hsd_command');
ut = bSel.MessageList.Time;
uMsgStructs = readMessages(bSel,'DataFormat','struct');
u = zeros(3,numel(ut)); % ADD MORE ROWS IF USING MORE THAN HEADING, SPEED, DIRECTION
for n = 1:numel(ut)
    u(1,n) = uMsgStructs{n}.Heading;
    u(2,n) = uMsgStructs{n}.Speed;
    u(3,n) = uMsgStructs{n}.Depth;
end