CREATE TABLE DimFechas(
	fecha DATE  NOT NULL PRIMARY KEY,
	dia_semana VARCHAR(11),
	semana INT,
	mes VARCHAR(13),
	trimestre INT,
	anio INT
);

CREATE TABLE DimCasos(
	id INT NOT NULL PRIMARY KEY,
	edad INT,
	sexo varchar(5)
);

CREATE TABLE DimLocalidades(
	nombre_localidad VARCHAR(100) PRIMARY KEY,
);

CREATE TABLE DimRangoEdades(
	rango VARCHAR(10) NOT NULL PRIMARY KEY,
);

CREATE TABLE DimEstadosSalud(
	nombre_estado_salud VARCHAR(100) PRIMARY KEY,
);

CREATE TABLE DimUbicaciones(
	nombre_ubicacion VARCHAR(100) PRIMARY KEY,
);

CREATE TABLE DimFuentesContagio(
	nombre_fuente_contagio VARCHAR(100) PRIMARY KEY,
);

CREATE TABLE ContagiosFact(
	numero_caso INT NOT NULL PRIMARY KEY,
	numero_dias_demora_diagnostico INT,
	cantidad_contagio INT,
	fecha_sintomas DATE,
	fecha_diagnostico DATE,
	caso INT,
	rango_edad VARCHAR(10),
	estadoSalud VARCHAR(100),
	ubicacion VARCHAR(100),
	fuenteContagio VARCHAR(100),
	localidad VARCHAR(100),
	CONSTRAINT fecSin_fk_con FOREIGN KEY (fecha_sintomas) REFERENCES DimFechas(fecha),
	CONSTRAINT fecDiag_fk_con FOREIGN KEY (fecha_diagnostico) REFERENCES DimFechas(fecha),
	CONSTRAINT cas_fk_con FOREIGN KEY (caso) REFERENCES DimCasos(id),
	CONSTRAINT ranEdad_fk_con FOREIGN KEY (rango_edad) REFERENCES DimRangoEdades(rango),
	CONSTRAINT estSal_fk_con FOREIGN KEY (estadoSalud) REFERENCES DimEstadosSalud(nombre_estado_salud),
	CONSTRAINT ubi_fk_con FOREIGN KEY (ubicacion) REFERENCES DimUbicaciones(nombre_ubicacion),
	CONSTRAINT fuenCon_fk_con FOREIGN KEY (fuenteContagio) REFERENCES DimFuentesContagio(nombre_fuente_contagio),
	CONSTRAINT ciudLoc_fk_con FOREIGN KEY (localidad) REFERENCES DimLocalidades(nombre_localidad)
);