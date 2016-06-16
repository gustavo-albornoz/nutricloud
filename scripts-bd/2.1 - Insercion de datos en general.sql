
DELETE FROM alimento_tipo
INSERT INTO alimento_tipo (alimento_tipo,unidad_medida) VALUES
('Sólidos', 'gr'),
('Líquidos', 'l')

GO

DELETE FROM alimento_genero
INSERT INTO alimento_genero (alimento_genero) VALUES
('Carnes'),
('Lacteos'),
('Pescados')
