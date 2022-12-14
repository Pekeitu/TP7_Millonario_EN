USE [master]
GO
/****** Object:  Database [JuegoQQSM]    Script Date: 15/9/2022 08:24:00 ******/
CREATE DATABASE [JuegoQQSM]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JuegoQQSM', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\JuegoQQSM.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'JuegoQQSM_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\JuegoQQSM_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [JuegoQQSM] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JuegoQQSM].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JuegoQQSM] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ARITHABORT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JuegoQQSM] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JuegoQQSM] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JuegoQQSM] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JuegoQQSM] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JuegoQQSM] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JuegoQQSM] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JuegoQQSM] SET  DISABLE_BROKER 
GO
ALTER DATABASE [JuegoQQSM] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JuegoQQSM] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JuegoQQSM] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JuegoQQSM] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JuegoQQSM] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JuegoQQSM] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JuegoQQSM] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JuegoQQSM] SET RECOVERY FULL 
GO
ALTER DATABASE [JuegoQQSM] SET  MULTI_USER 
GO
ALTER DATABASE [JuegoQQSM] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JuegoQQSM] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JuegoQQSM] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JuegoQQSM] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [JuegoQQSM] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'JuegoQQSM', N'ON'
GO
ALTER DATABASE [JuegoQQSM] SET QUERY_STORE = OFF
GO
USE [JuegoQQSM]
GO
/****** Object:  User [alumno]    Script Date: 15/9/2022 08:24:00 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Jugadores]    Script Date: 15/9/2022 08:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jugadores](
	[IdJugador] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](200) NOT NULL,
	[FechaHora] [datetime] NOT NULL,
	[PozoGanado] [int] NOT NULL,
	[ComodinDobleChance] [bit] NOT NULL,
	[Comodin50] [bit] NOT NULL,
	[ComodinSaltear] [bit] NOT NULL,
 CONSTRAINT [PK_Jugador] PRIMARY KEY CLUSTERED 
(
	[IdJugador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 15/9/2022 08:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[idPregunta] [int] IDENTITY(1,1) NOT NULL,
	[txtPregunta] [varchar](200) NOT NULL,
	[nivelDificultad] [int] NOT NULL,
	[idioma] [varchar](2) NOT NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[idPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 15/9/2022 08:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[idRepuesta] [int] IDENTITY(1,1) NOT NULL,
	[idPregunta] [int] NOT NULL,
	[opcionRespuesta] [varchar](1) NOT NULL,
	[txtRespuesta] [varchar](200) NOT NULL,
	[correcta] [bit] NOT NULL,
	[idioma] [varchar](2) NOT NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[idRepuesta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (1, N'¿Quien fue el primer presidente de Argentina?', 1, N'ES')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (2, N'¿Quien fue el ultimo rey de Francia antes de la revolucion?', 1, N'ES')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (3, N'¿Quien es el profe de BD de 4IB?', 1, N'ES')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (4, N'¿Quien dibujo el cuadro "La Ultima Cena"?', 1, N'ES')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (5, N'¿En qué año descubrió América Cristóbal Colón?', 1, N'ES')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (6, N'Que pelicula tiene la mejor calificacion en IMDb', 2, N'ES')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (7, N'Quien pinto el cuadro "Saturno devorando a su hijo"', 2, N'ES')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (8, N'Que pelicula de anime fue la unica ganadora del Oscar a Mejor pelicula de Animacion', 2, N'ES')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (9, N'Quién pintó la obra "Guernica"', 2, N'ES')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (10, N'Cuál de estos países se extiende entre dos continentes', 2, N'ES')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (11, N'Quién fue el primer hombre en pisar la Luna', 3, N'ES')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (12, N'Cuál es el mayor archipiélago de la Tierra', 3, N'ES')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (13, N'Cuál es el metal cuyo símbolo químico es Au', 3, N'ES')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (14, N'Quién pintó la bóveda de la capilla sixtina', 3, N'ES')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (15, N'Quién es la primera persona en ganar dos premios Nobel', 3, N'ES')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (16, N'Who was Argentina first president?', 1, N'EN')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (17, N'Who was the last king in France before the revolution?', 1, N'EN')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (18, N'What sort of animal is Dumbo?', 1, N'EN')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (19, N'Who painted "The Last Supper"?', 1, N'EN')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (20, N'When did Cristobal Colon discover America?', 1, N'EN')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (21, N'Which movie has the highest score in IMDb ', 2, N'EN')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (22, N'Who painted "Saturn Devouring His Son"', 2, N'EN')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (23, N'Which anime movie was the only winner of the Oscar for Best Animated Film?', 2, N'EN')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (24, N'Who painted "Guernica"', 2, N'EN')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (25, N'Which of these countries lies between two continents', 2, N'EN')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (26, N'Who was the first man to walk on the moon', 3, N'EN')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (27, N'What is the largest archipelago on earth', 3, N'EN')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (28, N'What is the metal whose chemical symbol is Au?', 3, N'EN')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (29, N'Who painted the vault of the Sistine Chapel', 3, N'EN')
INSERT [dbo].[Preguntas] ([idPregunta], [txtPregunta], [nivelDificultad], [idioma]) VALUES (30, N'Who is the first person to win two Nobel Prizes?', 3, N'EN')
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (1, 1, N'A', N'Carlos Pellegrini', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (2, 1, N'B', N'Justo José de Urquiza', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (3, 1, N'C', N'Bernardino Rivadavia', 1, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (4, 1, N'D', N'Bartolomé Mitre', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (5, 2, N'A', N'Luis XVI', 1, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (6, 2, N'B', N'Luis XIV', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (7, 2, N'C', N'Enrique IV', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (8, 2, N'D', N'Carlos X', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (9, 3, N'A', N'Stacagod', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (10, 3, N'B', N'Podro', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (11, 3, N'C', N'Leo', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (12, 3, N'D', N'Dasman', 1, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (13, 4, N'A', N'Monet', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (14, 4, N'B', N'Da Vinci', 1, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (15, 4, N'C', N'Binker', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (16, 4, N'D', N'Picasso', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (17, 5, N'A', N'1592', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (18, 5, N'B', N'1492', 1, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (19, 5, N'C', N'1392', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (20, 5, N'D', N'1489', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (21, 6, N'A', N'Pulp Fiction', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (22, 6, N'B', N'The Godfather', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (23, 6, N'C', N'Fight Club', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (24, 6, N'D', N'The Shawshank Redemption', 1, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (25, 7, N'A', N'Francisco de Goya', 1, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (26, 7, N'B', N'Édouard Manet', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (27, 7, N'C', N'Diego Velázquez', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (28, 7, N'D', N'Eugène Delacroix', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (29, 8, N'A', N'Your Name', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (30, 8, N'B', N'El rey leon', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (31, 8, N'C', N'El viaje de Chihiro', 1, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (32, 8, N'D', N'Princesa Mononoke', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (33, 9, N'A', N'Pablo Picasso', 1, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (34, 9, N'B', N'Salvador Dali', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (35, 9, N'C', N'Vincent van Gogh', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (36, 9, N'D', N'Miguel Ángel', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (37, 10, N'A', N'Tanzania', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (38, 10, N'B', N'Rusia', 1, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (39, 10, N'C', N'Egipto', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (40, 10, N'D', N'Filipinas', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (41, 11, N'A', N'Yuri Gagarin', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (42, 11, N'B', N'Neil Armstrong', 1, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (43, 11, N'C', N'Charles Conrad', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (44, 11, N'D', N'Michael Collins', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (45, 12, N'A', N'Filipinas', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (46, 12, N'B', N'Bahamas', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (47, 12, N'C', N'Maldivas', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (48, 12, N'D', N'Indonesia', 1, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (49, 13, N'A', N'Aluminio', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (50, 13, N'B', N'Oro', 1, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (51, 13, N'C', N'Antimonio', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (52, 13, N'D', N'Plata', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (53, 14, N'A', N'Boticelli', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (54, 14, N'B', N'Rafael', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (55, 14, N'C', N'Miguel Angel', 1, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (56, 14, N'D', N'Leonardo da Vinci', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (57, 15, N'A', N'Marie Curie', 1, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (58, 15, N'B', N'Albert Einstein', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (59, 15, N'C', N'Richard Feynman', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (60, 15, N'D', N'Linus Pauling', 0, N'ES')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (61, 16, N'A', N'Carlos Pellegrini', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (62, 16, N'B', N'Justo José de Urquiza', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (63, 16, N'C', N'Bernardino Rivadavia', 1, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (64, 16, N'D', N'Bartolomé Mitre', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (65, 17, N'A', N'Louis XVI', 1, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (66, 17, N'B', N'Louis XIV', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (67, 17, N'C', N'Henry IV', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (68, 17, N'D', N'Charles X', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (69, 18, N'A', N'Elephant', 1, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (70, 18, N'B', N'Lion', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (71, 18, N'C', N'Penguin', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (72, 18, N'D', N'Alligator', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (73, 19, N'A', N'Monet', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (74, 19, N'B', N'Da Vinci', 1, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (75, 19, N'C', N'Botticelli', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (76, 19, N'D', N'Picasso', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (77, 20, N'A', N'1592', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (78, 20, N'B', N'1492', 1, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (79, 20, N'C', N'1392', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (80, 20, N'D', N'1489', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (81, 21, N'A', N'Pulp Fiction', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (82, 21, N'B', N'The Godfather', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (83, 21, N'C', N'Fight Club', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (84, 21, N'D', N'The Shawshank Redemption', 1, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (85, 22, N'A', N'Francisco de Goya', 1, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (86, 22, N'B', N'Édouard Manet', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (87, 22, N'C', N'Diego Velázquez', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (88, 22, N'D', N'Eugène Delacroix', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (89, 23, N'A', N'Your Name', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (90, 23, N'B', N'The Lion King', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (91, 23, N'C', N'Spirited Away', 1, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (92, 23, N'D', N'Princess Mononoke', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (93, 24, N'A', N'Pablo Picasso', 1, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (94, 24, N'B', N'Salvador Dali', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (95, 24, N'C', N'Vincent van Gogh', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (96, 24, N'D', N'Miguel Ángel', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (97, 25, N'A', N'Tanzania', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (98, 25, N'B', N'Russia', 1, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (99, 25, N'C', N'Egypt', 0, N'EN')
GO
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (100, 25, N'D', N'Philippines', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (101, 26, N'A', N'Yuri Gagarin', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (102, 26, N'B', N'Neil Armstrong', 1, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (103, 26, N'C', N'Charles Conrad', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (104, 26, N'D', N'Michael Collins', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (105, 27, N'A', N'Philippines', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (106, 27, N'B', N'Bahamas', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (107, 27, N'C', N'Maldives', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (108, 27, N'D', N'Indonesia', 1, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (109, 28, N'A', N'Aluminum', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (110, 28, N'B', N'Gold', 1, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (111, 28, N'C', N'Antimony', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (112, 28, N'D', N'Silver', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (113, 29, N'A', N'Boticelli', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (114, 29, N'B', N'Rafael', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (115, 29, N'C', N'Miguel Angel', 1, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (116, 29, N'D', N'Leonardo da Vinci', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (117, 30, N'A', N'Marie Curie', 1, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (118, 30, N'B', N'Albert Einstein', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (119, 30, N'C', N'Richard Feynman', 0, N'EN')
INSERT [dbo].[Respuestas] ([idRepuesta], [idPregunta], [opcionRespuesta], [txtRespuesta], [correcta], [idioma]) VALUES (120, 30, N'D', N'Linus Pauling', 0, N'EN')
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([idPregunta])
REFERENCES [dbo].[Preguntas] ([idPregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
/****** Object:  StoredProcedure [dbo].[insertarJugador]    Script Date: 15/9/2022 08:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertarJugador]
	@Nombre varchar(50),
	@FechaHora DateTime,
	@PozoGanado int,
	@ComodinDobleChance bit,
	@Comodin50 bit,
	@ComodinSaltear bit
AS
BEGIN
	INSERT INTO Jugadores VALUES(@Nombre, @FechaHora, @PozoGanado, @ComodinDobleChance, @Comodin50, @ComodinSaltear)
END
GO
/****** Object:  StoredProcedure [dbo].[ListarPodio]    Script Date: 15/9/2022 08:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ListarPodio]
AS
BEGIN
	SELECT TOP 10 * FROM Jugadores
	ORDER BY PozoGanado DESC, Nombre ASC
END
GO
/****** Object:  StoredProcedure [dbo].[obtenerIdPreguntasxDif]    Script Date: 15/9/2022 08:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtenerIdPreguntasxDif]
	@dif int, @idioma varchar(2)
AS
BEGIN
	SELECT idPregunta FROM Preguntas WHERE nivelDificultad = @dif AND idioma = @idioma
END
GO
/****** Object:  StoredProcedure [dbo].[obtenerProximaPregunta]    Script Date: 15/9/2022 08:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtenerProximaPregunta]
@idPregunta int
AS 
BEGIN
SELECT * FROM Preguntas WHERE idPregunta = @idPregunta
END
GO
/****** Object:  StoredProcedure [dbo].[obtenerRespuestaCorrecta]    Script Date: 15/9/2022 08:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtenerRespuestaCorrecta]
@PregActual int
AS 
BEGIN
SELECT opcionRespuesta FROM Respuestas WHERE idPregunta = @PregActual AND correcta = 1
END
GO
/****** Object:  StoredProcedure [dbo].[obtenerRespuestas]    Script Date: 15/9/2022 08:24:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obtenerRespuestas]
	@PregActual int
AS 
BEGIN
	SELECT * FROM Respuestas
	WHERE idPregunta = @PregActual
	ORDER BY opcionRespuesta ASC
END
GO
USE [master]
GO
ALTER DATABASE [JuegoQQSM] SET  READ_WRITE 
GO
