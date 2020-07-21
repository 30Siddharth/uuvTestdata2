function [u,y] = extract_UUV_findata(fname)


fprintf('Importing data from ROS bag ... ');
bag = rosbag(fname);

bSel0 = select(bag,'Topic','/iver0/fins/0/output');
ut = bSel0.MessageList.Time;
    uMsgStructs = readMessages(bSel0,'DataFormat','struct');
    u0 = zeros(1,numel(ut)); % ADD MORE ROWS IF USING MORE THAN HEADING, SPEED, DIRECTION
    for n = 1:numel(ut)
        u0(n) = uMsgStructs{n}.Data;
    end
    
bSel1 = select(bag,'Topic','/iver0/fins/1/output');
ut = bSel1.MessageList.Time;
    uMsgStructs = readMessages(bSel1,'DataFormat','struct');
    u1 = zeros(1,numel(ut)); % ADD MORE ROWS IF USING MORE THAN HEADING, SPEED, DIRECTION
    for n = 1:numel(ut)
        u1(n) = uMsgStructs{n}.Data;
    end
    
bSel2 = select(bag,'Topic','/iver0/fins/2/output');
ut = bSel2.MessageList.Time;
    uMsgStructs = readMessages(bSel2,'DataFormat','struct');
    u2 = zeros(1,numel(ut)); % ADD MORE ROWS IF USING MORE THAN HEADING, SPEED, DIRECTION
    for n = 1:numel(ut)
        u2(n) = -1*uMsgStructs{n}.Data;
    end
    
bSel3 = select(bag,'Topic','/iver0/fins/3/output');
ut = bSel3.MessageList.Time;
    uMsgStructs = readMessages(bSel3,'DataFormat','struct');
    u3 = zeros(1,numel(ut)); % ADD MORE ROWS IF USING MORE THAN HEADING, SPEED, DIRECTION
    for n = 1:numel(ut)
        u3(n) = -1*uMsgStructs{n}.Data;
    end

    
%%%%%%%%%%%%%%%%%%%%
    
bSel0 = select(bag,'Topic','/iver0/fins/0/input');
ut = bSel0.MessageList.Time;
    uMsgStructs = readMessages(bSel0,'DataFormat','struct');
    v0 = zeros(1,numel(ut)); % ADD MORE ROWS IF USING MORE THAN HEADING, SPEED, DIRECTION
    for n = 1:numel(ut)
        v0(n) = uMsgStructs{n}.Data;
    end
    
bSel1 = select(bag,'Topic','/iver0/fins/1/input');
ut = bSel1.MessageList.Time;
    uMsgStructs = readMessages(bSel1,'DataFormat','struct');
    v1 = zeros(1,numel(ut)); % ADD MORE ROWS IF USING MORE THAN HEADING, SPEED, DIRECTION
    for n = 1:numel(ut)
        v1(n) = uMsgStructs{n}.Data;
    end
    
bSel2 = select(bag,'Topic','/iver0/fins/2/input');
ut = bSel2.MessageList.Time;
    uMsgStructs = readMessages(bSel2,'DataFormat','struct');
    v2 = zeros(1,numel(ut)); % ADD MORE ROWS IF USING MORE THAN HEADING, SPEED, DIRECTION
    for n = 1:numel(ut)
        v2(n) = -1*uMsgStructs{n}.Data;
    end
    
bSel3 = select(bag,'Topic','/iver0/fins/3/input');
ut = bSel3.MessageList.Time;
    uMsgStructs = readMessages(bSel3,'DataFormat','struct');
    v3 = zeros(1,numel(ut)); % ADD MORE ROWS IF USING MORE THAN HEADING, SPEED, DIRECTION
    for n = 1:numel(ut)
        v3(n) = -1*uMsgStructs{n}.Data;
    end
    
    
subplot(2,2,1)
hold on;
plot(u0);
plot(v0, '--');
% plot(u2);
% plot(v2, '--');
title('Fin 0')
legend('Output','Input');

subplot(2,2,2)
hold on;
plot(u1);
plot(v1, '--');
% plot(u3);
% plot(v3, '--');
title('Fin 1')
legend('Outpu1t','Input');

subplot(2,2,3)
hold on;
plot(u2);
plot(v2, '--');
title('Fin 2')
legend('Output','Input');

subplot(2,2,4)
hold on;
plot(u3);
plot(v3, '--');
title('Fin 3')
legend('Output','Input');



end