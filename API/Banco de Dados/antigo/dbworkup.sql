-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 15/11/2024 às 19:53
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `dbworkup`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_admin`
--

CREATE TABLE `tb_admin` (
  `idAdmin` int(11) NOT NULL,
  `nomeAdmin` varchar(120) NOT NULL,
  `usernameAdmin` varchar(120) NOT NULL,
  `emailAdmin` varchar(120) NOT NULL,
  `senhaAdmin` varchar(300) NOT NULL,
  `contatoAdmin` varchar(120) NOT NULL,
  `fotoAdmin` text NOT NULL,
  `idStatus` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_admin`
--

INSERT INTO `tb_admin` (`idAdmin`, `nomeAdmin`, `usernameAdmin`, `emailAdmin`, `senhaAdmin`, `contatoAdmin`, `fotoAdmin`, `idStatus`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'admin@admin.com', '$2y$10$cUpTQVon8qNrfny1.849iO0G.w7/.Fuu9tQ2xNtKnikjOj7N2Jctm', '(11)9 9999-9999', 'fc29c16347cac127de9ef3d04cd20f68.jpg', 1, '2024-11-13 20:31:50', '2024-11-13 20:31:50'),
(2, 'Danilo da Silva', 'Danilo', 'danilo@gmail.com', '$2y$10$zRWHNqxm7cnsOTmOB6Ll6OsNP.pCKw9XmCqpyo/AeQ.TxYgQo4Ihm', '(11)9 1111-1111', 'fc29c16347cac127de9ef3d04cd20f68.jpg', 1, '2024-11-13 20:31:50', '2024-11-13 20:31:50'),
(3, 'Vitor Augusto', 'Vitor', 'vitor@gmail.com', '$2y$10$x7xwpwULEswNXDbVg5AdsuxxvBuVijL7Ofg28m2v0tiTBZUhwwRBS', '(11)9 1111-1111', 'fc29c16347cac127de9ef3d04cd20f68.jpg', 1, '2024-11-13 20:31:50', '2024-11-13 20:31:50');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_area`
--

CREATE TABLE `tb_area` (
  `idArea` int(11) NOT NULL,
  `nomeArea` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_area`
--

INSERT INTO `tb_area` (`idArea`, `nomeArea`) VALUES
(1, 'Tecnologia'),
(2, 'Marketing'),
(3, 'Gestão'),
(4, 'Gastronomia'),
(5, 'Administração'),
(6, 'Medicina'),
(7, 'Educação'),
(8, 'Finança'),
(9, 'Recursos Humanos'),
(10, 'Logística'),
(11, 'Alimentação'),
(12, 'Serviços Gerais'),
(13, 'Higienização'),
(14, 'Engenharia'),
(15, 'Meio Ambiente');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_areainteresseusuario`
--

CREATE TABLE `tb_areainteresseusuario` (
  `idAreaInteresseUsuario` int(11) NOT NULL,
  `idArea` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_atuacaoempresa`
--

CREATE TABLE `tb_atuacaoempresa` (
  `idAtuacaoEmpresa` int(11) NOT NULL,
  `idArea` int(11) NOT NULL,
  `idEmpresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_chat`
--

CREATE TABLE `tb_chat` (
  `idChat` int(11) NOT NULL,
  `idEmpresa` int(11) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `idAdmin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_denunciaempresa`
--

CREATE TABLE `tb_denunciaempresa` (
  `idDenunciaEmpresa` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `motivo` varchar(300) NOT NULL,
  `idStatus` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_denunciausuario`
--

CREATE TABLE `tb_denunciausuario` (
  `idDenunciaUsuario` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `motivo` varchar(300) NOT NULL,
  `idStatus` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_denunciavaga`
--

CREATE TABLE `tb_denunciavaga` (
  `idDenunciaVaga` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idVaga` int(11) NOT NULL,
  `motivo` varchar(300) NOT NULL,
  `idStatus` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_empresa`
--

CREATE TABLE `tb_empresa` (
  `idEmpresa` int(11) NOT NULL,
  `usernameEmpresa` varchar(50) NOT NULL,
  `nomeEmpresa` varchar(100) NOT NULL,
  `emailEmpresa` varchar(50) NOT NULL,
  `fotoEmpresa` text NOT NULL,
  `bannerEmpresa` text NOT NULL,
  `sobreEmpresa` text NOT NULL,
  `cnpjEmpresa` varchar(50) NOT NULL,
  `contatoEmpresa` varchar(50) NOT NULL,
  `senhaEmpresa` varchar(300) NOT NULL,
  `cidadeEmpresa` varchar(50) NOT NULL,
  `estadoEmpresa` varchar(50) NOT NULL,
  `LogradouroEmpresa` varchar(50) NOT NULL,
  `cepEmpresa` varchar(50) NOT NULL,
  `numeroLograEmpresa` varchar(50) NOT NULL,
  `avaliacaoEmpresa` varchar(50) DEFAULT NULL,
  `idStatus` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_empresa`
--

INSERT INTO `tb_empresa` (`idEmpresa`, `usernameEmpresa`, `nomeEmpresa`, `emailEmpresa`, `fotoEmpresa`, `bannerEmpresa`, `sobreEmpresa`, `cnpjEmpresa`, `contatoEmpresa`, `senhaEmpresa`, `cidadeEmpresa`, `estadoEmpresa`, `LogradouroEmpresa`, `cepEmpresa`, `numeroLograEmpresa`, `avaliacaoEmpresa`, `idStatus`, `created_at`, `updated_at`) VALUES
(1, 'José', 'Ambev', 'ambev@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2FAmbev.jpg?alt=media&token=981237ef-2db1-4780-8763-827a73bf1fae', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2FAmbev.jpg?alt=media&token=708954de-3b4a-4bc0-bd27-d37b4fc1117f', 'Ambev é uma gigante do setor de bebidas no Brasil.', '10.123.456/0001-23', '11 4000-5000', '$2y$10$iE21AmqxIYzldRRq8VE9seY/qrFBvyIyWnTT4bdU5gchVHbrGGXei', 'São Paulo', 'SP', 'Av. Paulista', '01310-100', '1000', '', 1, '2024-11-15 13:59:37', '2024-11-15 13:59:37'),
(2, 'Luciana', 'B2W Digital', 'b2wdigital@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2FB2W%20Digital.jpg?alt=media&token=965db6c0-05f7-40e1-8ff9-efded2a68a7d', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2FB2W%20Digital.png?alt=media&token=9d30cb9c-9852-4e19-902d-acb7d135a70c', 'B2W Digital é líder no e-commerce brasileiro.', '20.234.567/0001-12', '11 5000-6000', '$2y$10$iE21AmqxIYzldRRq8VE9seY/qrFBvyIyWnTT4bdU5gchVHbrGGXei', 'São Paulo', 'SP', 'Rua dos Três Irmãos', '02250-000', '950', '', 1, '2024-11-15 13:59:37', '2024-11-15 13:59:37'),
(3, 'Marcelo', 'Beyond Meat', 'beyondmeat@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2FBeyond%20meat.jpg?alt=media&token=38bdf3fe-a9f9-4b3e-81ae-608ad4a84d5d', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2FBeyond%20meat.jpg?alt=media&token=a2539192-5455-4739-8336-67c9730b8666', 'Beyond Meat é especializada em alimentos à base de plantas.', '30.123.456/0001-45', '11 6000-7000', '$2y$10$iE21AmqxIYzldRRq8VE9seY/qrFBvyIyWnTT4bdU5gchVHbrGGXei', 'São Paulo', 'SP', 'Av. Rio Branco', '20090-000', '2000', '', 1, '2024-11-15 13:59:37', '2024-11-15 13:59:37'),
(4, 'Fernanda', 'Cosan', 'cosan@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2FCosan.png?alt=media&token=b551aca7-a8e3-4a23-a7a9-6a2fc8acce41', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2FCosan.jpg?alt=media&token=49f61ea4-de89-4f15-a924-7eb9437beb35', 'Cosan é uma das maiores empresas de energia e infraestrutura do Brasil.', '40.234.567/0001-56', '11 7000-8000', '$2y$10$iE21AmqxIYzldRRq8VE9seY/qrFBvyIyWnTT4bdU5gchVHbrGGXei', 'São Paulo', 'SP', 'Rua das Flores', '03120-000', '1500', '', 1, '2024-11-15 13:59:37', '2024-11-15 13:59:37'),
(5, 'Juliana', 'Deloitte', 'deloitte@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2FDeloitte.png?alt=media&token=d4510eb2-2dcd-408b-bda1-4fa2073e6d17', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2FDeloitte.jpg?alt=media&token=473ce5f7-5d3c-459c-87e3-1b7acdcecf9c', 'Deloitte oferece serviços de consultoria, auditoria e soluções financeiras.', '50.345.678/0001-67', '11 8000-9000', '$2y$10$iE21AmqxIYzldRRq8VE9seY/qrFBvyIyWnTT4bdU5gchVHbrGGXei', 'São Paulo', 'SP', 'Rua dos Três Irmãos', '01230-000', '1000', '', 1, '2024-11-15 13:59:37', '2024-11-15 13:59:37'),
(6, 'Roberta', 'Embraer', 'embraer@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2FEmbraer.png?alt=media&token=86f69706-ad01-41c9-a814-de949db53859', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2FEmbraer.jpg?alt=media&token=7c7da5b2-b464-4309-baf8-efd80c637140', 'Embraer é uma empresa de aviação com presença internacional.', '60.456.789/0001-78', '11 9000-1000', '$2y$10$iE21AmqxIYzldRRq8VE9seY/qrFBvyIyWnTT4bdU5gchVHbrGGXei', 'São Paulo', 'SP', 'Av. Brasil', '01020-000', '2000', '', 1, '2024-11-15 13:59:37', '2024-11-15 13:59:37'),
(7, 'Ana', 'Ernst & Young', 'ey@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2FErnst%20%26%20Young%20(EY).png?alt=media&token=431d58a5-fdfe-4b6d-aca4-1641bf3df8f8', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2FErnst%20%26%20Young%20(EY).jpg?alt=media&token=7e013925-8a17-46ef-aeec-7ac72d06a898', 'Ernst & Young é uma consultoria global em auditoria e impostos.', '70.567.890/0001-89', '11 1000-2000', '$2y$10$iE21AmqxIYzldRRq8VE9seY/qrFBvyIyWnTT4bdU5gchVHbrGGXei', 'São Paulo', 'SP', 'Rua dos Mirantes', '01110-000', '1200', '', 1, '2024-11-15 13:59:37', '2024-11-15 13:59:37'),
(8, 'Thiago', 'KPMG', 'kpmg@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2FKPMG.png?alt=media&token=c91fb2b4-865f-4542-ab6d-872daac4c46d', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2FKPMG.jpg?alt=media&token=3b59e1cf-eb47-4029-b0cb-19253a8432f8', 'KPMG é uma multinacional especializada em auditoria, impostos e consultoria.', '80.678.901/0001-90', '11 2000-3000', '$2y$10$iE21AmqxIYzldRRq8VE9seY/qrFBvyIyWnTT4bdU5gchVHbrGGXei', 'São Paulo', 'SP', 'Av. do Estado', '01040-000', '2500', '', 1, '2024-11-15 13:59:37', '2024-11-15 13:59:37'),
(9, 'Mariana', 'Mercado Livre', 'mercadolivre@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2FMercado%20Livre.png?alt=media&token=be8f2443-d4e3-428d-9e66-79c60c13dfd4', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2FMercado%20Livre.jpg?alt=media&token=4bf7e3f2-ba84-44ef-bbba-1fa911f0d154', 'Mercado Livre é a maior plataforma de e-commerce da América Latina.', '90.789.012/0001-01', '11 3000-4000', '$2y$10$iE21AmqxIYzldRRq8VE9seY/qrFBvyIyWnTT4bdU5gchVHbrGGXei', 'São Paulo', 'SP', 'Av. Paulista', '01320-000', '3500', '', 1, '2024-11-15 13:59:37', '2024-11-15 13:59:37'),
(10, 'Fernando', 'Microsoft', 'microsoft@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2FMicrosof.png?alt=media&token=fc4fccc2-8556-48d1-9d01-4e8b9a93f281', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2FMicrosoft.jpg?alt=media&token=747982c6-ad04-4b3f-8cd9-3588dccfeb87', 'Microsoft é uma multinacional especializada em tecnologia e software.', '100.890.123/0001-23', '11 4000-5000', '$2y$10$iE21AmqxIYzldRRq8VE9seY/qrFBvyIyWnTT4bdU5gchVHbrGGXei', 'São Paulo', 'SP', 'Rua dos Informáticos', '01070-000', '4500', '', 1, '2024-11-15 13:59:37', '2024-11-15 13:59:37'),
(11, 'Paula', 'Natura', 'natura@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2FNatura.png?alt=media&token=28f8d457-bbaa-4b0a-a8aa-91e5cb84e21a', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2FNatura.jpg?alt=media&token=b897f02a-bc9d-4985-af9b-337375264e00', 'Natura é uma empresa de cosméticos que preza pelo respeito ao meio ambiente.', '110.234.567/0001-34', '11 5000-6000', '$2y$10$iE21AmqxIYzldRRq8VE9seY/qrFBvyIyWnTT4bdU5gchVHbrGGXei', 'São Paulo', 'SP', 'Av. das Palmeiras', '01080-000', '3200', '', 1, '2024-11-15 13:59:37', '2024-11-15 13:59:37'),
(12, 'Ricardo', 'Nubank', 'nubank@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2FNubank.png?alt=media&token=fd397c57-fd30-4a86-8bfb-ccd79b3c0ce4', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2FNubank.jpg?alt=media&token=40ac8289-1014-4ea2-b464-9f9da3ad3bc2', 'Nubank é uma fintech que revolucionou o mercado financeiro no Brasil.', '120.345.678/0001-45', '11 6000-7000', '$2y$10$iE21AmqxIYzldRRq8VE9seY/qrFBvyIyWnTT4bdU5gchVHbrGGXei', 'São Paulo', 'SP', 'Rua do Crédito', '01090-000', '2700', '', 1, '2024-11-15 13:59:37', '2024-11-15 13:59:37'),
(13, 'Eduardo', 'PagSeguro', 'pagseguro@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2FPagSeguro.png?alt=media&token=92c7a9a5-a3f6-410d-8ca6-3a8d4d788ced', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2FPagSeguro.jpg?alt=media&token=d5cd28e9-c9dc-47ad-a8f7-6b79fcb5f562', 'PagSeguro oferece soluções de pagamentos online para empresas.', '130.456.789/0001-56', '11 7000-8000', '$2y$10$iE21AmqxIYzldRRq8VE9seY/qrFBvyIyWnTT4bdU5gchVHbrGGXei', 'São Paulo', 'SP', 'Av. das Empresas', '01100-000', '1900', '', 1, '2024-11-15 13:59:37', '2024-11-15 13:59:37'),
(14, 'Lucia', 'Petrobras', 'petrobras@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2FPetrobras.png?alt=media&token=5934418c-9a25-4e64-87be-ef5e7fcb1c32', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2FPetrobras.webp?alt=media&token=367ab599-fc53-4a58-be02-c08b80a3070b', 'Petrobras é a maior empresa de energia do Brasil.', '140.567.890/0001-67', '11 8000-9000', '$2y$10$iE21AmqxIYzldRRq8VE9seY/qrFBvyIyWnTT4bdU5gchVHbrGGXei', 'São Paulo', 'SP', 'Rua das Energias', '01200-000', '3800', '', 1, '2024-11-15 13:59:37', '2024-11-15 13:59:37'),
(15, 'Amanda', 'PricewaterhouseCoopers', 'pwc@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2FPricewaterhouseCoopers.png?alt=media&token=0d968598-4be8-4b3d-93f0-2b74fe450134', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2FPricewaterhouseCoopers.jpg?alt=media&token=a479bec5-7cc5-43c7-916a-4ddddc69423d', 'PricewaterhouseCoopers é uma das maiores empresas de auditoria e consultoria do mundo.', '150.678.901/0001-78', '11 9000-1000', '$2y$10$iE21AmqxIYzldRRq8VE9seY/qrFBvyIyWnTT4bdU5gchVHbrGGXei', 'São Paulo', 'SP', 'Av. do Trabalho', '01030-000', '2200', '', 1, '2024-11-15 13:59:37', '2024-11-15 13:59:37'),
(16, 'Lucas', 'Raízen', 'raizen@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2FRa%C3%ADzen.png?alt=media&token=6d5e023e-b41b-485a-b994-a5fa6a471f4b', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2FRa%C3%ADzen.png?alt=media&token=5f132886-6de8-4844-a65b-c08852fc22be', 'Raízen é uma das maiores empresas de energia e distribuição de combustíveis do Brasil.', '160.789.012/0001-89', '11 1000-2000', '$2y$10$iE21AmqxIYzldRRq8VE9seY/qrFBvyIyWnTT4bdU5gchVHbrGGXei', 'São Paulo', 'SP', 'Av. das Indústrias', '01330-000', '4500', '', 1, '2024-11-15 13:59:37', '2024-11-15 13:59:37'),
(17, 'Carlos', 'TOTVS', 'totvs@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2FTOTVS.png?alt=media&token=e0828a80-a24f-4b45-a331-b666a0c494b2', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2FTOTVS.png?alt=media&token=6f816542-cd99-4d35-9d1b-81334a402bbc', 'TOTVS é uma das líderes brasileiras no setor de software de gestão empresarial.', '170.890.123/0001-90', '11 1100-2200', '$2y$10$iE21AmqxIYzldRRq8VE9seY/qrFBvyIyWnTT4bdU5gchVHbrGGXei', 'São Paulo', 'SP', 'Rua da Tecnologia', '01340-000', '3200', '', 1, '2024-11-15 13:59:37', '2024-11-15 13:59:37'),
(18, 'Luiz', 'XP Inc', 'xp@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2FXP%20Inc..png?alt=media&token=01a563a9-2076-4b06-a329-7b0fd4ff87cd', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2FXP%20Inc..jpg?alt=media&token=c3fb83a2-c10c-4a8d-9d5f-a4c50d231d73', 'XP Inc é uma corretora brasileira especializada em investimentos e serviços financeiros.', '180.901.234/0001-01', '11 1200-2300', '$2y$10$iE21AmqxIYzldRRq8VE9seY/qrFBvyIyWnTT4bdU5gchVHbrGGXei', 'São Paulo', 'SP', 'Av. do Investimento', '01350-000', '2900', '', 1, '2024-11-15 13:59:37', '2024-11-15 13:59:37'),
(19, 'Daniel', 'Enel', 'enel@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2Fenel.jpg?alt=media&token=5105fb05-9799-48a8-9e3e-fb883296fc60', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2Fenel.jpg?alt=media&token=6df55175-0054-4b73-b4c8-fdf0281cc11a', 'Enel é uma das maiores distribuidoras de energia elétrica no Brasil e no mundo.', '190.012.345/0001-23', '11 1300-2400', '$2y$10$iE21AmqxIYzldRRq8VE9seY/qrFBvyIyWnTT4bdU5gchVHbrGGXei', 'São Paulo', 'SP', 'Rua da Energia', '01400-000', '4000', '', 1, '2024-11-15 13:59:37', '2024-11-15 13:59:37'),
(20, 'Marcos', 'Sony', 'sony@gmail.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2Fsony.jpg?alt=media&token=49a3ecd8-8593-4b8d-abd8-462fa1a840de', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2Fsony.jpg?alt=media&token=2fa008c1-9d04-4ddc-b172-fd51c73590f9', 'Sony é uma multinacional japonesa que atua nos setores de eletrônicos, entretenimento e tecnologia.', '200.123.456/0001-34', '11 1400-2500', '$2y$10$iE21AmqxIYzldRRq8VE9seY/qrFBvyIyWnTT4bdU5gchVHbrGGXei', 'São Paulo', 'SP', 'Av. das Inovações', '01500-000', '5000', '', 1, '2024-11-15 13:59:37', '2024-11-15 13:59:37');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_escolas`
--

CREATE TABLE `tb_escolas` (
  `idEscolas` int(11) NOT NULL,
  `nomeEscola` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_escolas`
--

INSERT INTO `tb_escolas` (`idEscolas`, `nomeEscola`) VALUES
(1, 'Escola Primavera'),
(2, 'Colégio Estrela do Saber'),
(3, 'Instituto Educacional Futuro'),
(4, 'Escola Nova Esperança'),
(5, 'Centro de Ensino Horizonte');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_linguas`
--

CREATE TABLE `tb_linguas` (
  `idLingua` int(11) NOT NULL,
  `nomeLingua` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_linguas`
--

INSERT INTO `tb_linguas` (`idLingua`, `nomeLingua`) VALUES
(1, 'Português'),
(2, 'Inglês'),
(3, 'Espanhol'),
(4, 'Francês'),
(5, 'Alemão'),
(6, 'Italiano'),
(7, 'Japonês'),
(8, 'Chinês'),
(9, 'Árabe'),
(10, 'Russo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_mensagem`
--

CREATE TABLE `tb_mensagem` (
  `idMensagem` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `mensagem` text NOT NULL,
  `tipoEmissor` varchar(15) DEFAULT NULL,
  `idChat` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_modalidadevaga`
--

CREATE TABLE `tb_modalidadevaga` (
  `idModalidadeVaga` int(11) NOT NULL,
  `descModalidadeVaga` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_modalidadevaga`
--

INSERT INTO `tb_modalidadevaga` (`idModalidadeVaga`, `descModalidadeVaga`) VALUES
(1, 'Presencial'),
(2, 'Híbrido'),
(3, 'Remoto');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_notificacoes`
--

CREATE TABLE `tb_notificacoes` (
  `idNotificacao` int(11) NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idVaga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_publicacao`
--

CREATE TABLE `tb_publicacao` (
  `idPublicacao` int(11) NOT NULL,
  `tituloPublicacao` varchar(100) NOT NULL,
  `detalhePublicacao` varchar(300) NOT NULL,
  `fotoPublicacao` text DEFAULT NULL,
  `idEmpresa` int(11) NOT NULL,
  `idAdmin` int(11) DEFAULT NULL,
  `idVaga` int(11) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_publicacao`
--

INSERT INTO `tb_publicacao` (`idPublicacao`, `tituloPublicacao`, `detalhePublicacao`, `fotoPublicacao`, `idEmpresa`, `idAdmin`, `idVaga`, `updated_at`, `created_at`) VALUES
(1, 'Oportunidade na Ambev: Analista de Vendas', 'A Ambev está em busca de um Analista de Vendas para atuar no crescimento da nossa rede de distribuição. Venha fazer parte de um time vencedor!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FAmbev%201.jpg?alt=media&token=40aa3506-9b6c-48e0-9c7f-4a34ce3db010', 1, NULL, NULL, '2024-11-15 15:14:54', '2024-11-15 15:14:54'),
(2, 'Participe do time da Ambev: Analista de Marketing', 'Se você tem paixão por marketing e deseja trabalhar em uma das maiores empresas de bebidas do mundo, inscreva-se para a vaga de Analista de Marketing na Ambev!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FAmbev%202.jpg?alt=media&token=d9466975-7c92-4c2e-99f5-e10e3b29dac1', 1, NULL, NULL, '2024-11-15 15:14:54', '2024-11-15 15:14:54'),
(3, 'B2W Digital está contratando: Coordenador de E-commerce', 'A B2W Digital está em busca de um Coordenador de E-commerce para impulsionar o crescimento das suas plataformas de vendas online. Faça parte de uma das maiores empresas de e-commerce do Brasil!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FB2W%20Digital%201.jpg?alt=media&token=0c76c833-2f60-4c81-abc2-7263c866dc7d', 2, NULL, NULL, '2024-11-15 15:14:54', '2024-11-15 15:14:54'),
(4, 'B2W Digital: Vaga para Analista de Dados', 'Venha trabalhar com grandes volumes de dados e contribuir para a análise estratégica da B2W Digital. A vaga é para Analista de Dados e você pode ser a pessoa que estamos procurando!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FB2W%20Digital%202.jpg?alt=media&token=2e2a4721-073c-46e5-9612-f6aee2214950', 2, NULL, NULL, '2024-11-15 15:14:54', '2024-11-15 15:14:54'),
(5, 'Beyond Meat está contratando: Especialista em Sustentabilidade', 'Se você acredita que pode fazer a diferença em um mundo mais sustentável, a Beyond Meat oferece uma oportunidade única para Especialista em Sustentabilidade!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FBeyond%20meat%201.jpg?alt=media&token=40550a61-33c1-4e78-b7ea-2be9e9edb93d', 3, NULL, NULL, '2024-11-15 15:14:54', '2024-11-15 15:14:54'),
(6, 'Beyond Meat: Vaga para Gerente de Produção', 'A Beyond Meat busca um Gerente de Produção para liderar nossas operações e expandir a produção de alimentos inovadores e sustentáveis. Venha transformar o futuro da alimentação!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FBeyond%20meat%202.jpg?alt=media&token=8e9ff5b4-abdb-44c7-b137-d24e51a048a0', 3, NULL, NULL, '2024-11-15 15:14:54', '2024-11-15 15:14:54'),
(7, 'Vaga de Coordenador Logístico na Cosan', 'A Cosan está em busca de um Coordenador Logístico para otimizar as operações de transporte e distribuição de produtos. Se você tem experiência em logística, venha fazer parte do nosso time!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FCosan%201.jpg?alt=media&token=6f14b95d-3ef1-4db2-9ea4-07bab573d089', 4, NULL, NULL, '2024-11-15 15:14:55', '2024-11-15 15:14:55'),
(8, 'Cosan: Oportunidade para Engenheiro de Produção', 'Estamos contratando um Engenheiro de Produção para trabalhar com operações industriais e otimizar a produção no setor energético. Junte-se à Cosan e ajude a criar soluções sustentáveis!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FCosan%202.jpg?alt=media&token=7cb12f0f-1ce1-4978-a759-7aec3dbe2bd8', 4, NULL, NULL, '2024-11-15 15:14:55', '2024-11-15 15:14:55'),
(9, 'Deloitte: Vaga para Consultor de TI', 'A Deloitte busca um Consultor de TI para ajudar a transformar as operações de empresas líderes no mercado. Se você tem experiência em TI e busca desafios, essa é a sua oportunidade!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FDeloitte%201.jpg?alt=media&token=b6d6f79d-fb1b-4ca7-a666-3e58c2c9ba4d', 5, NULL, NULL, '2024-11-15 15:14:55', '2024-11-15 15:14:55'),
(10, 'Consultor de Estratégia na Deloitte', 'Venha atuar na Deloitte como Consultor de Estratégia e ajudar grandes empresas a melhorar seus resultados. Essa é a chance de fazer a diferença em projetos desafiadores e inovadores!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FDeloitte%202.jpg?alt=media&token=5d462ac8-587b-450c-a81a-a4e128e6fbe3', 5, NULL, NULL, '2024-11-15 15:14:55', '2024-11-15 15:14:55'),
(11, 'Embraer: Oportunidade para Engenheiro Aeronáutico', 'A Embraer está contratando um Engenheiro Aeronáutico para desenvolver e otimizar as aeronaves do futuro. Se você é apaixonado por tecnologia e inovação, essa vaga é para você!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FEmbraer%201.jpg?alt=media&token=aafdd875-7f14-462e-932f-3a3490890cf9', 6, NULL, NULL, '2024-11-15 15:14:56', '2024-11-15 15:14:56'),
(12, 'Embraer: Vaga para Analista de Produção', 'A Embraer oferece uma vaga para Analista de Produção para atuar diretamente nas linhas de montagem de aviões. Junte-se a nós para contribuir com a inovação no setor aeroespacial!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FEmbraer%202.jpg?alt=media&token=cacb6d04-6b50-4b62-a18a-a4a128e6fbe3', 6, NULL, NULL, '2024-11-15 15:14:56', '2024-11-15 15:14:56'),
(13, 'EY: Vaga para Auditor Fiscal', 'A Ernst & Young (EY) está contratando um Auditor Fiscal para atuar no setor tributário e de compliance. Se você tem experiência em auditoria e contabilidade, venha fazer parte do nosso time!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FErnst%20%26%20Young%20(EY)%201.jpg?alt=media&token=c8754eb1-a332-4f6f-9773-60fe01b03908', 7, NULL, NULL, '2024-11-15 15:14:56', '2024-11-15 15:14:56'),
(14, 'Vaga de Consultor de Riscos na EY', 'A EY busca um Consultor de Riscos para ajudar nossos clientes a mitigar riscos financeiros e operacionais. Venha aplicar sua expertise em um ambiente de aprendizado contínuo!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FErnst%20%26%20Young%20(EY)%202.jpg?alt=media&token=a7a2fda8-7fa5-45b4-9073-c05dac450ce3', 7, NULL, NULL, '2024-11-15 15:14:56', '2024-11-15 15:14:56'),
(15, 'KPMG: Oportunidade para Consultor Tributário', 'A KPMG está contratando um Consultor Tributário para atuar em consultoria estratégica e planejamento tributário. Se você é especialista na área, venha se juntar ao nosso time!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FKPMG%201.jpg?alt=media&token=336fab12-81b5-460e-8f3f-3671a3ba2b86', 8, NULL, NULL, '2024-11-15 15:14:56', '2024-11-15 15:14:56'),
(16, 'Vaga de Auditor Sênior na KPMG', 'A KPMG oferece uma vaga de Auditor Sênior para quem tem experiência em auditoria e deseja trabalhar com grandes empresas. Aproveite essa oportunidade única!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FKPMG%202.jpg?alt=media&token=66ab5b02-e952-4ad0-80a8-37a1fe9f9e07', 8, NULL, NULL, '2024-11-15 15:14:56', '2024-11-15 15:14:56'),
(17, 'Mercado Livre: Vaga para Gerente de Marketing Digital', 'Se você tem experiência em marketing digital e deseja atuar em uma das maiores plataformas de e-commerce da América Latina, inscreva-se para a vaga de Gerente de Marketing Digital no Mercado Livre!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FMercado%20Livre%201.jpg?alt=media&token=062a4a16-2d3e-4f17-b6b8-d9ace8bd7798', 9, NULL, NULL, '2024-11-15 15:14:56', '2024-11-15 15:14:56'),
(18, 'Vaga para Analista de Comércio Eletrônico no Mercado Livre', 'O Mercado Livre busca um Analista de Comércio Eletrônico para otimizar nossas operações online e proporcionar uma experiência de compra excepcional aos nossos clientes.', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FMercado%20Livre%202.jpg?alt=media&token=99c939e6-ca73-49f7-8fb9-f5187b496fc0', 9, NULL, NULL, '2024-11-15 15:14:56', '2024-11-15 15:14:56'),
(19, 'Microsoft: Oportunidade para Desenvolvedor de Software', 'A Microsoft está contratando um Desenvolvedor de Software para trabalhar em projetos inovadores e de grande impacto global. Se você tem paixão por tecnologia, inscreva-se agora!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FMicrosoft%201.png?alt=media&token=fadd5f0c-9682-410b-8bd4-8b3393100c41', 10, NULL, NULL, '2024-11-15 15:14:56', '2024-11-15 15:14:56'),
(20, 'Microsoft: Vaga para Especialista em Cloud Computing', 'A Microsoft está em busca de um Especialista em Cloud Computing para fortalecer nossa equipe de soluções na nuvem. Se você tem experiência em Azure, essa vaga é para você!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FMicrosoft%202.jpg?alt=media&token=c9a4d400-b7d4-40b6-b200-97a692f1d594', 10, NULL, NULL, '2024-11-15 15:14:56', '2024-11-15 15:14:56'),
(30, 'Natura: Oportunidade para Coordenador de Marketing', 'A Natura está contratando um Coordenador de Marketing para liderar as estratégias de comunicação e fortalecer a marca. Se você tem experiência em marketing de cosméticos, venha fazer parte desse time incrível!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FNatura%201.jpg?alt=media&token=ff1a8fdd-e565-4ef3-b9ec-0232367bec5b', 11, NULL, NULL, '2024-11-15 15:26:38', '2024-11-15 15:26:38'),
(31, 'Natura: Vaga para Analista de Sustentabilidade', 'A Natura está em busca de um Analista de Sustentabilidade para atuar com ações ambientais e sociais que impactam positivamente no nosso planeta. Se você tem paixão por sustentabilidade, junte-se ao nosso time!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FNatura%202.jpg?alt=media&token=f5dd0fb9-7f3d-4e9d-b378-86865ba2f9f6', 11, NULL, NULL, '2024-11-15 15:26:38', '2024-11-15 15:26:38'),
(32, 'Nubank: Vaga para Product Manager', 'O Nubank está buscando um Product Manager para desenvolver produtos financeiros inovadores. Se você quer transformar o mercado financeiro com a gente, inscreva-se agora!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FNubank%201.jpg?alt=media&token=42487e93-8e1b-4424-90c6-84ec0dd7c05d', 12, NULL, NULL, '2024-11-15 15:26:38', '2024-11-15 15:26:38'),
(33, 'Nubank: Oportunidade para Especialista em UX/UI', 'O Nubank está contratando um Especialista em UX/UI para melhorar a experiência dos nossos usuários. Se você ama design e tecnologia, essa vaga é para você!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FNubank%202.jpg?alt=media&token=fca1b89d-73d4-447e-b290-fdc5f36d248d', 12, NULL, NULL, '2024-11-15 15:26:38', '2024-11-15 15:26:38'),
(34, 'PagSeguro: Vaga para Analista de Tecnologia da Informação', 'O PagSeguro está contratando um Analista de TI para fortalecer nossa infraestrutura e desenvolver soluções tecnológicas inovadoras. Se você é apaixonado por tecnologia, inscreva-se!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FPagSeguro%201.jpg?alt=media&token=edb2927a-5450-43ea-ad4c-1dfb6dca3da0', 13, NULL, NULL, '2024-11-15 15:26:38', '2024-11-15 15:26:38'),
(35, 'PagSeguro: Oportunidade para Coordenador de Marketing Digital', 'Venha trabalhar no PagSeguro como Coordenador de Marketing Digital e ajude a criar campanhas que impactam milhões de brasileiros. Se você é criativo e tem experiência, junte-se a nós!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FPagSeguro%202.png?alt=media&token=fbea74c5-bd73-43e5-b87e-72866f93b323', 13, NULL, NULL, '2024-11-15 15:26:38', '2024-11-15 15:26:38'),
(36, 'Petrobras: Vaga para Engenheiro de Projetos', 'A Petrobras está contratando um Engenheiro de Projetos para atuar no desenvolvimento de grandes projetos no setor de energia. Se você tem experiência em engenharia, venha fazer parte dessa gigante!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FPetrobras%201.jpg?alt=media&token=55bee520-b281-428c-81f5-4cbce5c78b36', 14, NULL, NULL, '2024-11-15 15:26:38', '2024-11-15 15:26:38'),
(37, 'Petrobras: Oportunidade para Analista de Comunicação', 'Se você tem habilidades em comunicação corporativa, a Petrobras oferece uma vaga para Analista de Comunicação. Junte-se à nossa equipe e ajude a contar a história de uma das maiores empresas do Brasil!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FPetrobras%202.jpg?alt=media&token=ca3ac290-cfc5-40bc-8174-032e780d5fb3', 14, NULL, NULL, '2024-11-15 15:26:38', '2024-11-15 15:26:38'),
(38, 'PwC: Vaga para Consultor de Auditoria', 'A PwC está contratando um Consultor de Auditoria para ajudar empresas a alcançarem excelência em governança e compliance. Se você tem experiência, venha fazer parte do nosso time!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FPricewaterhouseCoopers%201.jpg?alt=media&token=a40ec395-c303-4736-ba2d-0b7f59fe85ca', 15, NULL, NULL, '2024-11-15 15:26:38', '2024-11-15 15:26:38'),
(39, 'PwC: Oportunidade para Analista de Controladoria', 'A PwC está buscando um Analista de Controladoria para atuar com análises financeiras e otimização de processos. Se você tem experiência em controladoria, inscreva-se para essa oportunidade!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FPricewaterhouseCoopers%202.jpg?alt=media&token=4a4d5898-c1f9-4f93-95a9-363aad8036ad', 15, NULL, NULL, '2024-11-15 15:26:38', '2024-11-15 15:26:38'),
(40, 'Raízen: Vaga para Engenheiro de Processos', 'A Raízen está contratando um Engenheiro de Processos para atuar na otimização e desenvolvimento de processos industriais. Se você tem experiência na área de energia e biocombustíveis, inscreva-se!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FRa%C3%ADzen%201.jpg?alt=media&token=1d36d75b-927b-479a-9221-e8b184a8dd26', 16, NULL, NULL, '2024-11-15 15:26:38', '2024-11-15 15:26:38'),
(41, 'Raízen: Oportunidade para Analista de Sustentabilidade', 'A Raízen está buscando um Analista de Sustentabilidade para atuar no planejamento e execução de ações sustentáveis. Se você é apaixonado por questões ambientais, venha fazer parte da nossa equipe!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FRa%C3%ADzen%202.png?alt=media&token=530f9677-0bbe-4902-a249-c341991d2507', 16, NULL, NULL, '2024-11-15 15:26:38', '2024-11-15 15:26:38'),
(42, 'TOTVS: Oportunidade para Analista de Suporte Técnico', 'A TOTVS está contratando um Analista de Suporte Técnico para atuar no atendimento a clientes e suporte em soluções de software. Se você tem experiência, venha se juntar à nossa equipe!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FTOTVS%201.jpg?alt=media&token=504083be-25f0-4a7b-ab43-7fb2a6b87575', 17, NULL, NULL, '2024-11-15 15:26:38', '2024-11-15 15:26:38'),
(43, 'TOTVS: Vaga para Desenvolvedor de Software', 'A TOTVS está em busca de um Desenvolvedor de Software para criar soluções tecnológicas de ponta. Se você tem experiência em programação e quer fazer parte de uma empresa inovadora, inscreva-se!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FTOTVS%202.jpg?alt=media&token=4dacedaa-fa5a-47b7-946b-18698bb77d8a', 17, NULL, NULL, '2024-11-15 15:26:38', '2024-11-15 15:26:38'),
(44, 'XP Inc: Vaga para Consultor de Investimentos', 'A XP Inc está contratando um Consultor de Investimentos para ajudar nossos clientes a tomar decisões financeiras estratégicas. Se você tem experiência e deseja atuar no mercado financeiro, inscreva-se!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FXP%20Inc.%201.jpg?alt=media&token=c0d530ba-282b-4506-96f1-c4897211f660', 18, NULL, NULL, '2024-11-15 15:26:38', '2024-11-15 15:26:38'),
(45, 'XP Inc: Oportunidade para Analista de Riscos', 'A XP Inc está em busca de um Analista de Riscos para identificar, analisar e mitigar riscos no mercado financeiro. Se você tem experiência nessa área, venha fazer parte da nossa equipe!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FXP%20Inc.%202.jpg?alt=media&token=c5c1a20b-4205-4470-9c41-b22ddd529ea9', 18, NULL, NULL, '2024-11-15 15:26:38', '2024-11-15 15:26:38'),
(46, 'Enel: Vaga para Analista de Engenharia Elétrica', 'A Enel está contratando um Analista de Engenharia Elétrica para atuar em projetos de infraestrutura elétrica. Se você tem experiência em engenharia elétrica, venha para a Enel!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2Fenel%201.jpg?alt=media&token=4dd55764-7b5d-48d8-9bc4-66024d829784', 19, NULL, NULL, '2024-11-15 15:26:38', '2024-11-15 15:26:38'),
(47, 'Enel: Oportunidade para Coordenador de Projetos', 'A Enel está buscando um Coordenador de Projetos para gerenciar grandes iniciativas de energia renovável. Se você tem experiência em projetos e sustentabilidade, essa vaga é para você!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2Fenel%202.jpg?alt=media&token=397ac200-42c4-4816-8db7-53fcf4d9334f', 19, NULL, NULL, '2024-11-15 15:26:38', '2024-11-15 15:26:38'),
(48, 'Sony: Vaga para Engenheiro de Produto', 'A Sony está contratando um Engenheiro de Produto para desenvolver soluções inovadoras no mercado de eletrônicos. Se você tem paixão por tecnologia, venha se juntar à nossa equipe!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2Fsony%201.jpg?alt=media&token=9d760ea9-27bf-46dd-84ec-d20f1a2fe824', 20, NULL, NULL, '2024-11-15 15:26:38', '2024-11-15 15:26:38'),
(49, 'Sony: Oportunidade para Especialista em Marketing Digital', 'A Sony está em busca de um Especialista em Marketing Digital para promover seus produtos globalmente. Se você tem experiência em campanhas digitais e adora tecnologia, inscreva-se!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2Fsony%202.jpg?alt=media&token=4d8f15d3-499f-4f62-bacc-76ca73206e65', 20, NULL, NULL, '2024-11-15 15:26:38', '2024-11-15 15:26:38');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_salvarvaga`
--

CREATE TABLE `tb_salvarvaga` (
  `idSalvarVaga` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idVaga` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_seguir`
--

CREATE TABLE `tb_seguir` (
  `idSeguir` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_status`
--

CREATE TABLE `tb_status` (
  `idStatus` int(11) NOT NULL,
  `tipoStatus` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_status`
--

INSERT INTO `tb_status` (`idStatus`, `tipoStatus`) VALUES
(1, 'Ativo'),
(2, 'Bloqueado'),
(3, 'Pendente'),
(4, 'Revisão'),
(5, 'Aceito');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_statusvagausuario`
--

CREATE TABLE `tb_statusvagausuario` (
  `idStatusVagaUsuario` int(11) NOT NULL,
  `tipoStatusVaga` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_statusvagausuario`
--

INSERT INTO `tb_statusvagausuario` (`idStatusVagaUsuario`, `tipoStatusVaga`) VALUES
(1, 'Pendente'),
(2, 'Chamado'),
(3, 'Reprovado');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_usuario`
--

CREATE TABLE `tb_usuario` (
  `idUsuario` int(11) NOT NULL,
  `nomeUsuario` varchar(100) NOT NULL,
  `usernameUsuario` varchar(100) NOT NULL,
  `nascUsuario` date NOT NULL,
  `emailUsuario` varchar(50) NOT NULL,
  `senhaUsuario` varchar(300) NOT NULL,
  `contatoUsuario` varchar(20) NOT NULL,
  `emailContato` varchar(50) NOT NULL,
  `areaInteresseUsuario` varchar(100) NOT NULL,
  `linguaUsuario` varchar(20) DEFAULT NULL,
  `ensinoMedio` varchar(50) DEFAULT NULL,
  `anoFormacao` int(4) DEFAULT NULL,
  `fotoUsuario` text DEFAULT NULL,
  `fotoBanner` text DEFAULT NULL,
  `cidadeUsuario` varchar(50) NOT NULL,
  `estadoUsuario` varchar(50) NOT NULL,
  `logradouroUsuario` varchar(40) NOT NULL,
  `cepUsuario` varchar(40) NOT NULL,
  `numeroLograUsuario` varchar(40) NOT NULL,
  `sobreUsuario` text NOT NULL,
  `formacaoCompetenciaUsuario` varchar(40) NOT NULL,
  `dataFormacaoCompetenciaUsuario` date NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `idStatus` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_usuario`
--

INSERT INTO `tb_usuario` (`idUsuario`, `nomeUsuario`, `usernameUsuario`, `nascUsuario`, `emailUsuario`, `senhaUsuario`, `contatoUsuario`, `emailContato`, `areaInteresseUsuario`, `linguaUsuario`, `ensinoMedio`, `anoFormacao`, `fotoUsuario`, `fotoBanner`, `cidadeUsuario`, `estadoUsuario`, `logradouroUsuario`, `cepUsuario`, `numeroLograUsuario`, `sobreUsuario`, `formacaoCompetenciaUsuario`, `dataFormacaoCompetenciaUsuario`, `created_at`, `updated_at`, `idStatus`) VALUES
(1, 'Alessandra Marins', 'alessandra.marins', '1990-05-10', 'alessandra@gmail.com', '$2y$10$97Fm0SZnJupQZXrlsA4jYORJ3wgv7XL5AQ/UzcwNn6dtEa8rEwg7a', '999999999', 'alessandra@gmail.com', 'Desenvolvimento', 'Português', 'Ensino Médio', 2008, 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/profile_images%2Fale.png?alt=media&token=64df44ef-c003-46d8-a6ad-b3c28293d596', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/images%2Fmaxresdefault.jpg?alt=media&token=d8ec9d0f-ae5d-4790-9acd-c7317a4451e5', 'São Paulo', 'SP', 'Rua das Flores, 123', '01234-567', '100', 'Desenvolvedor full-stack com 5 anos de experiência.', 'Certificação em JavaScript', '2022-06-15', '2024-11-14 01:55:00', '2024-11-14 01:55:00', 2),
(2, 'Danilo Da Silva', 'danilo.silva', '1995-08-20', 'danilo@gmail.com', '$2y$10$97Fm0SZnJupQZXrlsA4jYORJ3wgv7XL5AQ/UzcwNn6dtEa8rEwg7a', '988888888', 'danilo@gmail.com', 'Marketing', 'Português', 'Ensino Superior', 2017, 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/profile_images%2Fdan.png?alt=media&token=bb388599-e942-432c-93d8-5ef195fda425', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/images%2Fe23ad3fef70074a32cf63cf42517f0cb.jpg?alt=media&token=50d9372d-0a60-4591-bc5e-2eb11a6971ea', 'Rio de Janeiro', 'RJ', 'Avenida Atlântica, 456', '12345-678', '150', 'Especialista em estratégias de marketing digital.', 'Certificação em Google Ads', '2021-11-25', '2024-11-14 01:55:00', '2024-11-14 01:55:00', 2),
(3, 'Daniel Nogueira', 'daniel.nogueira', '1988-03-15', 'daniel@gmail.com', '$2y$10$97Fm0SZnJupQZXrlsA4jYORJ3wgv7XL5AQ/UzcwNn6dtEa8rEwg7a', '977777777', 'daniel@gmail.com', 'Gestão de Projetos', 'Português', 'Ensino Superior', 2010, 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/profile_images%2Fdaniel.png?alt=media&token=e6df3727-8b34-464a-a815-504c2a11d522', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/images%2FRj.jpg?alt=media&token=6be1c98b-9de7-4018-adc0-76c83cd64ac0', 'Belo Horizonte', 'MG', 'Rua Minas Gerais, 789', '30123-456', '200', 'Gestor de projetos com foco em melhoria contínua.', 'MBA em Gestão de Projetos', '2018-10-05', '2024-11-14 01:55:00', '2024-11-14 01:55:00', 2),
(4, 'Eduardo Felipe', 'eduardo.felipe', '1992-12-05', 'eduardo@gmail.com', '$2y$10$97Fm0SZnJupQZXrlsA4jYORJ3wgv7XL5AQ/UzcwNn6dtEa8rEwg7a', '966666666', 'eduardo@gmail.com', 'Design Gráfico', 'Português', 'Ensino Superior', 2014, 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/profile_images%2Fedu.png?alt=media&token=2fc4759b-e778-426c-b9ae-bf5a4b20f092', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/images%2FDeserto%20do%20Atacama.jpg?alt=media&token=d6401ac2-4134-4395-bc31-c1f52e4e1e93', 'Curitiba', 'PR', 'Rua XV de Novembro, 1111', '80000-000', '250', 'Designer gráfico com experiência em identidade visual.', 'Certificação em Adobe Photoshop', '2019-05-20', '2024-11-14 01:55:00', '2024-11-14 01:55:00', 2),
(5, 'Felipe Anselmo', 'felipe.anselmo', '1997-06-30', 'felipe@email.com', '$2y$10$97Fm0SZnJupQZXrlsA4jYORJ3wgv7XL5AQ/UzcwNn6dtEa8rEwg7a', '955555555', 'felipe@email.com', 'TI - Suporte', 'Português', 'Ensino Superior', 2020, 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/profile_images%2Ffelipe.png?alt=media&token=39b3870a-64b3-492b-a996-5556c97a83d1', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/images%2FAtacama%209.jpeg?alt=media&token=69dd8a47-733d-4151-98f4-8164036e8d7d', 'Fortaleza', 'CE', 'Avenida Beira Mar, 123', '60000-000', '300', 'Técnico de TI com experiência em suporte remoto.', 'Certificação CompTIA A+', '2022-02-10', '2024-11-14 01:55:00', '2024-11-14 01:55:00', 2),
(6, 'Fernanda Luiza', 'fernanda.luiza', '1985-11-25', 'fernanda@gmail.com', '$2y$10$97Fm0SZnJupQZXrlsA4jYORJ3wgv7XL5AQ/UzcwNn6dtEa8rEwg7a', '944444444', 'fernanda@gmail.com', 'Recursos Humanos', 'Português', 'Ensino Superior', 2007, 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/profile_images%2Ffeh.png?alt=media&token=fd774eac-1e8f-40c8-acd4-1b5c961d3a81', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/images%2FAtacama%204.jpeg?alt=media&token=e552f0b0-06ef-4093-ac9e-a31e5f781c70', 'Recife', 'PE', 'Rua do Sol, 123', '50000-000', '150', 'Especialista em recrutamento e seleção de talentos.', 'MBA em Gestão de Pessoas', '2016-08-15', '2024-11-14 01:55:00', '2024-11-14 01:55:00', 2),
(7, 'Inácio Pereira', 'inacio.pereira', '1993-09-18', 'inacio@gmail.com', '$2y$10$97Fm0SZnJupQZXrlsA4jYORJ3wgv7XL5AQ/UzcwNn6dtEa8rEwg7a', '933333333', 'inácio@gmail.com', 'Vendas', 'Português', 'Ensino Médio', 2012, 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/profile_images%2Fpapi.png?alt=media&token=4eda9143-6002-4b69-aacf-d956b288b645', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/images%2FAtacama%2015.jpeg?alt=media&token=15e2ae6e-8b89-4ca8-ad19-f0f242740bcc', 'Porto Alegre', 'RS', 'Avenida Brasil, 789', '90000-000', '350', 'Profissional de vendas com foco em soluções B2B.', 'Certificação em Vendas Consultivas', '2018-07-01', '2024-11-14 01:55:00', '2024-11-14 01:55:00', 2),
(8, 'Murilo Henrique', 'murilo.henrique', '1990-02-14', 'murilo@gmail.com', '$2y$10$97Fm0SZnJupQZXrlsA4jYORJ3wgv7XL5AQ/UzcwNn6dtEa8rEwg7a', '922222222', 'murilo@gmail.com', 'Administração', 'Português', 'Ensino Superior', 2014, 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/profile_images%2Fmuh.png?alt=media&token=29cd5248-e7c8-4c3f-8450-e66f419c00b9', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/images%2FAtacama%2010.jpeg?alt=media&token=8abea2f0-029e-4208-838e-effc665d62d1', 'Salvador', 'BA', 'Rua da Paz, 456', '40000-000', '120', 'Administradora com experiência em planejamento estratégico.', 'MBA em Administração', '2019-09-30', '2024-11-14 01:55:00', '2024-11-14 01:55:00', 2),
(9, 'Vinícius Eduardo', 'vinicius.eduardo', '1987-07-03', 'vinícius@gmail.com', '$2y$10$97Fm0SZnJupQZXrlsA4jYORJ3wgv7XL5AQ/UzcwNn6dtEa8rEwg7a', '911111111', 'vinícius@gmail.com', 'Engenharia', 'Português', 'Ensino Superior', 2010, 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/profile_images%2Fvini.png?alt=media&token=afb93fde-b283-40d3-a918-29f2c2c678fc', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/images%2F522058_sailboats-hd-desktop-wallpapers_1920x1080_h.jpg?alt=media&token=5061e648-b800-4771-ac03-eda92f0d803f', 'Manaus', 'AM', 'Avenida Brasil, 1010', '69000-000', '180', 'Engenheiro civil com foco em projetos de infraestrutura.', 'Certificação em Gestão de Obras', '2015-04-10', '2024-11-14 01:55:00', '2024-11-14 01:55:00', 2),
(10, 'Vitor Augusto', 'vitor.augusto', '1996-04-22', 'vitor@gmail.com', '$2y$10$97Fm0SZnJupQZXrlsA4jYORJ3wgv7XL5AQ/UzcwNn6dtEa8rEwg7a', '900000000', 'vitor@gmail.com', 'Psicologia', 'Português', 'Ensino Superior', 2018, 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/profile_images%2Fchad.png?alt=media&token=c690d7a9-f0b8-4827-8679-c889d5acd8d6', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/images%2F1f909f49276924f81996aadb24f47e13.jpg?alt=media&token=35a5bdf6-e59a-4d14-ac2b-78f251147c6c', 'Goiânia', 'GO', 'Rua Goiás, 321', '74000-000', '220', 'Psicóloga clínica com experiência em terapia cognitivo-comportamental.', 'Certificação em Terapias Cognitivas', '2021-01-10', '2024-11-14 01:55:00', '2024-11-14 01:55:00', 2);

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_vaga`
--

CREATE TABLE `tb_vaga` (
  `idVaga` int(11) NOT NULL,
  `nomeVaga` varchar(50) NOT NULL,
  `descricaoVaga` text NOT NULL,
  `prazoVaga` date NOT NULL,
  `salarioVaga` decimal(10,2) NOT NULL,
  `cidadeVaga` varchar(50) NOT NULL,
  `estadoVaga` varchar(50) NOT NULL,
  `beneficiosVaga` text NOT NULL,
  `diferencialVaga` text NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `idArea` int(11) NOT NULL,
  `idStatus` int(11) NOT NULL,
  `idModalidadeVaga` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_vaga`
--

INSERT INTO `tb_vaga` (`idVaga`, `nomeVaga`, `descricaoVaga`, `prazoVaga`, `salarioVaga`, `cidadeVaga`, `estadoVaga`, `beneficiosVaga`, `diferencialVaga`, `idEmpresa`, `idArea`, `idStatus`, `idModalidadeVaga`, `created_at`, `updated_at`) VALUES
(1, 'Analista de Marketing', 'Responsável pelo planejamento e execução de campanhas de marketing digital e offline.', '2024-12-31', 4500.00, 'São Paulo', 'SP', 'Vale Refeição, Vale Transporte, Assistência Médica', 'Experiência em marketing digital e e-commerce', 1, 2, 1, 1, '2024-11-15 14:49:09', '2024-11-15 14:49:09'),
(2, 'Coordenador de TI', 'Coordenação da equipe de TI para implementação e manutenção de sistemas internos.', '2024-12-31', 8000.00, 'Rio de Janeiro', 'RJ', 'Vale Alimentação, Seguro de Vida, Home Office', 'Conhecimento em arquitetura de sistemas', 1, 1, 1, 2, '2024-11-15 14:49:09', '2024-11-15 14:49:09'),
(3, 'Desenvolvedor Backend', 'Desenvolvimento de sistemas robustos e escaláveis para a plataforma da empresa.', '2024-12-31', 7000.00, 'São Paulo', 'SP', 'Vale Refeição, Vale Transporte, Seguro de Vida', 'Experiência com Node.js e AWS', 2, 1, 1, 1, '2024-11-15 14:49:09', '2024-11-15 14:49:09'),
(4, 'Analista de Marketing Digital', 'Criação e execução de campanhas de marketing digital para aumentar o tráfego no site.', '2024-12-31', 5000.00, 'Curitiba', 'PR', 'Vale Refeição, Plano de Saúde, Participação nos Lucros', 'Experiência com Google Ads e SEO', 2, 2, 1, 3, '2024-11-15 14:49:09', '2024-11-15 14:49:09'),
(5, 'Analista de Sustentabilidade', 'Análise e implementação de práticas sustentáveis para melhorar a pegada ambiental da empresa.', '2024-12-31', 5500.00, 'São Paulo', 'SP', 'Vale Refeição, Plano de Saúde, Participação nos Lucros', 'Experiência em projetos ambientais', 3, 15, 1, 2, '2024-11-15 14:49:09', '2024-11-15 14:49:09'),
(6, 'Gerente de Produto', 'Gestão do ciclo de vida de novos produtos veganos, da pesquisa ao lançamento.', '2024-12-31', 9500.00, 'Rio de Janeiro', 'RJ', 'Vale Alimentação, Plano Odontológico, Gympass', 'Experiência no setor alimentício', 3, 3, 1, 1, '2024-11-15 14:49:09', '2024-11-15 14:49:09'),
(7, 'Analista de Logística', 'Responsável por otimizar processos logísticos e garantir o fluxo eficiente de produtos.', '2024-12-31', 6000.00, 'São Paulo', 'SP', 'Vale Refeição, Seguro de Saúde, Participação nos Lucros', 'Experiência em gestão de estoque', 4, 10, 1, 1, '2024-11-15 14:49:09', '2024-11-15 14:49:09'),
(8, 'Engenheiro de Produção', 'Gerenciamento das operações de produção e garantia de eficiência no processo industrial.', '2024-12-31', 9000.00, 'Campinas', 'SP', 'Vale Transporte, Assistência Médica, Gympass', 'Experiência em indústrias de grande porte', 4, 14, 1, 2, '2024-11-15 14:49:09', '2024-11-15 14:49:09'),
(9, 'Consultor de TI', 'Consultoria estratégica para empresas do setor de tecnologia, otimizando sistemas de TI.', '2024-12-31', 7000.00, 'São Paulo', 'SP', 'Vale Refeição, Vale Transporte, Seguro de Saúde', 'Certificações em TI', 5, 1, 1, 3, '2024-11-15 14:49:09', '2024-11-15 14:49:09'),
(10, 'Analista de Auditoria', 'Responsável por auditorias financeiras e operações, com foco em processos internos.', '2024-12-31', 6500.00, 'Rio de Janeiro', 'RJ', 'Vale Alimentação, Seguro de Vida, Participação nos Lucros', 'Experiência com auditoria interna', 5, 5, 1, 1, '2024-11-15 14:49:09', '2024-11-15 14:49:09'),
(11, 'Piloto de Teste', 'Responsável por realizar testes de voo para novos modelos de aeronaves.', '2024-12-31', 12000.00, 'São José dos Campos', 'SP', 'Vale Refeição, Plano de Saúde, Auxílio Educação', 'Experiência com aviões comerciais', 6, 14, 1, 1, '2024-11-15 14:49:09', '2024-11-15 14:49:09'),
(12, 'Engenheiro de Sistemas', 'Desenvolvimento e testes de sistemas embarcados em aeronaves.', '2024-12-31', 11000.00, 'São José dos Campos', 'SP', 'Vale Alimentação, Seguro de Vida, Gympass', 'Experiência com sistemas aeronáuticos', 6, 14, 1, 1, '2024-11-15 14:49:09', '2024-11-15 14:49:09'),
(13, 'Consultor Tributário', 'Consultoria sobre questões fiscais e tributárias para grandes empresas.', '2024-12-31', 9000.00, 'São Paulo', 'SP', 'Vale Refeição, Plano de Saúde, Participação nos Lucros', 'Experiência em tributação internacional', 7, 5, 1, 1, '2024-11-15 14:49:09', '2024-11-15 14:49:09'),
(14, 'Auditor de Processos', 'Análise de processos internos para identificar oportunidades de melhoria e compliance.', '2024-12-31', 7500.00, 'São Paulo', 'SP', 'Vale Alimentação, Seguro de Vida, Participação nos Lucros', 'Experiência em auditoria interna', 7, 9, 1, 2, '2024-11-15 14:49:09', '2024-11-15 14:49:09'),
(15, 'Consultor de Riscos', 'Consultoria em gestão de riscos para grandes empresas, auxiliando na mitigação de riscos financeiros.', '2024-12-31', 8000.00, 'São Paulo', 'SP', 'Vale Refeição, Vale Transporte, Seguro de Saúde', 'Experiência com auditoria de riscos financeiros', 8, 5, 1, 1, '2024-11-15 14:49:09', '2024-11-15 14:49:09'),
(16, 'Analista de Compliance', 'Análise de compliance em processos financeiros e regulatórios.', '2024-12-31', 7000.00, 'São Paulo', 'SP', 'Vale Refeição, Plano de Saúde, Participação nos Lucros', 'Experiência com regulamentação financeira', 8, 5, 1, 2, '2024-11-15 14:49:09', '2024-11-15 14:49:09'),
(17, 'Desenvolvedor Frontend', 'Desenvolvimento da interface do usuário para melhorar a experiência do cliente.', '2024-12-31', 7500.00, 'São Paulo', 'SP', 'Vale Refeição, Vale Transporte, Seguro de Saúde', 'Experiência com React.js e Redux', 9, 1, 1, 1, '2024-11-15 14:49:09', '2024-11-15 14:49:09'),
(18, 'Analista de E-commerce', 'Gestão de plataformas de e-commerce e otimização da jornada de compra.', '2024-12-31', 6000.00, 'São Paulo', 'SP', 'Vale Refeição, Assistência Médica, Participação nos Lucros', 'Experiência com plataformas de e-commerce', 9, 2, 1, 3, '2024-11-15 14:49:09', '2024-11-15 14:49:09'),
(19, 'Analista de Infraestrutura', 'Gerenciamento de servidores, redes e suporte técnico a usuários internos.', '2024-12-31', 7500.00, 'São Paulo', 'SP', 'Vale Refeição, Plano de Saúde, Participação nos Lucros', 'Experiência com Windows Server e redes', 10, 1, 1, 1, '2024-11-15 14:53:20', '2024-11-15 14:53:20'),
(20, 'Desenvolvedor de Software', 'Desenvolvimento de software em um time ágil para novos produtos e funcionalidades.', '2024-12-31', 9000.00, 'São Paulo', 'SP', 'Vale Alimentação, Gympass, Plano de Saúde', 'Experiência com C# e .NET', 10, 1, 1, 2, '2024-11-15 14:53:20', '2024-11-15 14:53:20'),
(21, 'Gerente de Produto', 'Responsável pelo planejamento e execução de novos produtos cosméticos no mercado.', '2024-12-31', 8500.00, 'São Paulo', 'SP', 'Vale Refeição, Vale Transporte, Participação nos Lucros', 'Experiência com desenvolvimento de produtos de beleza', 11, 3, 1, 1, '2024-11-15 14:53:20', '2024-11-15 14:53:20'),
(22, 'Analista de Marketing Digital', 'Desenvolvimento e execução de campanhas para aumentar a presença digital da marca.', '2024-12-31', 5500.00, 'São Paulo', 'SP', 'Vale Alimentação, Seguro de Vida, Plano de Saúde', 'Experiência com marketing de influenciadores', 11, 2, 1, 3, '2024-11-15 14:53:20', '2024-11-15 14:53:20'),
(23, 'Especialista em Tecnologia', 'Responsável pela implementação de novas tecnologias no sistema bancário.', '2024-12-31', 9500.00, 'São Paulo', 'SP', 'Vale Refeição, Seguro de Saúde, Participação nos Lucros', 'Experiência com sistemas bancários digitais', 12, 1, 1, 1, '2024-11-15 14:53:20', '2024-11-15 14:53:20'),
(24, 'Analista de Dados', 'Análise de dados de clientes para otimização de produtos e serviços financeiros.', '2024-12-31', 7000.00, 'São Paulo', 'SP', 'Vale Alimentação, Vale Transporte, Seguro de Vida', 'Experiência com SQL e Big Data', 12, 1, 1, 2, '2024-11-15 14:53:20', '2024-11-15 14:53:20'),
(25, 'Gerente de TI', 'Responsável pela infraestrutura de TI e equipe de suporte do sistema de pagamentos.', '2024-12-31', 10000.00, 'São Paulo', 'SP', 'Vale Refeição, Vale Transporte, Plano de Saúde', 'Experiência com sistemas de pagamento online', 13, 1, 1, 1, '2024-11-15 14:53:20', '2024-11-15 14:53:20'),
(26, 'Analista de E-commerce', 'Gestão de plataforma de e-commerce, com foco na otimização de vendas online.', '2024-12-31', 6000.00, 'São Paulo', 'SP', 'Vale Alimentação, Assistência Médica, Participação nos Lucros', 'Experiência em plataformas de e-commerce', 13, 2, 1, 3, '2024-11-15 14:53:20', '2024-11-15 14:53:20'),
(27, 'Engenheiro de Produção', 'Gestão das operações de refino e controle de qualidade na produção de petróleo.', '2024-12-31', 11000.00, 'Rio de Janeiro', 'RJ', 'Vale Refeição, Seguro de Vida, Participação nos Lucros', 'Experiência em indústria petrolífera', 14, 14, 1, 1, '2024-11-15 14:53:20', '2024-11-15 14:53:20'),
(28, 'Analista de Segurança', 'Análise e implementação de políticas de segurança em plataformas de petróleo.', '2024-12-31', 8000.00, 'Rio de Janeiro', 'RJ', 'Vale Refeição, Plano de Saúde, Vale Alimentação', 'Experiência com segurança industrial', 14, 9, 1, 2, '2024-11-15 14:53:20', '2024-11-15 14:53:20'),
(29, 'Consultor de TI', 'Consultoria estratégica para empresas na implementação de soluções de TI.', '2024-12-31', 8500.00, 'São Paulo', 'SP', 'Vale Refeição, Vale Transporte, Participação nos Lucros', 'Certificações em TI', 15, 1, 1, 1, '2024-11-15 14:53:20', '2024-11-15 14:53:20'),
(30, 'Analista de Auditoria', 'Responsável por auditorias financeiras e controles internos em empresas clientes.', '2024-12-31', 7500.00, 'São Paulo', 'SP', 'Vale Alimentação, Seguro de Vida, Plano de Saúde', 'Experiência com auditoria financeira', 15, 5, 1, 2, '2024-11-15 14:53:20', '2024-11-15 14:53:20'),
(31, 'Analista de Processos', 'Otimização de processos operacionais em refinarias e usinas de etanol.', '2024-12-31', 7000.00, 'São Paulo', 'SP', 'Vale Refeição, Seguro de Saúde, Participação nos Lucros', 'Experiência em indústria química e petroquímica', 16, 14, 1, 1, '2024-11-15 14:53:20', '2024-11-15 14:53:20'),
(32, 'Gestor de Logística', 'Gestão de operações logísticas para transporte e distribuição de combustíveis.', '2024-12-31', 9000.00, 'São Paulo', 'SP', 'Vale Refeição, Plano de Saúde, Vale Transporte', 'Experiência com logística e transporte', 16, 10, 1, 2, '2024-11-15 14:53:20', '2024-11-15 14:53:20'),
(33, 'Analista de Sistemas', 'Desenvolvimento e manutenção de sistemas para empresas clientes.', '2024-12-31', 7500.00, 'São Paulo', 'SP', 'Vale Refeição, Vale Transporte, Seguro de Saúde', 'Experiência com ERP e sistemas corporativos', 17, 1, 1, 1, '2024-11-15 14:53:20', '2024-11-15 14:53:20'),
(34, 'Consultor de Negócios', 'Consultoria estratégica para empresas que utilizam o sistema TOTVS.', '2024-12-31', 8000.00, 'São Paulo', 'SP', 'Vale Alimentação, Plano de Saúde, Participação nos Lucros', 'Experiência em consultoria de ERP', 17, 5, 1, 3, '2024-11-15 14:53:20', '2024-11-15 14:53:20'),
(35, 'Analista de Investimentos', 'Análise de investimentos financeiros e recomendação de portfólios de ações.', '2024-12-31', 8000.00, 'São Paulo', 'SP', 'Vale Refeição, Seguro de Saúde, Participação nos Lucros', 'Experiência com análise de ações', 18, 8, 1, 1, '2024-11-15 14:53:20', '2024-11-15 14:53:20'),
(36, 'Gerente de Relacionamento', 'Gestão do relacionamento com investidores e prospecção de novos clientes.', '2024-12-31', 9500.00, 'São Paulo', 'SP', 'Vale Alimentação, Assistência Médica, Vale Transporte', 'Experiência com atendimento a investidores', 18, 9, 1, 2, '2024-11-15 14:53:20', '2024-11-15 14:53:20'),
(37, 'Especialista em Energia', 'Consultoria sobre otimização de processos de geração de energia elétrica.', '2024-12-31', 8500.00, 'São Paulo', 'SP', 'Vale Refeição, Vale Transporte, Seguro de Saúde', 'Experiência com energia renovável', 19, 15, 1, 1, '2024-11-15 14:53:20', '2024-11-15 14:53:20'),
(38, 'Analista de Operações', 'Gerenciamento de operações de distribuição de energia elétrica para grandes clientes.', '2024-12-31', 7000.00, 'São Paulo', 'SP', 'Vale Refeição, Assistência Médica, Participação nos Lucros', 'Experiência com processos operacionais de energia', 19, 10, 1, 2, '2024-11-15 14:53:20', '2024-11-15 14:53:20'),
(39, 'Desenvolvedor de Software', 'Desenvolvimento de software para sistemas de entretenimento e multimídia.', '2024-12-31', 8000.00, 'São Paulo', 'SP', 'Vale Refeição, Plano de Saúde, Participação nos Lucros', 'Experiência com desenvolvimento de sistemas de mídia', 20, 1, 1, 1, '2024-11-15 14:53:20', '2024-11-15 14:53:20'),
(40, 'Gerente de Marketing', 'Responsável pela estratégia de marketing para lançamentos de novos produtos Sony.', '2024-12-31', 9500.00, 'São Paulo', 'SP', 'Vale Alimentação, Assistência Médica, Gympass', 'Experiência com marketing de produtos de tecnologia', 20, 2, 1, 3, '2024-11-15 14:53:20', '2024-11-15 14:53:20');

-- --------------------------------------------------------

--
-- Estrutura para tabela `tb_vagausuario`
--

CREATE TABLE `tb_vagausuario` (
  `idVagaUsuario` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idVaga` int(11) NOT NULL,
  `idStatusVagaUsuario` int(11) NOT NULL,
  `motivoFeedback` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `tb_vagausuario`
--

INSERT INTO `tb_vagausuario` (`idVagaUsuario`, `idUsuario`, `idVaga`, `idStatusVagaUsuario`, `motivoFeedback`) VALUES
(1, 1, 1, 1, NULL),
(2, 1, 3, 2, 'Parabéns, você foi aprovado! Estamos aguardando sua disponibilidade para agendar a entrevista.'),
(3, 1, 5, 3, 'Infelizmente, não atendemos ao perfil desejado. No entanto, seu currículo será mantido em nosso banco de dados para futuras oportunidades.'),
(4, 2, 2, 1, NULL),
(5, 2, 4, 3, 'O perfil não corresponde às qualificações exigidas para a vaga. Obrigado por seu interesse.'),
(6, 2, 6, 2, 'Você foi pré-selecionado! Estamos ansiosos para agendar uma entrevista e discutir sua experiência em mais detalhes.'),
(7, 3, 7, 2, 'Parabéns! Sua candidatura foi aceita. A próxima etapa será a entrevista, vamos entrar em contato para agendar a data.'),
(8, 3, 8, 3, 'Infelizmente, não conseguimos seguir com sua candidatura. Agradecemos sua participação e manteremos seu currículo.'),
(9, 3, 9, 1, NULL),
(10, 4, 10, 3, 'O perfil de outro candidato se encaixou melhor com os requisitos da vaga. Agradecemos seu interesse.'),
(11, 4, 11, 2, 'Você foi aprovado! Vamos entrar em contato em breve para agendar sua entrevista.'),
(12, 4, 12, 1, NULL),
(13, 5, 13, 1, NULL),
(14, 5, 14, 2, 'Estamos impressionados com seu perfil! A próxima etapa será a entrevista.'),
(15, 5, 15, 3, 'A vaga foi preenchida por outro candidato que atendia melhor os requisitos. Obrigado por se inscrever.'),
(16, 6, 16, 2, 'Parabéns, você foi aprovado para a entrevista! Vamos entrar em contato em breve para agendar.'),
(17, 6, 17, 1, NULL),
(18, 6, 18, 3, 'Após avaliação, decidimos seguir com outro candidato. Agradecemos seu tempo e interesse.'),
(19, 7, 19, 1, NULL),
(20, 7, 20, 2, 'Você foi selecionado para a próxima fase! Vamos agendar uma entrevista em breve.'),
(21, 7, 21, 3, 'Infelizmente, decidimos seguir com outro candidato. Agradecemos sua participação.'),
(22, 8, 22, 1, NULL),
(23, 8, 23, 2, 'Sua candidatura foi bem-sucedida! Vamos agendar uma entrevista para discutir mais sobre sua experiência.'),
(24, 8, 24, 3, 'Lamentavelmente, seu perfil não corresponde à vaga. Agradecemos sua inscrição.'),
(25, 9, 25, 3, 'A vaga foi preenchida por outro candidato que possuía mais experiência. Agradecemos sua candidatura.'),
(26, 9, 26, 1, NULL),
(27, 9, 27, 2, 'Você foi aprovado para a entrevista! Entraremos em contato para agendar.'),
(28, 10, 28, 3, 'Após análise, decidimos seguir com outro candidato. Agradecemos seu interesse e manteremos seu currículo em nosso banco de dados.'),
(29, 10, 29, 2, 'Você foi selecionado para a entrevista. Parabéns e aguarde nosso contato.'),
(30, 1, 30, 2, 'Sua candidatura foi aprovada para a próxima fase. Vamos agendar a entrevista em breve.'),
(31, 2, 31, 1, NULL),
(32, 3, 32, 3, 'Infelizmente, seu perfil não atende aos requisitos da vaga. Agradecemos por seu interesse.'),
(33, 4, 33, 2, 'Você foi aprovado! Vamos agendar uma entrevista para discutir mais sobre sua experiência.'),
(34, 5, 34, 1, NULL),
(35, 6, 35, 3, 'Seu perfil não foi selecionado para a vaga, mas seu currículo ficará no banco de dados para futuras oportunidades.'),
(36, 7, 36, 2, 'Parabéns! Sua candidatura foi bem-sucedida. Vamos agendar a próxima etapa.'),
(37, 8, 37, 1, NULL),
(38, 9, 38, 3, 'A vaga foi preenchida por outro candidato, mas agradecemos sua candidatura.'),
(39, 10, 39, 2, 'Você foi selecionado para a próxima etapa! Fique atento ao nosso contato para agendar a entrevista.'),
(40, 1, 40, 3, 'Infelizmente, não foi possível seguir com sua candidatura. Agradecemos seu tempo e guardaremos seu currículo para futuras oportunidades.'),
(41, 3, 31, 2, 'Parabéns! Você foi aprovado e vamos agendar sua entrevista. Aguarde nosso contato.'),
(42, 4, 32, 3, 'Seu perfil não se encaixa nos requisitos da vaga. Agradecemos pela sua candidatura e vamos manter seu currículo no banco de dados para futuras oportunidades.'),
(43, 5, 33, 2, 'Você foi selecionado! Em breve entraremos em contato para agendar a entrevista. Parabéns!'),
(44, 6, 34, 1, NULL),
(45, 7, 35, 3, 'Após análise, decidimos seguir com outro candidato. Agradecemos seu interesse e seu currículo será guardado para possíveis oportunidades futuras.'),
(46, 8, 36, 2, 'Sua candidatura foi bem-sucedida! Vamos agendar sua entrevista em breve.'),
(47, 9, 37, 1, NULL),
(48, 10, 38, 3, 'Lamentavelmente, outro candidato foi selecionado para essa vaga. Obrigado por se inscrever.'),
(49, 1, 39, 2, 'Parabéns! Sua candidatura foi aprovada e entraremos em contato para agendar a entrevista.'),
(50, 2, 40, 3, 'Infelizmente, seu perfil não corresponde aos requisitos da vaga. Agradecemos pela participação e seu currículo será mantido em nosso banco de dados.'),
(51, 3, 2, 1, NULL),
(52, 4, 4, 2, 'Você foi aprovado! Vamos entrar em contato para agendar sua entrevista em breve.'),
(53, 5, 6, 3, 'Após avaliação, optamos por seguir com outro candidato. Agradecemos sua participação.'),
(54, 6, 8, 1, NULL),
(55, 7, 10, 3, 'Infelizmente, outro candidato foi selecionado para essa vaga. Agradecemos seu tempo e interesse.'),
(56, 8, 12, 2, 'Sua candidatura foi aceita! A próxima etapa será uma entrevista. Aguarde nosso contato para agendar.'),
(57, 9, 14, 3, 'Lamentavelmente, decidimos seguir com outro candidato. Agradecemos sua inscrição e manteremos seu currículo no banco de dados.'),
(58, 10, 16, 1, NULL),
(59, 1, 18, 2, 'Parabéns, sua candidatura foi aprovada! Vamos agendar sua entrevista em breve.'),
(60, 2, 20, 3, 'Seu perfil não atendeu aos requisitos necessários para essa vaga. Agradecemos seu interesse e manteremos seu currículo para futuras oportunidades.'),
(61, 3, 22, 2, 'Sua candidatura foi aprovada para a próxima fase! Vamos agendar sua entrevista em breve.'),
(62, 4, 24, 3, 'Infelizmente, outro candidato foi mais alinhado com os requisitos da vaga. Agradecemos seu interesse.'),
(63, 5, 26, 1, NULL),
(64, 6, 28, 2, 'Parabéns! Você foi aprovado para a entrevista. A próxima etapa será o agendamento.'),
(65, 7, 30, 3, 'Após análise, decidimos não seguir com sua candidatura. Agradecemos pela participação.'),
(66, 8, 32, 1, NULL),
(67, 9, 34, 3, 'Lamentavelmente, decidimos seguir com outro candidato. Agradecemos sua inscrição e guardaremos seu currículo para futuras oportunidades.'),
(68, 10, 36, 2, 'Você foi aprovado! Em breve entraremos em contato para agendar sua entrevista.'),
(69, 1, 38, 1, NULL),
(70, 2, 40, 2, 'Sua candidatura foi aprovada! Vamos entrar em contato para agendar a entrevista.'),
(71, 9, 3, 1, NULL),
(72, 10, 5, 3, 'Infelizmente, outro candidato foi selecionado. Agradecemos sua participação.'),
(73, 1, 7, 2, 'Parabéns! Você foi aprovado para a próxima fase. Aguarde nosso contato para a entrevista.'),
(74, 2, 9, 3, 'Seu perfil não atende aos requisitos da vaga. Agradecemos sua inscrição e seu currículo será guardado para futuras oportunidades.'),
(75, 3, 11, 2, 'Você foi aprovado para a entrevista! Em breve entraremos em contato para agendar.'),
(76, 4, 13, 1, NULL),
(77, 5, 15, 3, 'Infelizmente, a vaga foi preenchida por outro candidato. Agradecemos sua candidatura.'),
(78, 6, 17, 2, 'Sua candidatura foi bem-sucedida! Vamos entrar em contato para agendar sua entrevista.'),
(79, 7, 19, 3, 'Após análise, decidimos seguir com outro candidato. Agradecemos por seu interesse.'),
(80, 8, 21, 1, NULL),
(81, 2, 30, 1, NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`idAdmin`),
  ADD UNIQUE KEY `usernameAdmin` (`usernameAdmin`),
  ADD UNIQUE KEY `emailAdmin` (`emailAdmin`),
  ADD KEY `idStatusAdmin` (`idStatus`);

--
-- Índices de tabela `tb_area`
--
ALTER TABLE `tb_area`
  ADD PRIMARY KEY (`idArea`);

--
-- Índices de tabela `tb_areainteresseusuario`
--
ALTER TABLE `tb_areainteresseusuario`
  ADD PRIMARY KEY (`idAreaInteresseUsuario`),
  ADD KEY `idInteresseUsuario` (`idUsuario`),
  ADD KEY `idAreaInteresse` (`idArea`);

--
-- Índices de tabela `tb_atuacaoempresa`
--
ALTER TABLE `tb_atuacaoempresa`
  ADD PRIMARY KEY (`idAtuacaoEmpresa`),
  ADD KEY `idEmpresa` (`idEmpresa`),
  ADD KEY `idArea` (`idArea`);

--
-- Índices de tabela `tb_chat`
--
ALTER TABLE `tb_chat`
  ADD PRIMARY KEY (`idChat`),
  ADD KEY `idChatEmpresa` (`idEmpresa`),
  ADD KEY `idChatUsuario` (`idUsuario`),
  ADD KEY `idChatAdmin` (`idAdmin`);

--
-- Índices de tabela `tb_denunciaempresa`
--
ALTER TABLE `tb_denunciaempresa`
  ADD PRIMARY KEY (`idDenunciaEmpresa`),
  ADD KEY `idStatusDenuncia` (`idStatus`),
  ADD KEY `idEmpresaDenunciada` (`idEmpresa`),
  ADD KEY `idUsuarioDenunciante` (`idUsuario`);

--
-- Índices de tabela `tb_denunciausuario`
--
ALTER TABLE `tb_denunciausuario`
  ADD PRIMARY KEY (`idDenunciaUsuario`),
  ADD KEY `idEmpresaDenunciante` (`idEmpresa`),
  ADD KEY `idUsuarioDenunciado` (`idUsuario`),
  ADD KEY `idStatusDenunciaUsuario` (`idStatus`);

--
-- Índices de tabela `tb_denunciavaga`
--
ALTER TABLE `tb_denunciavaga`
  ADD PRIMARY KEY (`idDenunciaVaga`),
  ADD KEY `idStatusDenunciaVaga` (`idStatus`),
  ADD KEY `idVagaDenunciada` (`idVaga`),
  ADD KEY `idDenunciante` (`idUsuario`);

--
-- Índices de tabela `tb_empresa`
--
ALTER TABLE `tb_empresa`
  ADD PRIMARY KEY (`idEmpresa`),
  ADD UNIQUE KEY `usernameEmpresa` (`usernameEmpresa`),
  ADD UNIQUE KEY `emailEmpresa` (`emailEmpresa`),
  ADD UNIQUE KEY `cnpjEmpresa` (`cnpjEmpresa`),
  ADD KEY `idStatusEmpresa` (`idStatus`);

--
-- Índices de tabela `tb_escolas`
--
ALTER TABLE `tb_escolas`
  ADD PRIMARY KEY (`idEscolas`);

--
-- Índices de tabela `tb_linguas`
--
ALTER TABLE `tb_linguas`
  ADD PRIMARY KEY (`idLingua`);

--
-- Índices de tabela `tb_mensagem`
--
ALTER TABLE `tb_mensagem`
  ADD PRIMARY KEY (`idMensagem`),
  ADD KEY `idMensagemUsuario` (`idUsuario`),
  ADD KEY `idMensagemEmpresa` (`idEmpresa`),
  ADD KEY `idMensagemChat` (`idChat`);

--
-- Índices de tabela `tb_modalidadevaga`
--
ALTER TABLE `tb_modalidadevaga`
  ADD PRIMARY KEY (`idModalidadeVaga`);

--
-- Índices de tabela `tb_notificacoes`
--
ALTER TABLE `tb_notificacoes`
  ADD PRIMARY KEY (`idNotificacao`),
  ADD KEY `idNotificacaoEmpresa` (`idEmpresa`),
  ADD KEY `idNotificacaoUsuario` (`idUsuario`),
  ADD KEY `idNotificacaoVaga` (`idVaga`);

--
-- Índices de tabela `tb_publicacao`
--
ALTER TABLE `tb_publicacao`
  ADD PRIMARY KEY (`idPublicacao`),
  ADD KEY `idEmpresaPublicadora` (`idEmpresa`),
  ADD KEY `idVagaRelacionada` (`idVaga`),
  ADD KEY `idAdminAprovador` (`idAdmin`);

--
-- Índices de tabela `tb_salvarvaga`
--
ALTER TABLE `tb_salvarvaga`
  ADD PRIMARY KEY (`idSalvarVaga`),
  ADD KEY `idUsuarioFavoritador` (`idUsuario`),
  ADD KEY `idVagaSalva` (`idVaga`);

--
-- Índices de tabela `tb_seguir`
--
ALTER TABLE `tb_seguir`
  ADD PRIMARY KEY (`idSeguir`);

--
-- Índices de tabela `tb_status`
--
ALTER TABLE `tb_status`
  ADD PRIMARY KEY (`idStatus`);

--
-- Índices de tabela `tb_statusvagausuario`
--
ALTER TABLE `tb_statusvagausuario`
  ADD PRIMARY KEY (`idStatusVagaUsuario`);

--
-- Índices de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `usernameUsuario` (`usernameUsuario`),
  ADD UNIQUE KEY `emailUsuario` (`emailUsuario`),
  ADD KEY `idStatusUsuario` (`idStatus`);

--
-- Índices de tabela `tb_vaga`
--
ALTER TABLE `tb_vaga`
  ADD PRIMARY KEY (`idVaga`),
  ADD KEY `idStatusVaga` (`idStatus`),
  ADD KEY `idVagaEmpresa` (`idEmpresa`),
  ADD KEY `idArea` (`idArea`),
  ADD KEY `idModalidadeVaga` (`idModalidadeVaga`);

--
-- Índices de tabela `tb_vagausuario`
--
ALTER TABLE `tb_vagausuario`
  ADD PRIMARY KEY (`idVagaUsuario`),
  ADD KEY `idUsuarioVaga` (`idUsuario`),
  ADD KEY `idVagaEscolhida` (`idVaga`),
  ADD KEY `idStatusVagaUsuario` (`idStatusVagaUsuario`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_area`
--
ALTER TABLE `tb_area`
  MODIFY `idArea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `tb_areainteresseusuario`
--
ALTER TABLE `tb_areainteresseusuario`
  MODIFY `idAreaInteresseUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_atuacaoempresa`
--
ALTER TABLE `tb_atuacaoempresa`
  MODIFY `idAtuacaoEmpresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT de tabela `tb_chat`
--
ALTER TABLE `tb_chat`
  MODIFY `idChat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de tabela `tb_denunciaempresa`
--
ALTER TABLE `tb_denunciaempresa`
  MODIFY `idDenunciaEmpresa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_denunciausuario`
--
ALTER TABLE `tb_denunciausuario`
  MODIFY `idDenunciaUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_denunciavaga`
--
ALTER TABLE `tb_denunciavaga`
  MODIFY `idDenunciaVaga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_empresa`
--
ALTER TABLE `tb_empresa`
  MODIFY `idEmpresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de tabela `tb_escolas`
--
ALTER TABLE `tb_escolas`
  MODIFY `idEscolas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tb_linguas`
--
ALTER TABLE `tb_linguas`
  MODIFY `idLingua` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `tb_mensagem`
--
ALTER TABLE `tb_mensagem`
  MODIFY `idMensagem` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `tb_modalidadevaga`
--
ALTER TABLE `tb_modalidadevaga`
  MODIFY `idModalidadeVaga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_notificacoes`
--
ALTER TABLE `tb_notificacoes`
  MODIFY `idNotificacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_publicacao`
--
ALTER TABLE `tb_publicacao`
  MODIFY `idPublicacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT de tabela `tb_salvarvaga`
--
ALTER TABLE `tb_salvarvaga`
  MODIFY `idSalvarVaga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_seguir`
--
ALTER TABLE `tb_seguir`
  MODIFY `idSeguir` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `tb_status`
--
ALTER TABLE `tb_status`
  MODIFY `idStatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `tb_statusvagausuario`
--
ALTER TABLE `tb_statusvagausuario`
  MODIFY `idStatusVagaUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de tabela `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de tabela `tb_vaga`
--
ALTER TABLE `tb_vaga`
  MODIFY `idVaga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=87;

--
-- AUTO_INCREMENT de tabela `tb_vagausuario`
--
ALTER TABLE `tb_vagausuario`
  MODIFY `idVagaUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=141;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD CONSTRAINT `idStatusAdmin` FOREIGN KEY (`idStatus`) REFERENCES `tb_status` (`idStatus`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_areainteresseusuario`
--
ALTER TABLE `tb_areainteresseusuario`
  ADD CONSTRAINT `idAreaInteresse` FOREIGN KEY (`idArea`) REFERENCES `tb_area` (`idArea`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idInteresseUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_atuacaoempresa`
--
ALTER TABLE `tb_atuacaoempresa`
  ADD CONSTRAINT `idArea` FOREIGN KEY (`idArea`) REFERENCES `tb_area` (`idArea`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idEmpresa` FOREIGN KEY (`idEmpresa`) REFERENCES `tb_empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_chat`
--
ALTER TABLE `tb_chat`
  ADD CONSTRAINT `idChatAdmin` FOREIGN KEY (`idAdmin`) REFERENCES `tb_admin` (`idAdmin`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idChatEmpresa` FOREIGN KEY (`idEmpresa`) REFERENCES `tb_empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idChatUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_denunciaempresa`
--
ALTER TABLE `tb_denunciaempresa`
  ADD CONSTRAINT `idEmpresaDenunciada` FOREIGN KEY (`idEmpresa`) REFERENCES `tb_empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idStatusDenuncia` FOREIGN KEY (`idStatus`) REFERENCES `tb_status` (`idStatus`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idUsuarioDenunciante` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_denunciausuario`
--
ALTER TABLE `tb_denunciausuario`
  ADD CONSTRAINT `idEmpresaDenunciante` FOREIGN KEY (`idEmpresa`) REFERENCES `tb_empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idStatusDenunciaUsuario` FOREIGN KEY (`idStatus`) REFERENCES `tb_status` (`idStatus`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idUsuarioDenunciado` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_denunciavaga`
--
ALTER TABLE `tb_denunciavaga`
  ADD CONSTRAINT `idDenunciante` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idStatusDenunciaVaga` FOREIGN KEY (`idStatus`) REFERENCES `tb_status` (`idStatus`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idVagaDenunciada` FOREIGN KEY (`idVaga`) REFERENCES `tb_vaga` (`idVaga`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_empresa`
--
ALTER TABLE `tb_empresa`
  ADD CONSTRAINT `idStatusEmpresa` FOREIGN KEY (`idStatus`) REFERENCES `tb_status` (`idStatus`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_mensagem`
--
ALTER TABLE `tb_mensagem`
  ADD CONSTRAINT `idMensagemChat` FOREIGN KEY (`idChat`) REFERENCES `tb_chat` (`idChat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idMensagemEmpresa` FOREIGN KEY (`idEmpresa`) REFERENCES `tb_empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idMensagemUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_notificacoes`
--
ALTER TABLE `tb_notificacoes`
  ADD CONSTRAINT `idNotificacaoEmpresa` FOREIGN KEY (`idEmpresa`) REFERENCES `tb_empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idNotificacaoUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idNotificacaoVaga` FOREIGN KEY (`idVaga`) REFERENCES `tb_vaga` (`idVaga`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_publicacao`
--
ALTER TABLE `tb_publicacao`
  ADD CONSTRAINT `idAdminAprovador` FOREIGN KEY (`idAdmin`) REFERENCES `tb_admin` (`idAdmin`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idEmpresaPublicadora` FOREIGN KEY (`idEmpresa`) REFERENCES `tb_empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idVagaRelacionada` FOREIGN KEY (`idVaga`) REFERENCES `tb_vaga` (`idVaga`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_salvarvaga`
--
ALTER TABLE `tb_salvarvaga`
  ADD CONSTRAINT `idUsuarioFavoritador` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idVagaSalva` FOREIGN KEY (`idVaga`) REFERENCES `tb_vaga` (`idVaga`);

--
-- Restrições para tabelas `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD CONSTRAINT `idStatusUsuario` FOREIGN KEY (`idStatus`) REFERENCES `tb_status` (`idStatus`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_vaga`
--
ALTER TABLE `tb_vaga`
  ADD CONSTRAINT `idStatusVaga` FOREIGN KEY (`idStatus`) REFERENCES `tb_status` (`idStatus`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idVagaEmpresa` FOREIGN KEY (`idEmpresa`) REFERENCES `tb_empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_vaga_ibfk_1` FOREIGN KEY (`idArea`) REFERENCES `tb_area` (`idArea`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tb_vaga_ibfk_2` FOREIGN KEY (`idModalidadeVaga`) REFERENCES `tb_modalidadevaga` (`idModalidadeVaga`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para tabelas `tb_vagausuario`
--
ALTER TABLE `tb_vagausuario`
  ADD CONSTRAINT `idStatusVagaUsuario` FOREIGN KEY (`idStatusVagaUsuario`) REFERENCES `tb_statusvagausuario` (`idStatusVagaUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idUsuarioVaga` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idVagaEscolhida` FOREIGN KEY (`idVaga`) REFERENCES `tb_vaga` (`idVaga`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
