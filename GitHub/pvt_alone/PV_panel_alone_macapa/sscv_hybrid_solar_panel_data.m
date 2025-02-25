
% This script assigns the parameter values to MATLAB(R) workspace variables
% for use by the example model ee_hybrid_solar_panel. 
% The default values for the solar cells and the pipe are frequently found in datasheets.
% Design parameters that affect optimization, include
% load resistance, tank volume, and pump flows.

% Copyright 2019 The MathWorks, Inc.

%% Parameter structures -------------------------------
load = struct();
panel = struct();
pipe = struct();
tank = struct();
pumps = struct();
teg = struct();


%% TEG parameters --------------------------------------

teg.A = 0.0016; %Area of single TEG in m^2

%% Load parameters ------------------------------------

load.R = 4.5;  %Resistance. With default parameters, 4.5 Ohm is approximately optimal for maximum electrical power extraction


%% Solar panel parameters ------------------------------

% Initial temperatures [K]
panel.initial.Tg0 = 295;  %Glass cover
panel.initial.Tpv0 = 295; %PV cells
panel.initial.Te0 = 295;  %Heat exchanger
panel.initial.Tw0 = 295;  %Water in the tank
panel.initial.Tb0 = 295;  %Back cover

% Geometry
panel.geometry.Acell = 0.0225; %Area of a cell, [m^2]
panel.geometry.Ncell = 72; %Number of cells

% Optical properties
panel.optical.ng = 1.52;  %Refractive index ratio glass/air
panel.optical.absg = 0.2; %Absorption coefficient of glass per unit length [1/m]
panel.optical.dg = 0.01;  %Thickness of glass cover [m]
panel.optical.rpv = 0.15; %Reflection factor of PV cell

% Heat transfer properties
panel.heatTransfer.Ta = 295;  %Temperature of ambient air [K]
panel.heatTransfer.Tsky = 290;%Temperature of sky (for radiative heat transfer) [K]

panel.heatTransfer.Mg = 4;     %Mass of glass cover [kg]
panel.heatTransfer.Mpv = 0.2;  %Mass of one PV cell [kg]
panel.heatTransfer.Me = 15;    %Mass of heat exchanger [kg]
panel.heatTransfer.Mb = 6.32;  %Mass of back insulator [kg]
panel.heatTransfer.Mbs = 1.11; %Mass of backsheet [kg]
 
panel.heatTransfer.Cg = 800;   %Specific heat of glass [J/kg/K]
panel.heatTransfer.Cpv = 200;  %Specific heat of PV cell [J/kg/K]
panel.heatTransfer.Ce = 460;   %Specific heat of heat exchanger [J/kg/K]
panel.heatTransfer.Cb = 1030;  %Specific heat of back insulator [J/kg/K]
panel.heatTransfer.Cbs = 1200; %Specific heat of backsheet [J/kg/K]

panel.heatTransfer.epsg = 0.75; %Emissivity of glass
panel.heatTransfer.epspv = 0.7; %Emissivity of PV cell
        
panel.heatTransfer.hga = 10;  %Free convection coefficient between glass and ambient air [W/m^2/K]
panel.heatTransfer.hgpv = 20; %Free convection coefficient between PV cells and glass [W/m^2/K]
panel.heatTransfer.hba = 5;   %Free convection coefficient between back cover and ambient air [W/m^2/K]
        
panel.heatTransfer.ke = 130;   %Thermal conductivity of heat exchanger [W/m/K]
panel.heatTransfer.Le = 0.04;  %Thickness of heat exchanger [m]

panel.heatTransfer.kins = 0.034;  %Thermal conductivity of insulation layer [W/m/K] - Rockwool Floorrock Acoustic CP3
panel.heatTransfer.Lins = 0.03;   %Thickness of insulation layer [m]
panel.heatTransfer.rho_ins = 130; %Density of insulator [kg/m3]
panel.heatTransfer.Cp_is = 1500;  %Specific heat of insulation layer. 

panel.heatTransfer.eps1 = 0.9;       %Emissivity of Rockwool
panel.heatTransfer.eps2 = 0.93;      %Emissivity of bricks and plaster

% PV cell electrical properties
panel.pv.Isc = 8.88; % Short-circuit current, Isc [A]
panel.pv.Voc = 0.62;% Open-circuit voltage, Voc [V]
panel.pv.Is  = 1e-6; % Diode saturation current, Is [A]
panel.pv.Is2 = 0; % Diode saturation current, Is2 [A]
panel.pv.Iph0 = 8.88;% Solar-generated current for measurements, Iph0 [A]
panel.pv.Ir0 = 1000;% Irradiance used for measurements, Ir0 [W/m^2]
panel.pv.ec = 1.5; % Quality factor, N
panel.pv.N2 = 2; % Quality factor, N2
panel.pv.Rs = 0;  % Series resistance, Rs [Ohm]
panel.pv.Rp = inf ; % Parallel resistance, Rp [Ohm]
panel.pv.TIPH1 = 0; % First order temperature coefficient for Iph, TIPH1 [1/K]
panel.pv.EG  = 1.11;% Energy gap, EG [eV]
panel.pv.TXIS1 = 3;% Temperature exponent for Is, TXIS1
panel.pv.TXIS2 = 3;% Temperature exponent for Is2, TXIS2
panel.pv.TRS1 = 0;% Temperature exponent for Rs, TRS1
panel.pv.TRP1 = 0;% Temperature exponent for Rp, TRP1
panel.pv.Tmeas = 25; % Measurement temperature [degC]


%% Pipe parameters ----------------------------------------

pipe.hx = 14.4;      % Pipe length of heat exchanger [m]
pipe.length = 1.5;   % Pipe length [m]
pipe.hx_eq_length = 5.42; %Equivalent length of local losses of heat exchanger [m]
pipe.eq_length1=1.40;     %Equivalent length of local losses of pipe going into tank [m]
pipe.eq_length2=1.61;     %Equivalent length of local losses of pipe coming from tank [m]
pipe.area = 0.0007;       % Cross-sectional area [m^2]
pipe.Dh = 0.03;           % Hydraulic diameter [m]
pipe.length_add = 1;      % Aggregate equivalent length of local resistances [m]
pipe.roughness = 15e-6;   % Internal surface absolute roughness [m]
pipe.Re_lam = 2000;       % Laminar flow upper Reynolds number limit
pipe.Re_tur = 4000;       % Turbulent flow lower Reynolds number limit
pipe.shape_factor = 64;   % Shape factor for laminar flow viscous friction
pipe.Nu_lam = 3.66;       % Nusselt number for laminar flow heat transfer
pipe.emiss = 0.09;        %Emissivity of Alluminium
pipe.emiss_bricks = 0.93; %Emissivity of bricks and plaster

%% Tank params -------------------------------------------

tank.Volmax = 0.13;     % Maximum tank capacity [m^3]
tank.Atank = 0.2827;    % Tank cross-sectional area [m^2]
tank.Voltank0 = 0.0972; % Initial volume in the tank [m^3]
tank.Ttank0 = 295;      % Initial temperature in the tank [K]
tank.Lins = 0.05;       % Insulating layer thickness [m] - Cod. 128 Rockwool 
tank.kins = 0.039;      % Thermal conductivity of insulation layer [W/m/K]
tank.hta = 10;          % Free convection coefficient between tank and ambient air [W/m^2/K]
tank.insul_mass = 1.5;  % Mass of insulator [kg]
tank.spec_heat = 1030;  % Specific heat of insulator [J/kgK]


%% Pump flow input params --------------------------------

pumps.mdot_int = 0.02; % Internal circuit mass flow rate [kg/s]
pumps.mdot_dem = 0.005; % Demand mass flow rate (to the sink) [kg/s]
pumps.mdot_sup = 0.005; % Supply mass flow rate (from the source) [kg/s]

