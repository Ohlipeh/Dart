 Script do MYSQL

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

