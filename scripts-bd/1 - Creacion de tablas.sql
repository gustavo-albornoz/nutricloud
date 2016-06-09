use nutricloud
go
drop table alimento_usuario
drop table tipo_comida
drop table usuario_usuario
drop table datos_usuario
drop table alimento
drop table unidad_medida
drop table tipo_unidad_medida
drop table muro
drop table usuario
drop table tipo_usuario
go
--Opciones como: liquidos, solidos
create table tipo_unidad_medida (
	id_tipo_unidad_medida int identity(1,1) primary key,
	tipo_unidad_medida varchar(30) not null
)
go
--En el caso de liquidos, seria litros, mililitros. En el caso de solidos: g,kg, ver eso de las onzas y no se que mas
CREATE TABLE [dbo].[unidad_medida](
	[id_unidad_medida] [int] IDENTITY(1,1) NOT NULL,
	[unidad_medida] [varchar](30) NOT NULL,
	[abreviatura] [varchar](3) NOT NULL,
	[id_tipo_unidad_medida] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_unidad_medida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[unidad_medida]  WITH CHECK ADD  CONSTRAINT [FK_unidad_medida_tipo_unidad_medida] FOREIGN KEY([id_unidad_medida])
REFERENCES [dbo].[tipo_unidad_medida] ([id_tipo_unidad_medida])
GO

ALTER TABLE [dbo].[unidad_medida] CHECK CONSTRAINT [FK_unidad_medida_tipo_unidad_medida]
GO
CREATE TABLE [dbo].[alimento](
	[id_alimento] [int] IDENTITY(1,1) NOT NULL,
	[nro] [int] NULL,
	[alimento] [varchar](100) NOT NULL,
	[energia_kj] [decimal](10, 3) NULL,
	[energia_kcal] [decimal](10, 3) NULL,
	[sodio_mg] [decimal](10, 3) NULL,
	[potasio_mg] [decimal](10, 3) NULL,
	[calcio_mg] [decimal](10, 3) NULL,
	[fosforo_mg] [decimal](10, 3) NULL,
	[hierro_mg] [decimal](10, 3) NULL,
	[zinc_mg] [decimal](10, 3) NULL,
	[tiamina_mg] [decimal](10, 3) NULL,
	[rivoflavina_mg] [decimal](10, 3) NULL,
	[niacina_mg] [decimal](10, 3) NULL,
	[vitamina_c_mg] [decimal](10, 3) NULL,
	[colesterol_mg] [decimal](10, 3) NULL,
	[cenizas_g] [decimal](10, 3) NULL,
	[agua_g] [decimal](10, 3) NULL,
	[grasa_total_g] [decimal](10, 3) NULL,
	[carbohidratos_totales_g] [decimal](10, 3) NULL,
	[carbohidratos_disponibles_g] [decimal](10, 3) NULL,
	[ac_grasos_saturados_g] [decimal](10, 3) NULL,
	[ac_grasos_monoinsaturados_g] [decimal](10, 3) NULL,
	[ac_grasos_poliinsaturados_g] [decimal](10, 3) NULL,
	[fibra_dietetica_g] [decimal](10, 3) NULL,
	[proteinas_g] [decimal](10, 3) NULL,
	[agp_w6_g] [decimal](10, 3) NULL,
	[agp_w3_g] [decimal](10, 3) NULL,
	[porcion] [decimal](10, 3) NULL,
	[id_unidad_medida] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_alimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[alimento]  WITH CHECK ADD  CONSTRAINT [FK_alimento_unidad_medida] FOREIGN KEY([id_unidad_medida])
REFERENCES [dbo].[unidad_medida] ([id_unidad_medida])
GO

ALTER TABLE [dbo].[alimento] CHECK CONSTRAINT [FK_alimento_unidad_medida]
GO
create table tipo_usuario (
	id_tipo_usuario int identity(1,1) primary key,
	tipo_usuario varchar(30) not null
)
go
CREATE TABLE [dbo].[usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[sexo] [char](1) NOT NULL,
	[f_nacimiento] [date] NOT NULL,
	[f_registro] [datetime] NOT NULL,
	[f_ultimo_ingreso] [datetime] NULL,
	[id_tipo_usuario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_tipo_usuario] FOREIGN KEY([id_tipo_usuario])
REFERENCES [dbo].[tipo_usuario] ([id_tipo_usuario])
GO

ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_tipo_usuario]
GO
CREATE TABLE [dbo].[datos_usuario](
	[id_dato_usuario] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[altura_cm] [int] NOT NULL,
	[peso_kg] [decimal](5, 2) NOT NULL,
	[f_ingreso] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_dato_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[datos_usuario]  WITH CHECK ADD  CONSTRAINT [FK_datos_usuario_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO

ALTER TABLE [dbo].[datos_usuario] CHECK CONSTRAINT [FK_datos_usuario_usuario]
go
CREATE TABLE [dbo].[usuario_usuario](
	[id_usuario_usuario] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario_seguidor] [int] NOT NULL,
	[id_usuario_seguido] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[usuario_usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_usuario_usuario] FOREIGN KEY([id_usuario_seguido])
REFERENCES [dbo].[usuario] ([id_usuario])
GO

ALTER TABLE [dbo].[usuario_usuario] CHECK CONSTRAINT [FK_usuario_usuario_usuario]
GO

ALTER TABLE [dbo].[usuario_usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_usuario_usuario1] FOREIGN KEY([id_usuario_seguidor])
REFERENCES [dbo].[usuario] ([id_usuario])
GO

ALTER TABLE [dbo].[usuario_usuario] CHECK CONSTRAINT [FK_usuario_usuario_usuario1]
GO
CREATE TABLE [dbo].[muro](
	[id_muro] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[estado] [text] NOT NULL,
	[f_publicacion] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_muro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[muro]  WITH CHECK ADD  CONSTRAINT [FK_muro_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO

ALTER TABLE [dbo].[muro] CHECK CONSTRAINT [FK_muro_usuario]
GO
create table tipo_comida (
	id_tipo_comida int identity(1,1) primary key,
	tipo_comida varchar(30) not null
)
go
CREATE TABLE [dbo].[alimento_usuario](
	[id_alimento_usuario] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_alimento] [int] NOT NULL,
	[id_tipo_comida] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[id_unidad_medida] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_alimento_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[alimento_usuario]  WITH CHECK ADD  CONSTRAINT [FK_alimento_usuario_alimento] FOREIGN KEY([id_alimento])
REFERENCES [dbo].[alimento] ([id_alimento])
GO

ALTER TABLE [dbo].[alimento_usuario] CHECK CONSTRAINT [FK_alimento_usuario_alimento]
GO

ALTER TABLE [dbo].[alimento_usuario]  WITH CHECK ADD  CONSTRAINT [FK_alimento_usuario_tipo_comida] FOREIGN KEY([id_tipo_comida])
REFERENCES [dbo].[tipo_comida] ([id_tipo_comida])
GO

ALTER TABLE [dbo].[alimento_usuario] CHECK CONSTRAINT [FK_alimento_usuario_tipo_comida]
GO

ALTER TABLE [dbo].[alimento_usuario]  WITH CHECK ADD  CONSTRAINT [FK_alimento_usuario_unidad_medida] FOREIGN KEY([id_unidad_medida])
REFERENCES [dbo].[unidad_medida] ([id_unidad_medida])
GO

ALTER TABLE [dbo].[alimento_usuario] CHECK CONSTRAINT [FK_alimento_usuario_unidad_medida]
GO

ALTER TABLE [dbo].[alimento_usuario]  WITH CHECK ADD  CONSTRAINT [FK_alimento_usuario_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO

ALTER TABLE [dbo].[alimento_usuario] CHECK CONSTRAINT [FK_alimento_usuario_usuario]
GO