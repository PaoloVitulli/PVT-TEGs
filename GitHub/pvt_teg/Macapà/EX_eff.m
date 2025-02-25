function EX_eff  = EX_eff(PV_power, TEG_power, T_ext, Irr_norm)

%Sun temperature [K]
T_sun = 5777; 

%Pump consumption [W]
Pump_cons = 0.000697;

%Area panel [m^2]
A_panel = 1.62; 

EX_eff = (PV_power + TEG_power - Pump_cons)/(Irr_norm*A_panel*(1-(4/3)*(T_ext/T_sun)+(1/3)*(T_ext/T_sun)^4));

end