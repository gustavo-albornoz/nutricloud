use nutricloud
go
drop table blog_nota
drop table consulta_mensaje
drop table consulta_conversacion
drop table usuario_alimento
drop table comida_tipo
drop table alimento
drop table alimento_tipo
drop table alimento_genero
drop table usuario_receta
drop table usuario_muro
drop table usuario_datos
drop table usuario_objetivo
drop table usuario_usuario
drop table usuario
drop table usuario_tipo
go
--Opciones como: liquidos (litros), solidos (gr)
create table alimento_tipo (
	id_alimento_tipo int identity(1,1) primary key,
	alimento_tipo varchar(30) not null,
	unidad_medida varchar(2) not null
)
GO
-- carnes, pescados, lacteos...
create table alimento_genero (
	id_alimento_genero int identity(1,1) primary key,
	alimento_genero varchar(30) not null
)
GO
CREATE TABLE [dbo].[alimento](
	[id_alimento] [int] IDENTITY(1,1) NOT NULL,
	[nro] [int] NULL,
	[alimento] [varchar](100) NOT NULL,
	[energia_kj] [decimal](10, 3) NULL default 0,
	[energia_kcal] [decimal](10, 3) NULL default 0,
	[sodio_mg] [decimal](10, 3) NULL default 0,
	[potasio_mg] [decimal](10, 3) NULL default 0,
	[calcio_mg] [decimal](10, 3) NULL default 0,
	[fosforo_mg] [decimal](10, 3) NULL default 0,
	[hierro_mg] [decimal](10, 3) NULL default 0,
	[zinc_mg] [decimal](10, 3) NULL default 0,
	[tiamina_mg] [decimal](10, 3) NULL default 0,
	[rivoflavina_mg] [decimal](10, 3) NULL default 0,
	[niacina_mg] [decimal](10, 3) NULL default 0,
	[vitamina_c_mg] [decimal](10, 3) NULL default 0,
	[colesterol_mg] [decimal](10, 3) NULL default 0,
	[cenizas_g] [decimal](10, 3) NULL default 0,
	[agua_g] [decimal](10, 3) NULL default 0,
	[grasa_total_g] [decimal](10, 3) NULL default 0,
	[carbohidratos_totales_g] [decimal](10, 3) NULL default 0,
	[carbohidratos_disponibles_g] [decimal](10, 3) NULL default 0,
	[ac_grasos_saturados_g] [decimal](10, 3) NULL default 0,
	[ac_grasos_monoinsaturados_g] [decimal](10, 3) NULL default 0,
	[ac_grasos_poliinsaturados_g] [decimal](10, 3) NULL default 0,
	[fibra_dietetica_g] [decimal](10, 3) NULL default 0,
	[proteinas_g] [decimal](10, 3) NULL default 0,
	[agp_w6_g] [decimal](10, 3) NULL default 0,
	[agp_w3_g] [decimal](10, 3) NULL default 0,
	[porcion] [decimal](10, 3) NOT NULL,
	[id_alimento_tipo] [int] NOT NULL,
	[id_alimento_genero] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_alimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[alimento]  WITH CHECK ADD  CONSTRAINT [FK_alimento_alimento_genero] FOREIGN KEY([id_alimento_genero])
REFERENCES [dbo].[alimento_genero] ([id_alimento_genero])
GO

ALTER TABLE [dbo].[alimento] CHECK CONSTRAINT [FK_alimento_alimento_genero]
GO

ALTER TABLE [dbo].[alimento]  WITH CHECK ADD  CONSTRAINT [FK_alimento_alimento_tipo] FOREIGN KEY([id_alimento_tipo])
REFERENCES [dbo].[alimento_tipo] ([id_alimento_tipo])
GO

ALTER TABLE [dbo].[alimento] CHECK CONSTRAINT [FK_alimento_alimento_tipo]
GO
create table usuario_tipo (
	id_usuario_tipo int identity(1,1) primary key,
	usuario_tipo varchar(30) not null
)
go
CREATE TABLE [dbo].[usuario](
	[id_usuario] [int] IDENTITY(1,1) NOT NULL,
	[usuario] [varchar](50) NOT NULL,
	[clave] [varchar](100) NOT NULL,
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[sexo] [char](1) NOT NULL,
	[f_nacimiento] [date] NOT NULL,
	[f_registro] [datetime] NOT NULL DEFAULT (getdate()),
	[f_ultimo_ingreso] [datetime] NULL,
	[id_usuario_tipo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK_usuario_usuario_tipo] FOREIGN KEY([id_usuario_tipo])
REFERENCES [dbo].[usuario_tipo] ([id_usuario_tipo])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK_usuario_usuario_tipo]
GO
CREATE TABLE [dbo].[usuario_objetivo](
	[id_usuario_objetivo] [int] IDENTITY(1,1) NOT NULL,
	[usuario_objetivo] [varchar](50) NOT NULL,
 CONSTRAINT [PK_usuario_objetivo] PRIMARY KEY CLUSTERED 
(
	[id_usuario_objetivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
CREATE TABLE [dbo].[usuario_datos](
	[id_usuario_datos] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[altura_cm] [int] NOT NULL,
	[peso_kg] [decimal](5, 2) NOT NULL,
	[f_ingreso] [datetime] NOT NULL DEFAULT (getdate()),
	[id_usuario_objetivo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario_datos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[usuario_datos]  WITH CHECK ADD  CONSTRAINT [FK_usuario_datos_usuario_objetivo] FOREIGN KEY([id_usuario_objetivo])
REFERENCES [dbo].[usuario_objetivo] ([id_usuario_objetivo])
GO

ALTER TABLE [dbo].[usuario_datos] CHECK CONSTRAINT [FK_usuario_datos_usuario_objetivo]
GO

ALTER TABLE [dbo].[usuario_datos]  WITH CHECK ADD  CONSTRAINT [FK_usuario_datos_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO

ALTER TABLE [dbo].[usuario_datos] CHECK CONSTRAINT [FK_usuario_datos_usuario]
GO

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


CREATE TABLE [dbo].[usuario_muro](
	[id_usuario_muro] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[estado] [text] NOT NULL,
	[f_publicacion] [datetime] NOT NULL DEFAULT (getdate()),
PRIMARY KEY CLUSTERED 
(
	[id_usuario_muro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[usuario_muro]  WITH CHECK ADD  CONSTRAINT [FK_usuario_muro_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO

ALTER TABLE [dbo].[usuario_muro] CHECK CONSTRAINT [FK_usuario_muro_usuario]
GO
create table comida_tipo (
	id_comida_tipo int identity(1,1) primary key,
	comida_tipo varchar(30) not null
)
go
CREATE TABLE [dbo].[usuario_alimento](
	[id_usuario_alimento] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_alimento] [int] NOT NULL,
	[id_comida_tipo] [int] NOT NULL,
	[cantidad] [int] NOT NULL,
	[id_unidad_medida] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_usuario_alimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[usuario_alimento]  WITH CHECK ADD  CONSTRAINT [FK_usuario_alimento_alimento] FOREIGN KEY([id_alimento])
REFERENCES [dbo].[alimento] ([id_alimento])
GO

ALTER TABLE [dbo].[usuario_alimento] CHECK CONSTRAINT [FK_usuario_alimento_alimento]
GO

ALTER TABLE [dbo].[usuario_alimento]  WITH CHECK ADD  CONSTRAINT [FK_usuario_alimento_comida_tipo] FOREIGN KEY([id_comida_tipo])
REFERENCES [dbo].[comida_tipo] ([id_comida_tipo])
GO

ALTER TABLE [dbo].[usuario_alimento] CHECK CONSTRAINT [FK_usuario_alimento_comida_tipo]
GO

ALTER TABLE [dbo].[usuario_alimento]  WITH CHECK ADD  CONSTRAINT [FK_usuario_alimento_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO

ALTER TABLE [dbo].[usuario_alimento] CHECK CONSTRAINT [FK_usuario_alimento_usuario]


CREATE TABLE [dbo].[blog_nota](
	[id_blog_nota] [int] IDENTITY(1,1) NOT NULL,
	[nota] [text] NOT NULL,
	[titulo_nota] [varchar](50) NOT NULL,
	[f_publicacion] [datetime] NOT NULL DEFAULT (getdate()),
	[id_usuario] [int] NOT NULL,
 CONSTRAINT [PK_blog_nota] PRIMARY KEY CLUSTERED 
(
	[id_blog_nota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[blog_nota]  WITH CHECK ADD  CONSTRAINT [FK_blog_nota_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO

ALTER TABLE [dbo].[blog_nota] CHECK CONSTRAINT [FK_blog_nota_usuario]
GO

CREATE TABLE [dbo].[usuario_receta](
	[id_usuario_receta] [int] IDENTITY(1,1) NOT NULL,
	[receta] [text] NOT NULL,
	[titulo_receta] [varchar](50) NOT NULL,
	[f_publicacion] [datetime] NOT NULL DEFAULT (getdate()),
	[id_usuario] [int] NOT NULL,
 CONSTRAINT [PK_usuario_receta] PRIMARY KEY CLUSTERED 
(
	[id_usuario_receta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[usuario_receta]  WITH CHECK ADD  CONSTRAINT [FK_usuario_receta_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO

ALTER TABLE [dbo].[usuario_receta] CHECK CONSTRAINT [FK_usuario_receta_usuario]
GO

CREATE TABLE [dbo].[consulta_conversacion](
	[id_consulta_conversacion] [int] IDENTITY(1,1) NOT NULL,
	[id_usuario_remitente] [int] NOT NULL,
	[id_usuario_destinatario] [int] NOT NULL,
	[cerrada] [bit] NOT NULL,
 CONSTRAINT [PK_consulta_conversacion] PRIMARY KEY CLUSTERED 
(
	[id_consulta_conversacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[consulta_conversacion] ADD  DEFAULT ((0)) FOR [cerrada]
GO

ALTER TABLE [dbo].[consulta_conversacion]  WITH CHECK ADD  CONSTRAINT [FK_consulta_conversacion_usuario] FOREIGN KEY([id_usuario_remitente])
REFERENCES [dbo].[usuario] ([id_usuario])
GO

ALTER TABLE [dbo].[consulta_conversacion] CHECK CONSTRAINT [FK_consulta_conversacion_usuario]
GO

ALTER TABLE [dbo].[consulta_conversacion]  WITH CHECK ADD  CONSTRAINT [FK_consulta_conversacion_usuario1] FOREIGN KEY([id_usuario_destinatario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO

ALTER TABLE [dbo].[consulta_conversacion] CHECK CONSTRAINT [FK_consulta_conversacion_usuario1]
GO

CREATE TABLE [dbo].[consulta_mensaje](
	[id_mensaje] [int] IDENTITY(1,1) NOT NULL,
	[mensaje] [text] NOT NULL,
	[f_mensaje] [datetime] NOT NULL DEFAULT (getdate()),
	[id_consulta_conversacion] [int] NOT NULL,
 CONSTRAINT [PK_consulta_mensaje] PRIMARY KEY CLUSTERED 
(
	[id_mensaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[consulta_mensaje]  WITH CHECK ADD  CONSTRAINT [FK_consulta_mensaje_consulta_conversacion] FOREIGN KEY([id_consulta_conversacion])
REFERENCES [dbo].[consulta_conversacion] ([id_consulta_conversacion])
GO

ALTER TABLE [dbo].[consulta_mensaje] CHECK CONSTRAINT [FK_consulta_mensaje_consulta_conversacion]
GO

