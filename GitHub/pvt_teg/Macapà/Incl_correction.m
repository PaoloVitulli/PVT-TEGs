nomi_campi = fieldnames(Inclination);

for i = 1:numel(nomi_campi)
    campo_corrente = nomi_campi{i};
    valori = Inclination.(campo_corrente);
    for j = 1:length(Inclination.(campo_corrente))
        if Inclination.(campo_corrente)(j) < pi/2
            Inclination.(campo_corrente)(j) = Inclination.(campo_corrente)(j);
        elseif Inclination.(campo_corrente)(j) >= pi/2
            Inclination.(campo_corrente)(j) = pi/2;
        end
    end
end
