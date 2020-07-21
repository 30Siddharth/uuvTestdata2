fname = '/home/siddharth30/Rosbags/uuvTestdata2/upenn_sysid_task_2020-06-30_18-58-53/sysID_0.bag';
fprintf('Importing data from ROS bag ... ');
bag = rosbag(fname);


bSel0 = select(bag,'Topic','/iver0/fins/0/wrench_topic');
ut = bSel0.MessageList.Time;
    uMsgStructs = readMessages(bSel0,'DataFormat','struct');
    u0 = zeros(1,numel(ut)); % ADD MORE ROWS IF USING MORE THAN HEADING, SPEED, DIRECTION
    for n = 1:numel(ut)
        u0(n) = uMsgStructs{n}.Wrench.Force;
    end
    
bSel1 = select(bag,'Topic','/iver0/fins/1/wrench_topic');
ut = bSel1.MessageList.Time;
    uMsgStructs = readMessages(bSel1,'DataFormat','struct');
    u1 = zeros(1,numel(ut)); % ADD MORE ROWS IF USING MORE THAN HEADING, SPEED, DIRECTION
    for n = 1:numel(ut)
        u1(n) = uMsgStructs{n}.Data;
    end
    
bSel2 = select(bag,'Topic','/iver0/fins/2/wrench_topic');
ut = bSel2.MessageList.Time;
    uMsgStructs = readMessages(bSel2,'DataFormat','struct');
    u2 = zeros(1,numel(ut)); % ADD MORE ROWS IF USING MORE THAN HEADING, SPEED, DIRECTION
    for n = 1:numel(ut)
        u2(n) = -1*uMsgStructs{n}.Data;
    end
    
bSel3 = select(bag,'Topic','/iver0/fins/3/wrench_topic');
ut = bSel3.MessageList.Time;
    uMsgStructs = readMessages(bSel3,'DataFormat','struct');
    u3 = zeros(1,numel(ut)); % ADD MORE ROWS IF USING MORE THAN HEADING, SPEED, DIRECTION
    for n = 1:numel(ut)
        u3(n) = -1*uMsgStructs{n}.Data;
    end

    
subplot(2,2,1)
hold on;
plot(u0);
% plot(v0, '--');
% plot(u2);
% plot(v2, '--');
title('Fin 0')
legend('Output','Input');

subplot(2,2,2)
hold on;
plot(u1);
% plot(v1, '--');
% plot(u3);
% plot(v3, '--');
title('Fin 1')
legend('Outpu1t','Input');

subplot(2,2,3)
hold on;
plot(u2);
% plot(v2, '--');
title('Fin 2')
legend('Output','Input');

subplot(2,2,4)
hold on;
plot(u3);
% plot(v3, '--');
title('Fin 3')
legend('Output','Input');