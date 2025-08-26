-- #############################################################################
-- #                                                                           #
-- #                     SCRIPT SQL PARA BANCO DE DADOS                        #
-- #                         DE PET VIDA                                       #
-- #                                                                           #
-- #############################################################################

-- -----------------------------------------------------------------------------
-- 1. CRIAÇÃO DO BANCO DE DADOS
--   
-- -----------------------------------------------------------------------------

    CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    nome_cliente VARCHAR(60), cpf_cliente VARCHAR(30),
    telefone_cliente VARCHAR(30), email_cliente VARCHAR(60),
    endereço_cliente VARCHAR(60),
    status_cliente INT NOT NULL
   );
   
   CREATE TABLE animal (
    id_animal int primary key not null AUTO_INCREMENT, 
    nome_animalvarchar(60) not NULL,
    porte_animal varchar(30), raca varchar(30),
    pelo varchar(30),
	);

   CREATE TABLE consulta (
    id_consulta INT PRIMARY KEY AUTO_INCREMENT,
    data_consulta DATE NOT NULL,
    hora_consulta TIME NOT NULL,
    veterinario_responsavel VARCHAR(60),
    descricao_consulta VARCHAR(100) NOT NULL,
    id_animal INT NOT NULL,
    id_veterinario INT NOT NULL  
  );


   CREATE TABLE veterinario (
    id_veterinario INT PRIMARY KEY AUTO_INCREMENT,
    nome_veterinario VARCHAR(60),
    crmv_veterinario INT,
    telefone_veterinario VARCHAR(30)
   );


   CREATE TABLE tratamento (
    id_tratamento INT PRIMARY KEY AUTO_INCREMENT,
    descricao_tratamento VARCHAR(100),
    id_animal INT NOT NULL 
   );

 
   CREATE TABLE aplicacao (
    id_aplicacao INT PRIMARY KEY AUTO_INCREMENT,
    data_aplicacao DATE NOT NULL,
    id_animal INT NOT NULL,
    id_vacina INT NOT NULL,
    id_veterinario INT NOT NULL
   );


   CREATE TABLE historico (
    id_historico INT PRIMARY KEY AUTO_INCREMENT,
    data_historico DATE NOT NULL,
    descricao_historico VARCHAR(100),
    id_animal INT NOT NULL
   );

   CREATE TABLE agendamento (
    id_agendamento INT PRIMARY KEY AUTO_INCREMENT,
    data_agendamento DATE NOT NULL,
    descricao_agendamento VARCHAR(100),
    id_animal INT NOT NULL
   );
    
   CREATE TABLE vacina (
    id_vacina INT PRIMARY KEY AUTO_INCREMENT,
    nome_vacina VARCHAR(60) NOT NULL,
    descricao_tratamento VARCHAR(100) NOT NULL,
    id_animal INT NOT NULL
   ); 


 Esses são os selects que eu fiz.
 Na pasta imagem tem os print das imagens do Banco de dados. 

USE petvida;
-- ------------------------------------------- INSERT CLIENTE -----------------------------------------------------------------

SELECT * FROM cliente;

-- ------------------------------------------- INSERT ANIMAL ------------------------------------------------------------------

SELECT * FROM animal;

-- -----------------------------------------  INSERT CONSULTA ------------------------------------------------------------------

SELECT * FROM consulta;


--                                         ## CONSULTAS BÁSICAS ##

-- ------------------------------------ ESCOLHER COLUNAS ESPECÍFICAS ------------------------------------------------------------
SELECT nome_cliente, telefone_cliente FROM cliente; 


-- ----------------------------------------- FILTRAR REGISTROS ------------------------------------------------------------------
SELECT * FROM cliente WHERE status_cliente = 1;


-- ---------------------------------------- ORDENAR RESULTADOS ------------------------------------------------------------------




--                             ## CONSULTAS COM CONDIÇÕES MAIS AVANÇADAS ## 

-- ------------------------------- USAR LIKE PARA BUSCAR PARTE DO TEXTO  --------------------------------------------------------
SELECT * FROM cliente WHERE nome_cliente LIKE '%Lu%';


-- ---------------------------------- FILTRAR POR INTERVALO DE DATAS ------------------------------------------------------------
SELECT * FROM consulta WHERE data_consulta BETWEEN '2025-02-27' AND '2025-08-03';


-- ---------------------------------- FILTRAR COM MÚLTIPLAS CONDIÇÕES -----------------------------------------------------------
SELECT * FROM animal WHERE especie = 'Gato' AND porte_animal = 'Médio';

