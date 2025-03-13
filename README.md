# Vehicle-Modelling
## Pseudo code for pure pursuit model

> point mass model <br>
> single lap with variable (maximum) velocity <br>
> no tire limiting - simple max velocity/angular velocity constraint<br>
> 

Loop till 0.1 metres within goal position

Pure Pursuit Model Pseudocode:

set starting point (x,y)
set heading as a
define maximum lookahead distance as L

---x---

while model has not reached finish line:

look for nearest waypoint
set value of distance from waypoint as L_d

s = atan(2 * L * sin(α) / L_d)
where α is the angle between target point and the heading

apply steering angle = s

update the position as (x1,y1)


