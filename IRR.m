T = readtable('Filtros_Prueba_Proyecto_DSP_Entregable (2).xlsx','Sheet','Filtro IIR 1');
valores= cellfun(@str2double,T.Valores);
coeficiente= [T.Coeficiente];
okb= 1;
oka= 1;
for i= 1:length(valores)
    if contains(coeficiente{i}, 'b')
       b(okb)=valores(i);
       okb= okb+1;
    elseif contains(coeficiente{i}, 'a')
         a(oka)=valores(i);
         oka= oka+1;
    end
end

ami = transpose (readmatrix('Filtros_Prueba_Proyecto1_DSP_Entregable.xlsx', 'Sheet','Filtro IIR 1','Range','B13:B18'));
bmi = transpose (readmatrix('Filtros_Prueba_Proyecto1_DSP_Entregable.xlsx', 'Sheet','Filtro IIR 1','Range','B6:B11'));