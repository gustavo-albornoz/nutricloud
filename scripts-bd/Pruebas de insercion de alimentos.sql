
use nutricloud_datos_crudos
go
/************** CARNES **************/
UPDATE Carnes SET [Carbohidratos totales] = REPLACE([Carbohidratos totales],'.','')
UPDATE Carnes SET [Carbohidratos totales] = 0 WHERE [Carbohidratos totales] IS NULL
UPDATE Carnes SET [Carbohidratos totales] = 0 WHERE [Carbohidratos totales] = ''
UPDATE Carnes SET [Carbohidratos totales] = 0 WHERE [Carbohidratos totales] = ''
UPDATE Carnes SET [Zinc] = 0 WHERE [Zinc] = ''
UPDATE Carnes SET [Carbohidratos totales] = 0 WHERE [Carbohidratos totales] IS NULL
UPDATE Carnes SET [Zinc] = 0 WHERE [Zinc] IS NULL

INSERT INTO nutricloud..alimento (nro,alimento,energia_kj,energia_kcal,agua_g,proteinas_g,grasa_total_g,carbohidratos_totales_g,cenizas_g,sodio_mg
,potasio_mg,calcio_mg,fosforo_mg,hierro_mg,zinc_mg,tiamina_mg,rivoflavina_mg,niacina_mg,vitamina_c_mg,porcion,id_alimento_tipo)
Select [ Nº],[Alimento],[Energía],[Energía1],[Agua],[Proteínas],[Grasa Total],[Carbohidratos totales],[Cenizas],[Sodio],[Potasio],[Calcio]
,[Fósforo],[Hierro],[Zinc],[Tiamina],[Rivoflavina],[Niacina],[Vitamina C],[Porcion g],1
from Carnes

/************** CARNESAG **************/
INSERT INTO nutricloud..alimento (nro,alimento,grasa_total_g,ac_grasos_saturados_g,ac_grasos_monoinsaturados_g,ac_grasos_poliinsaturados_g,agp_w6_g,agp_w3_g
,colesterol_mg,porcion,id_alimento_tipo)
select [ Nº],[Alimento],[Grasa Total],[Ac# grasos saturados],[Ac# grasos monoinsaturados],[Ac# grasos poliinsaturados]
,[AGPw6],[AGPw3],[Colesterol],[Porcion g],1
from CarnesAG

/************** CEREALES **************/
INSERT INTO nutricloud..alimento (nro,alimento,energia_kj,energia_kcal,agua_g,proteinas_g,grasa_total_g,carbohidratos_totales_g,carbohidratos_disponibles_g
,fibra_dietetica_g,cenizas_g,sodio_mg,potasio_mg,calcio_mg,fosforo_mg,hierro_mg,zinc_mg,tiamina_mg,rivoflavina_mg,niacina_mg,vitamina_c_mg,porcion,id_alimento_tipo)
select [ Nº],[Alimento],[Energía],[Energía1],[Agua],[Proteínas],[Grasa Total],[Carbohidratos totales],[Carbohidratos disponibles]
,[Fibra dietética],[Cenizas],[Sodio],[Potasio],[Calcio],[Fósforo],[Hierro],[Zinc],[Tiamina],[Rivoflavina],[Niacina],[Vitamina C],[Porcion g],1
from Cereales

/************** FRUTAS **************/
INSERT INTO nutricloud..alimento (nro,alimento,energia_kj,energia_kcal,agua_g,proteinas_g,grasa_total_g,carbohidratos_totales_g,cenizas_g,sodio_mg
,potasio_mg,calcio_mg,fosforo_mg,hierro_mg,zinc_mg,tiamina_mg,rivoflavina_mg,niacina_mg,vitamina_c_mg,porcion,id_alimento_tipo)
Select [ Nº],[Alimento],[Energía],[Energía1],[Agua],[Proteínas],[Grasa Total],[Carbohidratos totales],[Cenizas],[Sodio],[Potasio],[Calcio]
,[Fósforo],[Hierro],[Zinc],[Tiamina],[Rivoflavina],[Niacina],[Vitamina C],[Porcion g],1
from Frutas

/************** GRASAS **************/
UPDATE Grasas SET Agua = 0 WHERE Agua IS NULL
UPDATE Grasas SET Agua = 0 WHERE Agua = ''

INSERT INTO nutricloud..alimento (nro,alimento,energia_kj,energia_kcal,agua_g,grasa_total_g,ac_grasos_saturados_g,ac_grasos_monoinsaturados_g,ac_grasos_poliinsaturados_g
,porcion,id_alimento_tipo)
select [ Nº],[Alimento],[Energía],[Energía1],[Agua],[Grasa Total],[Ac# grasos saturados],[Ac# grasos monoinsaturados],[Ac# grasos poliinsaturados],100,1
from Grasas

/************** HUEVO **************/
UPDATE Huevo SET [Carbohidratos totales] = REPLACE([Carbohidratos totales],'.','')
UPDATE Huevo SET [Carbohidratos totales] = 0 WHERE [Carbohidratos totales] IS NULL
UPDATE Huevo SET [Carbohidratos totales] = 0 WHERE [Carbohidratos totales] = ''

INSERT INTO nutricloud..alimento (nro,alimento,energia_kj,energia_kcal,agua_g,proteinas_g,grasa_total_g,carbohidratos_totales_g,cenizas_g,ac_grasos_saturados_g
,ac_grasos_monoinsaturados_g,ac_grasos_poliinsaturados_g,colesterol_mg,sodio_mg,potasio_mg,calcio_mg,fosforo_mg,hierro_mg,zinc_mg,tiamina_mg,rivoflavina_mg
,niacina_mg,vitamina_c_mg,porcion,id_alimento_tipo)
select [ Nº],[Alimento],[Energía],[Energía1],[Agua],[Proteínas],[Grasa Total],[Carbohidratos totales],[Cenizas],[Ac# grasos saturados],[Ac# grasos monoinsaturados]
,[Ac# grasos poliinsaturados],[Colesterol],[Sodio],[Potasio],[Calcio],[Fósforo],[Hierro],[Zinc],[Tiamina],[Rivoflavina],[Niacina],[Vitamina C],[Porcion g],1
from Huevo

/************** LECHE **************/
INSERT INTO nutricloud..alimento (nro,alimento,energia_kj,energia_kcal,agua_g,proteinas_g,grasa_total_g,carbohidratos_totales_g,cenizas_g,sodio_mg
,potasio_mg,calcio_mg,fosforo_mg,hierro_mg,zinc_mg,tiamina_mg,rivoflavina_mg,niacina_mg,vitamina_c_mg,porcion,id_alimento_tipo)
Select [ Nº],[Alimento],[Energía],[Energía1],[Agua],[Proteínas],[Grasa Total],[Carbohidratos totales],[Cenizas],[Sodio],[Potasio],[Calcio]
,[Fósforo],[Hierro],[Zinc],[Tiamina],[Rivoflavina],[Niacina],[Vitamina C],100,1
from Leche

/************** MISC **************/
INSERT INTO nutricloud..alimento (nro,alimento,energia_kj,energia_kcal,agua_g,proteinas_g,grasa_total_g,carbohidratos_totales_g,ac_grasos_saturados_g,ac_grasos_monoinsaturados_g,ac_grasos_poliinsaturados_g
,porcion,id_alimento_tipo)
select [ Nº],[Alimento],[Energía],[Energía1],[Agua],[Proteínas],[Grasa Total],[Carbohidratos totales],[Ac# grasos saturados],[Ac# grasos monoinsaturados]
,[Ac# grasos poliinsaturados],100,1
from Misc

/************** PESCADOS **************/
INSERT INTO nutricloud..alimento (nro,alimento,energia_kj,energia_kcal,agua_g,proteinas_g,grasa_total_g,carbohidratos_totales_g,cenizas_g
,ac_grasos_saturados_g,ac_grasos_monoinsaturados_g,ac_grasos_poliinsaturados_g,sodio_mg,potasio_mg,calcio_mg,fosforo_mg,hierro_mg,zinc_mg
,tiamina_mg,rivoflavina_mg,niacina_mg,vitamina_c_mg,porcion,id_alimento_tipo)
select [ Nº],[Alimento],[Energía],[Energía1],[Agua],[Proteínas],[Grasa Total],[Carbohidratos totales],[Cenizas],[Ac# grasos saturados],
[Ac# grasos monoinsaturados],[Ac# grasos poliinsaturados],[Sodio],[Potasio],[Calcio],[Fósforo],[Hierro],[Zinc],[Tiamina],[Rivoflavina]
,[Niacina],[Vitamina C],100,1
from Pescados

/************** PESCADOSAG **************/
-- TE LA DEBO ._.

/************** ProdAZ **************/
INSERT INTO nutricloud..alimento (nro,alimento,energia_kj,energia_kcal,agua_g,proteinas_g,grasa_total_g,carbohidratos_totales_g,cenizas_g,sodio_mg
,potasio_mg,calcio_mg,fosforo_mg,hierro_mg,zinc_mg,tiamina_mg,rivoflavina_mg,niacina_mg,vitamina_c_mg,porcion,id_alimento_tipo)
Select [ Nº],[Alimento],[Energía],[Energía1],[Agua],[Proteínas],[Grasa Total],[Carbohidratos totales],[Cenizas],[Sodio],[Potasio],[Calcio]
,[Fósforo],[Hierro],[Zinc],[Tiamina],[Rivoflavina],[Niacina],[Vitamina C],[Porcion g],1
from ProdAZ

/************** VEGETALES **************/
INSERT INTO nutricloud..alimento (nro,alimento,energia_kj,energia_kcal,agua_g,proteinas_g,grasa_total_g,carbohidratos_totales_g,carbohidratos_disponibles_g
,fibra_dietetica_g,cenizas_g,sodio_mg,potasio_mg,calcio_mg,fosforo_mg,hierro_mg,zinc_mg,tiamina_mg,rivoflavina_mg,niacina_mg,vitamina_c_mg,porcion,id_alimento_tipo)
Select [ Nº],[Alimento],[Energía],[Energía1],[Agua],[Proteínas],[Grasa Total],[Carbohidratos totales],[Carbohidratos disponibles],[Fibra dietética]
,[Cenizas],[Sodio],[Potasio],[Calcio],[Fósforo],[Hierro],[Zinc],[Tiamina],[Rivoflavina],[Niacina],[Vitamina C],[Porcion g],1
from Vegetales

/************** SACANDO LOS NULL **************/
UPDATE nutricloud..alimento SET energia_kj = 0 WHERE energia_kj IS NULL
UPDATE nutricloud..alimento SET energia_kcal = 0 WHERE energia_kcal IS NULL
UPDATE nutricloud..alimento SET sodio_mg = 0 WHERE sodio_mg IS NULL
UPDATE nutricloud..alimento SET potasio_mg = 0 WHERE potasio_mg IS NULL
UPDATE nutricloud..alimento SET calcio_mg = 0 WHERE calcio_mg IS NULL
UPDATE nutricloud..alimento SET fosforo_mg = 0 WHERE fosforo_mg IS NULL
UPDATE nutricloud..alimento SET hierro_mg = 0 WHERE hierro_mg IS NULL
UPDATE nutricloud..alimento SET zinc_mg = 0 WHERE zinc_mg IS NULL
UPDATE nutricloud..alimento SET tiamina_mg = 0 WHERE tiamina_mg IS NULL
UPDATE nutricloud..alimento SET rivoflavina_mg = 0 WHERE rivoflavina_mg IS NULL
UPDATE nutricloud..alimento SET niacina_mg = 0 WHERE niacina_mg IS NULL
UPDATE nutricloud..alimento SET vitamina_c_mg = 0 WHERE vitamina_c_mg IS NULL
UPDATE nutricloud..alimento SET colesterol_mg = 0 WHERE colesterol_mg IS NULL
UPDATE nutricloud..alimento SET cenizas_g = 0 WHERE cenizas_g IS NULL
UPDATE nutricloud..alimento SET agua_g = 0 WHERE agua_g IS NULL
UPDATE nutricloud..alimento SET grasa_total_g = 0 WHERE grasa_total_g IS NULL
UPDATE nutricloud..alimento SET carbohidratos_totales_g = 0 WHERE carbohidratos_totales_g IS NULL
UPDATE nutricloud..alimento SET carbohidratos_disponibles_g = 0 WHERE carbohidratos_disponibles_g IS NULL
UPDATE nutricloud..alimento SET ac_grasos_saturados_g = 0 WHERE ac_grasos_saturados_g IS NULL
UPDATE nutricloud..alimento SET ac_grasos_monoinsaturados_g = 0 WHERE ac_grasos_monoinsaturados_g IS NULL
UPDATE nutricloud..alimento SET ac_grasos_poliinsaturados_g = 0 WHERE ac_grasos_poliinsaturados_g IS NULL
UPDATE nutricloud..alimento SET fibra_dietetica_g = 0 WHERE fibra_dietetica_g IS NULL
UPDATE nutricloud..alimento SET proteinas_g = 0 WHERE proteinas_g IS NULL
UPDATE nutricloud..alimento SET agp_w6_g = 0 WHERE agp_w6_g IS NULL
UPDATE nutricloud..alimento SET agp_w3_g = 0 WHERE agp_w3_g IS NULL
UPDATE nutricloud..alimento SET porcion = 0 WHERE porcion IS NULL
UPDATE nutricloud..alimento SET id_alimento_tipo = 0 WHERE id_alimento_tipo IS NULL


