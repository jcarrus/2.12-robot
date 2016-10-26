#!/usr/bin/python

#2.12 path planning

#standard imports
import rospy
import tf
import numpy as np
import threading
import serial
import pdb
import traceback
import sys
import tf.transformations as tfm
import pygame

from me212bot.msg import WheelVelCmd
from pr_apriltags.msg import AprilTagDetections
import helper


############### PLAYING FIELD DIMENSIONS ######################
'''
dimensions measured from the top left of the map (positive x & positive y are down)
units in [mm]
'''
###############################################################

arena = [[0,0],[3658,2438]]
tote = [[914,2438-356],[914+610,2438-356]]

#staring boxes
start_box1 = [[3658-1219+330,0],[3658-1219+330+559,457]]
start_box2 = [[330,1397-457],[330+559,1397]]
start_box3 = [[1219+330,1397-457],[1219+330+559,1397]]

#goal boxes
goal_box1
goal_box2
goal_box3

#robot dimensions
robot_size = [457,356]
robot_buffer = 25

#obstacles
obstacle_buffer = 25

#choose your waypoints (calculated to avoid obstacles??? -- maybe manual for now)
waypoints = []

#formula used to connect waypoints, to be solved between each set of waypoints
spline = x^3-x^2+x +2


#loop to calculate the path points using the spline and waypoints
loop




#ouput of points along the robots intended path
path_points = 








