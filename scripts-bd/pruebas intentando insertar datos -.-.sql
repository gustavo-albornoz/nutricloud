
use nutricloud_datos_crudos
go

INSERT INTO nutricloud..alimento(nro,alimento,energia_kj,energia_kcal,agua_g,proteinas_g,grasa_total_g,carbohidratos_totales_g,
cenizas_g,sodio_mg,potasio_mg,calcio_mg,fosforo_mg,hierro_mg,zinc_mg,tiamina_mg,rivoflavina_mg,niacina_mg,vitamina_c_mg,porcion_g)
Select
 [ N�]
,[Alimento]
,isnull(REPLACE([Energ�a],'',0),0) [Energ�a]
,isnull(REPLACE([Energ�a1],'',0),0) [Energ�a1]
,isnull(REPLACE([Agua],'',0),0) [Agua]
,isnull(REPLACE([Prote�nas],'',0),0) [Prote�nas]
,isnull(REPLACE([Grasa Total],'',0),0) [Grasa Total]
,isnull(REPLACE([Carbohidratos totales],'.',''),0) [Carbohidratos totales]
,isnull(REPLACE([Cenizas],'',0),0) [Cenizas]
,isnull(REPLACE([Sodio],'',0),0) [Sodio]
,isnull(REPLACE([Potasio],'',0),0) [Potasio]
,isnull(REPLACE([Calcio],'',0),0) [Calcio]
,isnull(REPLACE([F�sforo],'',0),0) [F�sforo]
,isnull(REPLACE([Hierro],'',0),0) [Hierro]
,isnull(REPLACE([Zinc],'',0),0) [Zinc]
,isnull(REPLACE([Tiamina],'',0),0) [Tiamina]
,isnull(REPLACE([Rivoflavina],'',0),0) [Rivoflavina]
,isnull(REPLACE([Niacina],'',0),0) [Niacina]
,isnull(REPLACE([Vitamina C],'',0),0) [Vitamina C]
,isnull(REPLACE([Porcion g],'',0),0) [Porcion g]
from Carnes


select * from Carnes
select * from CarnesAG
select * from Cereales
select * from Frutas
select * from Grasas
select * from Huevo
select * from Leche
select * from Misc
select * from Pescados
select * from PescadosAG
select * from ProdAZ
select * from Vegetales


