use nutricloud
go
drop table usuario_alimento
drop table usuario_usuario
drop table comida_tipo
drop table usuario_datos
drop table alimento
drop table alimento_tipo
drop table usuario_muro
drop table usuario_objetivo
drop table usuario_mensaje
drop table blog_nota
drop table usuario_receta
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
	[id_alimento_tipo] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_alimento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

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
	[nombre] [varchar](100) NOT NULL,
	[apellido] [varchar](100) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[sexo] [char](1) NOT NULL,
	[f_nacimiento] [date] NOT NULL,
	[f_registro] [datetime] NOT NULL,
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
	[f_ingreso] [datetime] NOT NULL,
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
	[f_publicacion] [datetime] NOT NULL,
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

GO
CREATE TABLE [dbo].[usuario_mensaje](
	[id_usuario_mensaje] [int] IDENTITY(1,1) NOT NULL,
	[usuario_mensaje] [text] NOT NULL,
	[id_usuario_remitente] [int] NOT NULL,
	[id_usuario_destinatario] [int] NOT NULL,
	[f_usuario_mensaje] [datetime] NOT NULL,
 CONSTRAINT [PK_usuario_mensaje] PRIMARY KEY CLUSTERED 
(
	[id_usuario_mensaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

ALTER TABLE [dbo].[usuario_mensaje]  WITH CHECK ADD  CONSTRAINT [FK_usuario_mensaje_usuario] FOREIGN KEY([id_usuario_remitente])
REFERENCES [dbo].[usuario] ([id_usuario])
GO

ALTER TABLE [dbo].[usuario_mensaje] CHECK CONSTRAINT [FK_usuario_mensaje_usuario]
GO

ALTER TABLE [dbo].[usuario_mensaje]  WITH CHECK ADD  CONSTRAINT [FK_usuario_mensaje_usuario1] FOREIGN KEY([id_usuario_destinatario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO

ALTER TABLE [dbo].[usuario_mensaje] CHECK CONSTRAINT [FK_usuario_mensaje_usuario1]
GO

CREATE TABLE [dbo].[blog_nota](
	[id_blog_nota] [int] IDENTITY(1,1) NOT NULL,
	[nota] [text] NOT NULL,
	[titulo_nota] [varchar](50) NOT NULL,
	[f_nota] [datetime] NOT NULL,
	[id_usuario] [int] NOT NULL,
 CONSTRAINT [PK_blog_nota] PRIMARY KEY CLUSTERED 
(
	[id_blog_nota] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [dbo].[blog_nota]  WITH CHECK ADD  CONSTRAINT [FK_blog_nota_usuario] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id_usuario])
GO

ALTER TABLE [dbo].[blog_nota] CHECK CONSTRAINT [FK_blog_nota_usuario]
GO

Create table usuario_receta (
	id_usuario_receta int identity(1,1) not null,
	receta text not null,
	titulo_receta varchar(50) not null,
	f_receta datetime not null,
	id_usuario int not null
)

