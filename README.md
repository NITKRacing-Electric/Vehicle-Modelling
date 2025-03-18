# Vehicle-Modelling
## Pseudo code for pure pursuit model

> point mass model <br>
> single lap with variable (maximum) velocity <br>
> no tire limiting - simple max velocity/angular velocity constraint for now <br>
> two lookahead distances - 0.1 metres for steering angle, and 5 metres for braking point (corner approach) <br>
> motor model (speed data to rpms, to torque/power outputs + current drawn / battery loading estimation) <br>

<code>
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
</code>

<br>
<br>


more calculations involving:  <br>
  1. velocity estimation  <br>
  2. acceleration estimation  <br>
  3. limiting of velocity and acceleration values due to tire and power limits  <br>
  4. power/torque/rpm graphs  <br>
  5. without affecting the tire limits and other vehicle paramters for now:  <br>
      1. load transfer  <br>
      2. tire slip  <br>

## random data (estimates)
lf = 1.5; % m - length from center to front <br>
lr = 1.5; % m - length from center to rear <br>
tf = 1; % m - track width from center to one edge (front) <br>
tr = 1; % m - track width from center to one edge (rear) <br>
wr = 0.22; % m - wheel radius <br>
C3 = 0.52; % N/kg - coefficient for dry asphalt <br>
C2 = 23.99; % N/kg - coefficient for dry asphalt <br>
C1 = 1.28; % N/kg - coefficient for dry asphalt <br>
hCG = 0.6; % m - height of COG above ground <br>
M = 300; % kg - Mass of the car <br>
C_roll = 0.01; % none - rolling resistance coefficient for dry asphalt <br>
rho = 1.223; % kg/m^3 - air density <br>
frontal_area = 1.35; % m^2 frontal area <br>
C_d = 0.89; % aerodynamic drag coefficient <br>
I_w = 1.5; % Kg m^2 - inertia of the wheel <br>
b = 0.1; % Kg m^2 - damping factor of the wheel <br>
Izz = 3000; % Kg m^2 - Inertia of car about z-axis <br>
g = 9.8; % m/s^2 - acceleration due to gravity <br>

## Electrical

define mechanical power as P1\
define revolutions per minute as rpm\
define angular velocity as w1\
define current as I\
define electrical power as P2\
define velocity as V\
define T1 as total time\
define Eb as back emf\
rpm= 6*v/wr\
w1= 2*3.14*rpm/60\
I=T*2*3.14*rpm/(60*Eb)\
P1 = T*w1\
P2= sum(times(V,I))/T1\
