# Vehicle-Modelling
## Pseudo code for pure pursuit model

> point mass model <br>
> single lap with variable (maximum) velocity <br>
> no tire limiting - simple max velocity/angular velocity constraint for now <br>
> two lookahead distances - 0.1 metres for steering angle, and 5 metres for braking point (corner approach) <br>
> motor model (speed data to rpms, to torque/power outputs + current drawn / battery loading estimation


set starting point (x,y)
set heading as a
pose = (x, y, a)
define maximum lookahead distance as L
define desired linear velocity as v (vector)
define maximum angular velocity as w
define waypoints
set timeStep
---x---

while model has not reached finish line:

v, w= output from controller, input=pose

update x as x + v*cos(a)*timeStep
update y as y + v*sin(a)*timeStep
update a as a + w*timeStep


update pose
