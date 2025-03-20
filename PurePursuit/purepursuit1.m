clc; clear; close all;

%% Define Race Track Waypoints (XY Coordinates)
waypoints = [0 0; 10 2; 20 5; 30 10; 40 18; 50 30; 60 45; 70 60]; % Racing line

%% Create a Pure Pursuit Controller
controller = robotics.PurePursuit;
controller.Waypoints = waypoints; % Assign waypoints
controller.LookaheadDistance = 1.5; % Tune lookahead distance
controller.DesiredLinearVelocity = 30.0; % Set racecar speed (m/s)
controller.MaxAngularVelocity = 2.0; % Max turning rate of vehicle(rad/s)

%% Initialize Racecar State (x, y, theta)
pose = [0, 0, 0]; % Start position (x, y) and heading (theta)

% Set Simulation Parameters
sampleTime = 0.1; % Time step (s)
goalRadius = 2.0; % Define goal completion threshold
distanceToGoal = norm(pose(1:2) - waypoints(end, :)); % Distance to final point
positions = pose; % Store trajectory
fricLim=3;
TorqueLim=58;
VeloLim=20;
mass=300;
MaxPow=42000;

%% Simulation Loop
figure; hold on; grid on;
plot(waypoints(:,1), waypoints(:,2), 'k--', 'LineWidth', 2); % Plot track
xlabel('X Position (m)'); ylabel('Y Position (m)');
title('Racecar Path Tracking using Pure Pursuit');
v=[];
acc=[];

while distanceToGoal > goalRadius
    % Compute Control Commands
    [v(end+1), omega] = controller(pose);
    %vel(v(end), acc(end), mass, MaxPow)

    
    
    % Update Racecar State Using Bicycle Model
    theta = pose(3);
    pose(1) = pose(1) + v(end) * cos(theta) * sampleTime; % Update x
    pose(2) = pose(2) + v(end) * sin(theta) * sampleTime; % Update y
    pose(3) = pose(3) + omega * sampleTime; % Update heading

    % Store Position History
    positions = [positions; pose];

    % Recalculate Distance to Goal
    distanceToGoal = norm(pose(1:2) - waypoints(end, :));

    % Plot Current Position
    plot(pose(1), pose(2), 'ro', 'MarkerFaceColor', 'r'); % Racecar position
    pause(0.05);

    % Estimate Acceleration
    if length(v)>=2
        acc(end+1)=(v(end)-v(end-1))/sampleTime;
    end
    
    % Power Limit
    w1=v/0.22; %angular velocity
    rpm=60*w1/(2*3.14);

    if norm(pose(1:2) - waypoints(end, :)) < norm(pose(1:2) - waypoints(end-1, :))
end

disp('Race Completed!');

function vel = calc_vel_limit(a,v,m,p)
    while v(end)>VeloLim || a*v(end)<=(p/m)
        a=(v(end)-0.1)/sampleTime
        v(end)=v(end)-0.1
    end
end