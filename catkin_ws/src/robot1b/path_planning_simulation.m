%% 2.12 Path Planning Simulation
%Travis Libsack, Team 1b
%10/25/2016
%{
Used to create path_points using the following inputs:
    1. waypoints
    2. goal points
    4. obstacles
    5. robot size
Taking all of these into account the function uses a spline for waypoints
%}

close ALL;
clear ALL;
format COMPACT;

%% Definitions
%define the map starting at the bottom right corner (positive UP and RIGHT)
%map dimensions are in [mm]
%dimesions are: [x y w h] for the MATLAB rectangle() function

%arena size
arena = [0,0,3658,2438]; %[mm]

%goal box
tote = [914,0,610,356]; %[mm]

task_box = [406,406]; %[mm]
start_box = [559,457]; %[mm]

%task boxes
task1 = [arena(3)-task_box(1), 457-task_box(2), task_box];  %bottom RIGHT of map
task2 = [406,arena(4) - 457,task_box];                      %top LEFT of map
task3 = [1219+406,arena(4) - 457,task_box];                 %top MIDDLE of map

%starting boxes
start1 = [1219*2 + 330,arena(4)-start_box(2),start_box]; %top right
start2 = [330,arena(4) - 1397, start_box];               %middle left
start3 = [330+1219,arena(4)-1397, start_box];            %middle middle

%robot dimensions
robot_box = [457,356]; %[mm]
robot_buffer = 25; %[mm]
robot_start_center = [1219*2 + 330 + ceil(start_box(1)/2),arena(4)-ceil(start_box(2)/2)]; %[mm]

robot_box_buffer = robot_box + robot_buffer;


%obstacles (3 fixed, 3 variable -- to be updated later)
obstacles = [1,2];


%% Waypoints
%set by user -- later to be input into the system
%must fall in the arena dimensions
%in order from robot to goal

%example taking obstacles as above
%given in order of achievment

%%%%%%% TASK 2 %%%%%%%
task2_straight = [[task2(1) + .5*task2(3), arena(4) - task2(4) - 600];[task2(1) + .5*task2(3), arena(4) - task2(4) - 300];[task2(1) + .5*task2(3),arena(4) - task2(4)]];
task2_waypoints = [[robot_start_center(1),robot_start_center(2)];[start2(1) + ceil(.5*start2(3)), start2(2) + ceil(.5*start2(4))];[start3(1) + ceil(.5*start3(3)), start3(2) + ceil(.5*start3(4))];task2_straight];
%%%%%%%%%%%%%%%%%%%%%%

%% Draw
%draw the map using MATLAB
hold on;
rectangle('Position',arena,'LineWidth',5);
rectangle('Position',tote,'FaceColor','red');
rectangle('Position',task1, 'EdgeColor', 'green','LineWidth',1);
rectangle('Position',task2, 'EdgeColor', 'green','LineWidth',1);
rectangle('Position',task3, 'EdgeColor', 'green','LineWidth',1);
rectangle('Position',start1,'FaceColor','Blue');
rectangle('Position',start2,'FaceColor','Blue');
rectangle('Position',start3,'FaceColor','Blue');
plot(robot_start_center(1),robot_start_center(2),'r*');
rectangle('Position', [start1(1) + 51, start1(2) + 51, robot_box_buffer], 'Curvature', [1 1], 'LineStyle', '--');
axis([0,3658,0,2438]);

%plot gridlines
plot([1219,1219],[0,2438],'b');
plot(2*[1219,1219],[0,2438],'b');
plot([0,3658],[2438-914,2438-914],'b');
plot([0,3658],[584,584],'b');
plot(task2_waypoints(:,1),task2_waypoints(:,2),'r*');
