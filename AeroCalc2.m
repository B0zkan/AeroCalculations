
% Aero Calculations

%% CoolProp & Air Properties

g = 9.807;                                                   % m/s^2     Gravity
R = 287;                                                   % J/Kg/K    Gas Constant
V = input ('Please input Cruise Speed in m/s: ');          % m/s       Velocity
P = input ('Please input Pressure in Pa: ');               % Pa        Pressure
T = input ('Please input Temperature in K: ');             % K        Temperature



[v,e] = pyversion; system([e,' -m pip install --user -U CoolProp']);   %cool props install
import py.CoolProp.CoolProp.PropsSI;                                   %cool props install

density   = PropsSI('D','T',T,'P',P ,'Air');                        %           Density
a         = PropsSI('speed_of_sound','T',T,'P',P,'Air');                  % m/s       Speed of sound
viscosity = PropsSI('viscosity','T',T,'P',P,'Air');               %           Dynamic Viscosity
q   =     viscosity/density;                                           %           Kinematic Viscosity
M   =     V/a; 

disp (['Operating Mach numer is: ' num2str(M)]);
disp (['density: ' num2str( density ) ]);
disp (['kinematic viscosity: ' num2str( q )]);
disp (['speed of sound: ' num2str( a ) ' m/s']);

%% Aircraft parameters

weight = input ('Please input take-off weight: ');         % Kg    Full take-off, cruise weight
b = input ('please input wingspan in m: ');                   % m        Wing Span
tipchord  = input ('please input tipchord in m: ');           % m        Tip Chord Length
rootchord = input ('please input rootchord in m: ');          % m        Root Chord Length
S = ((tipchord + rootchord)* b)/2;            % m^2    Wing Area
AR = b^2 / S;                                 %        Aspect Ratio
taper = tipchord / rootchord;                 %        Taper Ratio
geochord = (rootchord / 2)*(taper + 1);       % m      Mean Geometric Chord
aerochord = (2/3)* rootchord ...
    *((1 + taper + taper^2) / ...
    (1 + taper));                             % m      Mean Aerodynamic Chord
delta = 0.09;         %%%%%%% get this from add-on                     %        Input Delta from Delta vs Taper Ratio graph
e = 1/(1 + delta);                            %        Span Efficiency Factor    

Re = density * V * (aerochord/q);             %          Reynold's number

    
    
    %% from milestone 2

RequiredCL = (2 * weight * g) / ...
    (S * density * V^2);                      %          Lift Coefficient Required for SLUF according to given weight

disp ([ 'minimum required Lift Coefficient is ' num2str( RequiredCL ) ' for cruise conditions.' ])
    
disp ('Please input following data from XFLR5 graph');
CL_max = input ('please input max lift coefficient value for wing: ');


%{    
vstall = sqrt(( 2 * weight ) / ( density * S * CLmax ));    % Stall Velocity
vlanding = 1.15 * vstall ;                                  % Landing Velocity
gliderange = 400 * (L/D_max);                               
disp [('gliding range from 400ft is '
%}
    



    
    
    
    
    
    