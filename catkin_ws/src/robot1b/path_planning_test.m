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


%% Definitions
%define the map starting at the top left corner (positive DOWN and RIGHT)
%map dimensions are in [mm]

arena = [[0,0];[3658,2438]]; %[mm]


