select * from Usuarios
select * from Artistas
select * from Directores
select * from Plataformas
select * from Generos
select * from Peliculas
select * from Pelicula_Plataforma
select * from Pelicula_Genero
select * from PeliculasArtistas
select * from PeliculasDirectores
select * from Votos
select * from Comentarios

drop table Usuarios
drop table Artistas
drop table Directores
drop table Plataformas
drop table Generos
drop table Peliculas
drop table Pelicula_Plataforma
drop table Pelicula_Genero
drop table PeliculasArtistas
drop table PeliculasDirectores
drop table Votos
drop table Comentarios

create table Usuarios(
	nom_Usuario varchar(25),
	contrase�a varchar(25),
	email varchar(50),
	constraint pk_Usuarios primary key(nom_Usuario)
)

create table Artistas(
	id_Artista int,
	nombre varchar(100),
	constraint pk_Artistas primary key(id_Artista)
)

insert into Artistas values(1,'Marlon Wayans'), (2,'Shawn Wayans'),(3,'Terry Crews'),(4,'Busy Philipps'),(5,'Jaime King'),(6,'Brittany Daniel'),(7,'Jennifer Carpenter'),(8,'Anne Dudek'),(9,'Jessica Cauffiel'),(10,'Lochlyn Munro'),(11,'Maitland Ward'),(12,'Rochelle Aytes'),(13,'Frankie Faison'),(14,'John Heard'),(15,'John Reardon'),(16,'Daniel Radcliffe'),(17,'Emma Watson'),(18,'Rupert Grint'),(19,'Matthew Lewis'),(20,'Tom Felton'),(21,'Alan Rickman'),(22,'Bonnie Wright'),(23,'Robbie Coltrane'),(24,'Michael Gambon'),(25,'Evanna Lynch'),(26,'Maggie Smith'),(27,'Ralph Fiennes'),(28,'Alfred Enoch'),(29,'Harry Melling'),(30,'Helena Bonham Carter')

CREATE TABLE Directores(
	id_Director int,
	nombre varchar(100),
	constraint pk_Directores primary key(id_Director)
)

insert into Directores values(1,'Keenen Ivory Wayans'),(2,'Chris Columbus')

create table Plataformas(
	cod_Plat int, 
	nom_Plataforma varchar(20),
	constraint pk_Plataformas primary key(cod_Plat)
)

create table Generos(
	id_Genero int,
	descripcion varchar(20),
	constraint pk_Generos primary key(id_Genero)
)

create table Peliculas(
	id_Pelicula int,
	nom_pel�cula varchar(50),
	descripcion varchar(500),
	constraint pk_id_Pelicula primary key(id_Pelicula)
)

create table Pelicula_Plataforma(
	id_plataforma int,
	id_pelicula int,
	constraint pk_Pelicula_Plataforma primary key(id_plataforma,id_pelicula),
	constraint fk_Pelicula_Plataforma_Plataformas foreign key(id_plataforma) references Plataformas(cod_Plat),
	constraint fk_Pelicula_Plataforma_Peliculas foreign key(id_pelicula) references Peliculas(id_Pelicula)
)

create table Pelicula_Genero(
	id_pelicula int,
	id_genero int,
	constraint pk_Pelicula_Genero primary key(id_pelicula,id_genero),
	constraint fk_Perlicula_Genero_Generos foreign key(id_genero) references Generos(id_Genero),
	constraint fk_Perlicula_Genero_Peliculas foreign key(id_pelicula) references Peliculas(id_pelicula)
)

create table PeliculasArtistas(
	id_Artista int,
	id_Pelicula int,
	constraint pk_PeliculasArtistas primary key(id_Artista,id_Pelicula),
	constraint fk_PeliculasArtistas_Peliculas foreign key(id_Pelicula) references Peliculas(id_Pelicula),
	constraint fk_PeliculasArtistas_Artistas foreign key(id_Artista) references Artistas(id_Artista)
)
 
CREATE TABLE PeliculasDirectores(
	id_Director int,
	id_Pelicula int,
	constraint pk_PeliculasDirectores primary key(id_Director,id_Pelicula),
	constraint fk_PeliculasDirectores_Peliculas foreign key(id_Pelicula) references Peliculas(id_Pelicula),
	constraint fk_PeliculasDirectores_Artistas foreign key(id_Director) references Directores(id_Director)
)

create table Votos(
	id_voto int,
	nom_Usuario varchar(25),
	id_Pelicula int,
	voto int, check (voto>=1 and voto<=5),
	constraint pk_id_Votos primary key(id_voto),
	constraint fk_Votos_Usuarios foreign key(nom_Usuario) references Usuarios,
	constraint fk_Votos_Peliculas foreign key(id_voto) references Peliculas
)

create table Comentarios(
	id_Comentario int,
	nom_Usuario varchar(25),
	id_Pelicula int,
	comentario varchar(250),
	likes int,
	dislikes int,
	constraint pk_Comentarios primary key(id_Comentario),
	constraint fk_Comentarios_Usuarios foreign key(nom_Usuario) references Usuarios,
	constraint fk_Comentarios_Peliculas foreign key(id_Pelicula) references Peliculas
)

insert into Generos values(1,'Comedia'),(2,'Polic�aca'),(3,'Ciencia Ficci�n'), (4,'Fantac�a'), (5,'Acci�n')

insert into Plataformas values(1,'Netflix'),(2,'Disney +'), (3,'HBO'),(4,'Amazon prime'), (5,'Crunchyroll'),(6,'Paramount'),(7,'Star +'),(8,'YouTube'),(9,'Apple TV')

insert into Peliculas values(12, '�Y d�nde est�n las rubias','Dos agentes del FBI de raza negra se disfrazan de mujeres blancas para hacerse pasar por las herederas a las que deben proteger de un inminente secuestro.'),
(1,'Harry Potter y la piedra filosofal','El d�a de su cumplea�os, Harry Potter descubre que es hijo de dos conocidos hechiceros, de los que ha heredado poderes m�gicos. Debe asistir a una famosa escuela de magia y hechicer�a, donde entabla una amistad con dos j�venes que se convertir�n en sus compa�eros de aventura. Durante su primer a�o en Hogwarts, descubre que un mal�volo y poderoso mago llamado Voldemort est� en busca de una piedra filosofal que alarga la vida de quien la posee.')

insert into Pelicula_Plataforma values(1,12)
insert into Pelicula_Genero values(12,1),(12,2)
insert into PeliculasArtistas values(1,12),(2,12),(3,12),(4,12),(5,12),(6,12),(7,12),(8,12),(9,12),(10,12),(11,12),(12,12),(13,12),(14,12),(15,12)
insert into PeliculasDirectores values(1,12)

insert into Pelicula_Genero values(1,4),(1,5)
insert into Pelicula_Plataforma values(3,1),(9,1)
insert into PeliculasArtistas values(16,1),(17,1),(18,1),(21,1),(23,1),(20,1),(22,1),(19,1),(26,1),(29,1)
insert into PeliculasDirectores values(2,1)

/*Para sacar artistas */
select a.nombre
from Peliculas p
inner join PeliculasArtistas pa on pa.id_Pelicula = p.id_Pelicula
inner join Artistas a on a.id_Artista = pa.id_Artista
where p.nom_pel�cula = 'Harry Potter y la piedra filosofal'
 
/*Para sacar directores */
select d.nombre
from Peliculas p
inner join PeliculasDirectores pd on pd.id_Pelicula = p.id_Pelicula
inner join Directores d on d.id_Director = pd.id_Director
where p.nom_pel�cula = 'Harry Potter y la piedra filosofal'

/*Para sacar plataformas */
select pf.nom_Plataforma
from Peliculas p
inner join Pelicula_Plataforma pp on pp.id_Pelicula = p.id_Pelicula
inner join Plataformas pf on pf.cod_Plat = pp.id_plataforma 
where p.nom_pel�cula = 'Harry Potter y la piedra filosofal'

/*Para sacar generos */
select g.descripcion
from Peliculas p
inner join Pelicula_Genero pg on pg.id_Pelicula = p.id_Pelicula
inner join Generos g on g.id_Genero = pg.id_genero
where p.nom_pel�cula = 'Harry Potter y la piedra filosofal'
