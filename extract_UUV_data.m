function [u,y] = extract_UUV_data(fname)

    % Import data (all this is hard coded)
    
%     fname = './recording.bag'

%     switch mode
%         case 'n4sid'
%         case 'ssest' 
%         otherwise
%             error('Not a valid mode')
%     end
    
    
    fprintf('Importing data from ROS bag ... ');
    bag = rosbag(fname);
    %bag = rosbag('<rosbagname.bag>');
    %disp(bag.AvailableTopics)

    % Collect actuation inputs (heading, speed, direction) and times
    bSel = select(bag,'Topic','/iver0/hsd_command');
    ut = bSel.MessageList.Time;
    uMsgStructs = readMessages(bSel,'DataFormat','struct');
    u = zeros(3,numel(ut)); % ADD MORE ROWS IF USING MORE THAN HEADING, SPEED, DIRECTION
    for n = 1:numel(ut)
        u(1,n) = uMsgStructs{n}.Heading;
        u(2,n) = uMsgStructs{n}.Speed;
        u(3,n) = uMsgStructs{n}.Depth;
    end

    
    
    % Collect velocity info and times
    % Heading = pose_rpy.Yaw             *** Why is this one different???
    % Speed = velocity_info.VehicleSpeed
    % Depth = velocity_info.Latlondepth.Depth
    bSel = select(bag,'Topic','/iver0/pose_rpy');
    yt = bSel.MessageList.Time;
    yMsgStructs = readMessages(bSel,'DataFormat','struct');
    y = nan(3,numel(yt));
    for n = 1:numel(yt)
        y(1,n) = yMsgStructs{n}.Yaw; 
    end
   
    
    bSel = select(bag,'Topic','/iver0/velocity_info');
    yt2 = bSel.MessageList.Time;
    yMsgStructs = readMessages(bSel,'DataFormat','struct');
    y2 = nan(2,numel(yt2));
    for n = 1:numel(yt2)
        y2(1,n) = yMsgStructs{n}.VehicleSpeed;
        y2(2,n) = yMsgStructs{n}.Latlondepth.Depth;
    end
    fprintf('done\n')
    
    fprintf('Aligning topic times ...')
    %y(2:3,:) = alignTime(y2,yt2,yt);
    y(2:3,:) = zeroOrderHold(y2,yt2,yt);
    u = zeroOrderHold(u,ut,yt);
    fprintf('done\n')

    %% Fix Yaw (this will cause sys ID issues)
    y(1,:) = fixYaw(y(1,:)); % needs to loop around.
    y(1,:) = y(1,:)*180/pi;

    % convert "heading" to radians
%     u(1,:) = u(1,:)*pi/180;
    u(2,:) = min(u(2,:)+.514, 2.5*ones(1,size(u,2)));
    
    
%     if strcmp(mode,'n4sid')
%         % pre-process data
%         u_out = u(1:2,:);
%         y_out = y;
%         y_out(3,:) = y_out(3,:) - u(3,:); % normalize output by input
%     else
%         u_out = u;
%         y_out = y;
%     end
%     
%    sample = 1:20:2500;
%    y_out = y_out(:,sample);
%    u_out = u_out(:,sample);
%     % Store output data for system identifcation
% %     dat = iddata(y_out',u_out',yt(2)-yt(1));
%       dat = iddata(y_out', u_out',1.0);
%       fprintf('Yo');
end

function y = fixYaw(y)
    for n = 2:size(y,2)
        delta = [y(n) - y(n-1) , ...
                 y(n) - y(n-1) + 2*pi, ...
                 y(n) - y(n-1) - 2*pi];
        [~,idx] = min(abs(delta));
        y(n) = y(n-1) + delta(idx);
    end
end


function y = zeroOrderHold(yin,ytin,yt)
    
    y = nan(size(yin,1),numel(yt));

    n = 1;
    for j = 1:numel(ytin)
        while yt(n) <= ytin(j)
            y(:,n) = yin(:,j);
            n = n + 1;
            if n > numel(yt)
                break
            end
        end
        if n > numel(yt)
            break
        end
    end

    while n <= numel(yt)
        y(:,n) = yin(:,end);
        n = n + 1;
    end

end


