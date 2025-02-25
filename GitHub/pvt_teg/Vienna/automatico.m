
sscv_hybrid_solar_panel_data
meteo_data_struct

N = [1, 2, 4, 6, 8, 10, 12, 16, 20, 30, 60, 100];
in = 86400;  %Time start of calculus of variables of interest

for i=1:length(N)
    teg.N = N(i);
    teg.A_tot=teg.N*teg.A; 
    simOut(i)=sim("sscv_hybrid_solar_panel.slx")

    Max_TEG_power(i)=max(simOut(i).TEG_power.signals.values(in:end));
    min_Teg_power(i)=min(simOut(i).TEG_power.signals.values(in:end));
    Mean_TEG_power(i)=mean(simOut(i).TEG_power.signals.values(in:end));

    Max_V_TEG(i)=max(simOut(i).TEG_voltage.signals.values(in:end));    
    min_V_TEG(i)=min(simOut(i).TEG_voltage.signals.values(in:end));
    Mean_V_TEG(i)=mean(simOut(i).TEG_voltage.signals.values(in:end));

    Max_dt_TEG(i)=max(simOut(i).TEG_dt.signals.values(in:end));
    min_dt_TEG(i)=min(simOut(i).TEG_dt.signals.values(in:end));
    Mean_dt_TEG(i)=mean(simOut(i).TEG_dt.signals.values(in:end));

    Max_PV_power(i)=max(simOut(i).PV_power.signals.values(in:end));
    Mean_PV_power(i)=mean(simOut(i).PV_power.signals.values(in:end));
 
    MeanPV_temp(i) = mean(simOut(i).T_panel.signals.values(in:end));
    
end


