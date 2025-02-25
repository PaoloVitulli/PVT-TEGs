clc
clear 

pvt_tegs_data
meteo_data_struct

% set_param('pvt_tegs_macapa', 'AlgebraicLoopSolver', 'Auto')

Np = [4, 8, 12, 16, 20, 24, 28, 32, 36, 40, 44, 48, 52, 56, 60, 64, 68, 72, 76, 80, 84, 88, 92, 96, 100];

in = 172801;  %Time start of calculus of variables of interest
months = {'January','February','March', 'April','May','June','July','August','September','October','November','December'};

for m = 1:length(months)
    month = months{m};
    Irradiance_si_month = Irradiance_si.(month);
    Irradiance_ts_month = Irradiance_ts.(month);
    T_ext_month = T_ext.(month);
    Inclination_month = Inclination.(month);
    Tm_month = mean(T_ext.(month));

for i=1:length(Np)
    teg.Np = Np(i);
    teg.Ns = 1;
    teg.A_tot=teg.Ns*teg.Np*teg.A; 
    simOut(i)=sim("pvt_tegs_macapa.slx");
    T_sun = 5777; 

    tempo=[0:86400];

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
    Max_PV_temp(i) = max(simOut(i).T_panel.signals.values(in:end));
    min_PV_temp(i) = min(simOut(i).T_panel.signals.values(in:end));

    Energy_TEG(i) = trapz(tempo, simOut(i).TEG_power.signals.values(in:end));
    PV_energy(i) = trapz(tempo, simOut(i).PV_power.signals.values(in:end)); 
    PV_TEG_energy(i) = trapz(tempo, simOut(i).Total_power.signals.values(in:end));

    Irg(i) = trapz(tempo, simOut(i).Irr.signals.values(in:end)); 
    Qh(i) = trapz(tempo, simOut(i).Q_teg.signals.values(in:end));

    PV_eff(i) = trapz(tempo, simOut(i).PV_power.signals.values(in:end))/trapz(tempo, simOut(i).Irr.signals.values(in:end));
    TEG_eff(i) = trapz(tempo, simOut(i).TEG_power.signals.values(in:end))/trapz(tempo, simOut(i).Q_teg.signals.values(in:end));
    PVT_TEG_eff(i) = PV_TEG_energy(i)/ Irg(i);

    Irg_ex(i) = trapz(tempo, simOut(i).Irr.signals.values(in:end).*(1-(4/3).*(simOut(i).Text.signals.values(in:end)./T_sun)+(1/3).*(simOut(i).Text.signals.values(in:end)/T_sun).^4));
    EX_eff(i) = (Energy_TEG(i)+PV_energy(i))/Irg_ex(i);
    EX_pv_eff(i) = PV_energy(i)/Irg_ex(i);
    EX_TEG_eff(i) = Energy_TEG(i)/trapz(tempo, (1-simOut(i).Text.signals.values(in:end)./simOut(i).Th.signals.values(in:end)).*simOut(i).Q_teg.signals.values(in:end));

end

 filename = sprintf('%s.mat', month);
 save(filename, '-v7.3');

end
