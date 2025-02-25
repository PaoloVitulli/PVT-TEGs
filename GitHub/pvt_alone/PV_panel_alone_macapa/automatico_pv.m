clear
clc

sscv_hybrid_solar_panel_data
meteo_data_struct

in = 172801;  %Time start of calculus of variables of interest

months = {'January', 'February', 'March', 'April', 'May', 'June', ...
          'July', 'August', 'September', 'October', 'November', 'December'};

for i=1:length(months)
    month=months{i}; 
    inclination = Inclination.(month);
    irradiance_si = Irradiance_si.(month);
    irradiance_ts = Irradiance_ts.(month);
    t_ext = T_ext.(month);

    simOut(i)=sim("solar_panel.slx");
    
    T_sun = 5777; 

    tempo=[0:86400];

    Max_PV_power(i)=max(simOut(i).PV_power.signals.values(in:end));
    Mean_PV_power(i)=mean(simOut(i).PV_power.signals.values(in:end));
 
    MeanPV_temp(i) = mean(simOut(i).T_panel.signals.values(in:end));
    Max_PV_temp(i) = max(simOut(i).T_panel.signals.values(in:end));
    min_PV_temp(i) = min(simOut(i).T_panel.signals.values(in:end));

    PV_energy(i) = trapz(tempo, simOut(i).PV_power.signals.values(in:end)); 

    Irg(i) = trapz(tempo, simOut(i).Irr.signals.values(in:end)); 
    PV_eff(i) = trapz(tempo, simOut(i).PV_power.signals.values(in:end))/Irg(i);
    
    Irg_ex(i) = trapz(tempo, simOut(i).Irr.signals.values(in:end).*(1-(4/3).*(simOut(i).Text.signals.values(in:end)./T_sun)+(1/3).*(simOut(i).Text.signals.values(in:end)/T_sun).^4));
    EX_pv_eff(i) = PV_energy(i)/Irg_ex(i);
    
end