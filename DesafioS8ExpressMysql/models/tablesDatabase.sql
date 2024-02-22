-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 25-Jun-2023 às 05:54
-- Versão do servidor: 10.4.27-MariaDB
-- versão do PHP: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados:  crud-app 
--

-- --------------------------------------------------------

--
-- Estrutura da tabela  clientes 
--

CREATE TABLE  clientes  (
   ID  int(6) NOT NULL,
   Nome  varchar(20) DEFAULT NULL,
   Sobrenome  varchar(50) DEFAULT NULL,
   Email  varchar(50) DEFAULT NULL,
   Idade  int(3) DEFAULT NULL,
   Data_cadastro  date NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela  clientes 
--

INSERT INTO  clientes  ( ID ,  Nome ,  Sobrenome ,  Email ,  Idade ,  Data_cadastro ) VALUES
(2, 'Dara', 'Alves', 'dara@gmail.com', 26, '2023-04-13'),
(3, 'GiGi', 'Ggi', 'Gigi@gmail.com', 7, '2023-04-17'),
(6, 'Mozao', 'Mozao', 'mozao@gmail.com', 26, '2023-06-24'),
(7, 'GiGI', 'Gigi', 'mozao@gmail.com', 26, '2023-06-24'),
(9, 'Mozao', 'mozin', 'mozao@gmail.com', 26, '2023-06-25');

-- --------------------------------------------------------

--
-- Estrutura da tabela  produtos 
--

CREATE TABLE  produtos  (
   ID  int(11) NOT NULL,
   Nome  varchar(20) NOT NULL,
   Descricao  varchar(50) NOT NULL,
   Preco  decimal(10,0) NOT NULL,
   Data_Atualizado  datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Extraindo dados da tabela  produtos 
--

INSERT INTO  produtos  ( ID ,  Nome ,  Descricao ,  Preco ,  Data_Atualizado ) VALUES
(2, 'ffff', 'Limpeza', '6', '2023-06-24 21:59:51'),
(3, 'bucha', 'buchax', '3', '2023-06-24 22:20:58'),
(10, 'xxxx', 'louca', '5', '2023-06-25 00:50:03');

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela  clientes 
--
ALTER TABLE  clientes 
  ADD PRIMARY KEY ( ID );

--
-- Índices para tabela  produtos 
--
ALTER TABLE  produtos 
  ADD PRIMARY KEY ( ID );

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela  clientes 
--
ALTER TABLE  clientes 
  MODIFY  ID  int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela  produtos 
--
ALTER TABLE  produtos 
  MODIFY  ID  int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
