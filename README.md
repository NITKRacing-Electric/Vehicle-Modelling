# Vehicle-Modelling
## Pseudo code for pure pursuit model

> point mass model <br>
> single lap with variable (maximum) velocity <br>
> no tire limiting - simple max velocity/angular velocity constraint for now <br>
> two lookahead distances - 0.1 metres for steering angle, and 5 metres for braking point (corner approach) <br>
> motor model (speed data to rpms, to torque/power outputs + current drawn / battery loading estimation) <br>


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

update x as x + v×cos(a)×timeStep

update y as y + v×sin(a)×timeStep

update a as a + w×timeStep


update pose


## random data (estimates)
lf = 1.5; % m - length from center to front
lr = 1.5; % m - length from center to rear
tf = 1; % m - track width from center to one edge (front)
tr = 1; % m - track width from center to one edge (rear)
wr = 0.22; % m - wheel radius
C3 = 0.52; % N/kg - coefficient for dry asphalt
C2 = 23.99; % N/kg - coefficient for dry asphalt
C1 = 1.28; % N/kg - coefficient for dry asphalt
hCG = 0.6; % m - height of COG above ground
M = 300; % kg - Mass of the car
C_roll = 0.01; % none - rolling resistance coefficient for dry asphalt
rho = 1.223; % kg/m^3 - air density
frontal_area = 1.35; % m^2 frontal area
C_d = 0.89; % aerodynamic drag coefficient
I_w = 1.5; % Kg m^2 - inertia of the wheel
b = 0.1; % Kg m^2 - damping factor of the wheel
Izz = 3000; % Kg m^2 - Inertia of car about z-axis
g = 9.8; % m/s^2 - acceleration due to gravity
