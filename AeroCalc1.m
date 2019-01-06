clear
clc

% Aero Calculations

%% Aircraft and Air Properties

weight = 4.5;                   % Kg       Full take-off, cruise weight
V = 9;                          % m/s      Velocity
p = 100000;                     % Pa       Pressure
T = 300;                        % K        Temperature
R = 287;                        % J/Kg/K   Gas Constant
density = 1.161;                % kg/m^3   Density
g = 9.807;                      % m/s^2    Gravity
    q = density*V^2/2;          % Pa       Kinematic Viscosity

    
b = 2.438;                      % m        Wing Span
tipchord = 0.366;               % m        Tip Chord Length
rootchord = 0.366;              % m        Root Chord Length


    S = ((tipchord + rootchord)* b)/2;        % m^2    Wing Area
    AR = b^2 / S;                             %        Aspect Ratio
    taper = tipchord / rootchord;             %        Taper Ratio
    geochord = (rootchord / 2)*(taper + 1);   % m      Mean Geometric Chord
    aerochord = (2/3)* rootchord ...
        *((1 + taper + taper^2) / ...
        (1 + taper));                         % m      Mean Aerodynamic Chord
delta = 0.09;                                 %        Input Delta from Delta vs Taper Ratio graph
    e = 1/(1 + delta);                        %        Span Efficiency Factor

    
    a = sqrt(density * R * T);                % m/s      Speed of Sound
    M = V/a;                                  %          Mach Number
u = 1.850e-5;                                 % kg/m/s   Dynamic Viscosity
    Re = density * V * (aerochord/u);         %          Reynold's number
    
    
%% Aircraft Performance 

RequiredCL = (2 * weight * g) / ...
    (S * density * V^2);                      %          Lift Coefficient Required for SLUF according to given weight


disp ([ 'For ' num2str( weight ) ' kg, required Lift Coefficient is ' num2str( RequiredCL ) ' for cruise conditions.' ])



    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    