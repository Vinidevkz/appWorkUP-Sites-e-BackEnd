-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2024 at 03:01 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dbworkupteste`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_admin`
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
-- Dumping data for table `tb_admin`
--

INSERT INTO `tb_admin` (`idAdmin`, `nomeAdmin`, `usernameAdmin`, `emailAdmin`, `senhaAdmin`, `contatoAdmin`, `fotoAdmin`, `idStatus`, `created_at`, `updated_at`) VALUES
(1, 'Admin', 'admin', 'admin@admin.com', '$2y$10$cUpTQVon8qNrfny1.849iO0G.w7/.Fuu9tQ2xNtKnikjOj7N2Jctm', '(11)9 9999-9999', 'fc29c16347cac127de9ef3d04cd20f68.jpg', 1, '2024-11-13 20:31:50', '2024-11-13 20:31:50'),
(2, 'Danilo da Silva', 'Danilo', 'danilo@gmail.com', '$2y$10$zRWHNqxm7cnsOTmOB6Ll6OsNP.pCKw9XmCqpyo/AeQ.TxYgQo4Ihm', '(11)9 1111-1111', 'fc29c16347cac127de9ef3d04cd20f68.jpg', 1, '2024-11-13 20:31:50', '2024-11-13 20:31:50'),
(3, 'Vitor Augusto', 'Vitor', 'vitor@gmail.com', '$2y$10$x7xwpwULEswNXDbVg5AdsuxxvBuVijL7Ofg28m2v0tiTBZUhwwRBS', '(11)9 1111-1111', 'fc29c16347cac127de9ef3d04cd20f68.jpg', 1, '2024-11-13 20:31:50', '2024-11-13 20:31:50');

-- --------------------------------------------------------

--
-- Table structure for table `tb_area`
--

CREATE TABLE `tb_area` (
  `idArea` int(11) NOT NULL,
  `nomeArea` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_area`
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
-- Table structure for table `tb_areainteresseusuario`
--

CREATE TABLE `tb_areainteresseusuario` (
  `idAreaInteresseUsuario` int(11) NOT NULL,
  `idArea` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_atuacaoempresa`
--

CREATE TABLE `tb_atuacaoempresa` (
  `idAtuacaoEmpresa` int(11) NOT NULL,
  `idArea` int(11) NOT NULL,
  `idEmpresa` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_atuacaoempresa`
--

INSERT INTO `tb_atuacaoempresa` (`idAtuacaoEmpresa`, `idArea`, `idEmpresa`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 10, 1),
(4, 11, 1),
(5, 15, 1),
(6, 1, 2),
(7, 2, 2),
(8, 3, 2),
(9, 5, 2),
(10, 1, 3),
(11, 2, 3),
(12, 7, 3),
(13, 9, 3),
(14, 1, 4),
(15, 2, 4),
(16, 3, 4),
(17, 5, 4),
(18, 7, 4),
(19, 9, 4),
(20, 10, 4),
(21, 11, 4),
(22, 12, 4),
(23, 15, 4),
(24, 1, 5),
(25, 2, 5),
(26, 3, 5),
(27, 5, 5),
(28, 7, 5),
(29, 9, 5),
(30, 10, 5),
(31, 12, 5),
(32, 14, 5),
(33, 2, 6),
(34, 5, 6),
(35, 10, 6),
(36, 15, 6),
(37, 1, 7),
(38, 2, 7),
(39, 3, 7),
(40, 9, 7),
(41, 4, 8),
(42, 5, 8),
(43, 9, 8),
(44, 10, 8),
(45, 11, 8),
(46, 2, 9),
(47, 3, 9),
(48, 5, 9),
(49, 7, 9);

-- --------------------------------------------------------

--
-- Table structure for table `tb_chat`
--

CREATE TABLE `tb_chat` (
  `idChat` int(11) NOT NULL,
  `idMensagem` int(11) NOT NULL,
  `idEmpresa` int(11) DEFAULT NULL,
  `idUsuario` int(11) DEFAULT NULL,
  `idAdmin` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_denunciaempresa`
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
-- Table structure for table `tb_denunciausuario`
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
-- Table structure for table `tb_denunciavaga`
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
-- Table structure for table `tb_empresa`
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
-- Dumping data for table `tb_empresa`
--

INSERT INTO `tb_empresa` (`idEmpresa`, `usernameEmpresa`, `nomeEmpresa`, `emailEmpresa`, `fotoEmpresa`, `bannerEmpresa`, `sobreEmpresa`, `cnpjEmpresa`, `contatoEmpresa`, `senhaEmpresa`, `cidadeEmpresa`, `estadoEmpresa`, `LogradouroEmpresa`, `cepEmpresa`, `numeroLograEmpresa`, `avaliacaoEmpresa`, `idStatus`, `created_at`, `updated_at`) VALUES
(1, 'Sophia Gomes', 'Coca-Cola', 'cocacola@coke.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2Fcoca.jpg?alt=media&token=ec816819-4f00-4250-b757-6f2de5801366', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2Fcocacola.webp?alt=media&token=b4ea6126-7285-46a3-ba93-19e19cb08eda', 'A Coca-Cola é uma das marcas mais icônicas e reconhecidas globalmente, fundada em 1886 por John Stith Pemberton. Com uma visão de criar momentos de otimismo e felicidade, a empresa se tornou sinônimo de refresco, qualidade e inovação. Através de sua vasta gama de produtos, que inclui refrigerantes, águas, sucos e bebidas energéticas, a Coca-Cola continua a impactar positivamente a vida de milhões de pessoas ao redor do mundo. Com um compromisso contínuo com a sustentabilidade e a responsabilidade social, a Coca-Cola está empenhada em promover um futuro mais saudável e sustentável. Presente em mais de 200 países, a Coca-Cola é mais do que uma bebida – é uma marca que conecta culturas e gerações.', '96.283.291/0001-41', '(91) 3685-2919', '$2y$10$vyvI3tzanAFEQagYzjCfqeQLvVsGq6mffWqrdiwvtYGzq5i9HooSG', 'Fortaleza', 'CE', 'Vila Aline', '60331-760', '1421', NULL, 1, '2024-11-13 21:06:50', '2024-11-13 21:31:51'),
(2, 'Matheus José', 'Apple Inc.', 'comercial@apple.com.br', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2Fapple.png?alt=media&token=69896776-87e5-4cac-a346-5a273f889664', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2Fapple.webp?alt=media&token=400fbf75-2e17-4ba4-af3a-e69a2d83d116', 'A Apple é uma multinacional de tecnologia que inova com produtos como iPhone, MacBook, iPad e Apple Watch, oferecendo também serviços de software e entretenimento digital.', '12.345.678/0001-90', '(11) 4000-1000', '$2y$10$jiummykH.4r7fZ3lho73/OTiMo/im2wZlmV4KxGkhqLTr6NWVHVUu', 'São Paulo', 'SP', 'Avenida Paulista', '01310-000', '1009', NULL, 1, '2024-11-13 21:15:56', '2024-11-13 21:31:52'),
(3, 'Victor Elias', 'Google Brasil', 'atendimento@googlebr.com.br', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2Fgooglelogo.png?alt=media&token=1ecaa471-be67-442a-83b0-a6c2c006a099', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2Fgoogle.jpg?alt=media&token=efa0a702-c5c2-47c3-a0c9-c1b42b4bfa04', 'O Google é uma das maiores empresas de tecnologia, oferecendo soluções de busca, publicidade digital, inteligência artificial e muito mais, impactando milhões de usuários globalmente.', '34.567.890/0001-23', '(21) 3003-0100', '$2y$10$1aISXw94FtdXtNTZETILuOkhn.wh2gtqEc833UGGFM5/BAxw1C0YG', 'Rio de Janeiro', 'RJ', 'Rua da Passagem', '22290-030', '3092', NULL, 1, '2024-11-13 21:20:27', '2024-11-13 21:31:54'),
(4, 'Giovanna Nunes', 'Amazon Brasil', 'vendas@amazonbr.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2Famazonlogo.png?alt=media&token=1e8e1078-12b3-4ef6-8c52-3bacb32f772b', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2Famazon.jpg?alt=media&token=4b5091af-a236-4121-8177-679bd5310f69', 'A Amazon é uma gigante do comércio eletrônico e serviços de nuvem, oferecendo produtos e conteúdos digitais com foco em conveniência e inovação para consumidores em todo o mundo.', '98.765.432/0001-87', '(11) 4003-4050', '$2y$10$88J8CTEIIltzk.UQkPQWA.cNiIjrnJVFH3L/NGx4w9Spm0viQzdNC', 'São Paulo', 'SP', 'Rua da Consolação', '01416-000', '3007', NULL, 1, '2024-11-13 21:25:36', '2024-11-13 21:31:56'),
(5, 'Carlos Eduardo', 'Microsoft Brasil', 'suporte@microsoft-br.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2FMicrosoft_logo.svg.png?alt=media&token=a651e68a-b38d-414f-986e-4e745ba7f29e', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2Ftagreuters.com2024binary_LYNXMPEK7K0RC-FILEDIMAGE.webp?alt=media&token=349bf4bf-18b1-436c-b743-5431e57fffec', 'A Microsoft é uma líder global em soluções de software, incluindo o sistema operacional Windows, e também oferece produtos em áreas como computação em nuvem, videogames e inteligência artificial.', '23.456.789/0001-01', '(11) 4004-2200', '$2y$10$fGKHp1Rf5eKdPg6fsIEi9eU071BOBKjLxYtMvYIV1Ht1ssLEWv0Ve', 'São Caetano do Sul', 'SP', 'Travessa José Mariano Garcia', '09550-760', '2098', NULL, 1, '2024-11-13 21:28:07', '2024-11-13 21:31:58'),
(6, 'Carolina Bruna', 'Nike Brasil', 'marketing@nikebrasil.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2Fnikelogo.png?alt=media&token=1e696635-f2eb-4247-886a-f8cfe55667e5', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2Fnike.webp?alt=media&token=f51578c5-2ce0-426d-9c20-6294f6d6ef98', 'A Nike é a maior marca global de calçados, vestuário e equipamentos esportivos, sendo reconhecida por sua inovação em design e por seu impacto nas indústrias de moda e esportes.', '54.321.098/0001-56', '(11) 3030-3030', '$2y$10$ox.zu0mLkKHAgJ1kUoDwt.ZkY9tMdUQPeR8FSRsB2wR7H4jL3s7ma', 'São Paulo', 'SP', 'Rua Satélite Febe', '04858-500', '4072', NULL, 1, '2024-11-13 21:30:41', '2024-11-13 21:31:59'),
(7, 'Brenda Souza', 'Tech Solutions Ltda.', 'contato@techsolutions.com.br', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2Ftechsolutions.png?alt=media&token=2b52ac9d-db22-4f91-983d-c601a932e56f', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2Ftechsolutionsbanner.png?alt=media&token=42e2aa7d-0b44-4774-b2a8-287e3163c26d', 'A Tech Solutions é uma empresa especializada em desenvolvimento de soluções tecnológicas personalizadas, atendendo diversas indústrias com serviços de software e consultoria.', '45.678.901/0001-23', '(11) 4000-2000', '$2y$10$hExwbU/DQ5xcZ1OT8q6a0OzpVaI3ImIWFdqaFlk86amg86Spt07lG', 'São Paulo', 'SP', 'Praça da Sé', '01001-000', '510', NULL, 1, '2024-11-13 21:34:40', '2024-11-13 21:43:37'),
(8, 'Elias Matheus', 'Global Food S.A.', 'vendas@globalfood.com', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2Fglobalfoodlogo.jpg?alt=media&token=d42a11b1-ee8a-4f6d-818f-0269f6717e8e', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2Fglobalfood.jpg?alt=media&token=41d0307d-e0b5-421b-9f03-b50cbc7641bd', 'A Global Food é uma empresa de alimentos que oferece produtos de alta qualidade, com foco em alimentos saudáveis e sustentáveis para consumidores em todo o mundo.', '12.345.678/0001-99', '(21) 3003-0202', '$2y$10$dq.NUxBB49uQ/KCKSOH3de8Hw41VyKyKJEQVDf5ff.kvboki9ZDAW', 'Rio de Janeiro', 'RJ', 'Avenida Rio Branco', '20040-002', '982', NULL, 1, '2024-11-13 21:40:16', '2024-11-13 21:43:39'),
(9, 'Isabella Silva', 'Bright Ideas Consultoria', 'consultoria@brightideas.com.br', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_foto%2Fbrightideaslogo.png?alt=media&token=083bf51f-0d7a-4146-9cb2-3e7d97acd5ef', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/empresa_banner%2Fbrightideas.webp?alt=media&token=29bb7634-a0e5-4f42-a4ae-53809d026de3', 'A Bright Ideas é uma empresa de consultoria estratégica, focada em ajudar organizações a atingirem seus objetivos através de soluções inovadoras e consultoria personalizada.', '56.789.123/0001-44', '(31) 3322-4455', '$2y$10$2NbuAt.kDIEOJ1QyNAPwauKsAFkZXS9QgmG/7EM8mxbmKCJZMLJOm', 'Belo Horizonte', 'MG', 'Praça Benjamin Guimarães', '30130-030', '409', NULL, 1, '2024-11-13 21:43:24', '2024-11-13 21:43:41');

-- --------------------------------------------------------

--
-- Table structure for table `tb_escolas`
--

CREATE TABLE `tb_escolas` (
  `idEscolas` int(11) NOT NULL,
  `nomeEscola` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_escolas`
--

INSERT INTO `tb_escolas` (`idEscolas`, `nomeEscola`) VALUES
(1, 'Escola Primavera'),
(2, 'Colégio Estrela do Saber'),
(3, 'Instituto Educacional Futuro'),
(4, 'Escola Nova Esperança'),
(5, 'Centro de Ensino Horizonte');

-- --------------------------------------------------------

--
-- Table structure for table `tb_linguas`
--

CREATE TABLE `tb_linguas` (
  `idLingua` int(11) NOT NULL,
  `nomeLingua` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_linguas`
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
-- Table structure for table `tb_mensagem`
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
-- Table structure for table `tb_modalidadevaga`
--

CREATE TABLE `tb_modalidadevaga` (
  `idModalidadeVaga` int(11) NOT NULL,
  `descModalidadeVaga` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_modalidadevaga`
--

INSERT INTO `tb_modalidadevaga` (`idModalidadeVaga`, `descModalidadeVaga`) VALUES
(1, 'Presencial'),
(2, 'Híbrido'),
(3, 'Remoto');

-- --------------------------------------------------------

--
-- Table structure for table `tb_notificacoes`
--

CREATE TABLE `tb_notificacoes` (
  `idNotificacao` int(11) NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idVaga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_publicacao`
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
-- Dumping data for table `tb_publicacao`
--

INSERT INTO `tb_publicacao` (`idPublicacao`, `tituloPublicacao`, `detalhePublicacao`, `fotoPublicacao`, `idEmpresa`, `idAdmin`, `idVaga`, `updated_at`, `created_at`) VALUES
(3, 'Vaga para Desenvolvedor de Sistemas - Venha Crescer Conosco!', 'A TechSolutions está contratando um Desenvolvedor de Sistemas! Se você tem interesse em programação e busca uma oportunidade de crescimento na área de TI, essa vaga é para você. Não precisa ter experiência prévia, apenas vontade de aprender e se desenvolver.', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2Fpexels-photo-546819.jpeg?alt=media&token=a67a9c4f-a8c4-4892-a38b-edde39349b8d', 7, NULL, 5, '2024-11-13 22:39:28', '2024-11-13 22:39:28'),
(4, 'Vaga para Auxiliar de Suporte Técnico - Junte-se ao Time de Suporte!', 'A TechSolutions está à procura de um Auxiliar de Suporte Técnico! Se você tem interesse em resolver problemas técnicos, aprender sobre a infraestrutura de TI e desenvolver suas habilidades, essa é a vaga para você! Não é necessária experiência prévia, apenas vontade de crescer na área.', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2Fsoftware-develper-working-on-laptop-at-home-office-programmer-working-develop-web-application-software-programming-concept-free-photo.jpg?alt=media&token=fa5e9cce-6c33-44a7-91ae-8357848a9fbd', 7, NULL, 6, '2024-11-13 22:41:22', '2024-11-13 22:41:22'),
(5, 'Vaga de Auxiliar Administrativo!', 'A Global Food está contratando um Auxiliar Administrativo! Se você gosta de organização, lidar com documentos e quer aprender sobre a área administrativa, essa vaga é para você. Não precisa ter experiência, apenas disposição para aprender e se desenvolver.', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2Fistockphoto-178609380-612x612.jpg?alt=media&token=cb985d6d-4f7e-4d6a-8740-a2f94625e23b', 8, NULL, 10, '2024-11-13 22:46:00', '2024-11-13 22:46:00'),
(7, 'Vaga de Auxiliar de Operações Logísticas - Comece Sua Jornada na Logística!', 'A Global Food está à procura de um Auxiliar de Operações Logísticas! Se você gosta de trabalhar com processos logísticos, organização e aprender sobre cadeia de suprimentos, essa vaga é para você. Não precisa ter experiência prévia, apenas vontade de crescer na área.', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2FLogistics-Warehouse-Administrator-Stock-Photo-02.jpg?alt=media&token=c58dfc9c-7c6b-4dd0-a120-c691c2c4d0cc', 8, NULL, 8, '2024-11-13 22:48:00', '2024-11-13 22:48:00'),
(8, 'Vaga para Analista de Marketing Digital - Junte-se ao Time de Inovação!', 'Se você tem interesse por redes sociais, marketing digital e quer aprender com uma equipe inovadora, essa vaga é para você! Não precisa de experiência anterior, apenas vontade de aprender e criar. Venha fazer parte da nossa equipe!', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2Fdepositphotos_84036744-stock-photo-team-business-meeting-concept.jpg?alt=media&token=e0ee1ade-f3c9-4325-a209-4a3128798671', 9, NULL, 4, '2024-11-13 22:50:38', '2024-11-13 22:50:38'),
(9, 'Vaga para Assistente Administrativo - Oportunidade para Iniciantes!', 'Se você tem interesse em aprender e se desenvolver na área, esta vaga será perfeita para você! Fique atento e venha fazer parte da nossa equipe para crescer junto com a gente.', 'https://firebasestorage.googleapis.com/v0/b/workup-464af.appspot.com/o/publicacao%2Fistockphoto-1383977365-612x612.jpg?alt=media&token=722d5607-2cd7-4121-9e0e-a7451e918e59', 9, NULL, NULL, '2024-11-13 22:55:25', '2024-11-13 22:55:25');

-- --------------------------------------------------------

--
-- Table structure for table `tb_salvarvaga`
--

CREATE TABLE `tb_salvarvaga` (
  `idSalvarVaga` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idVaga` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_seguir`
--

CREATE TABLE `tb_seguir` (
  `idSeguir` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idEmpresa` int(11) NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tb_status`
--

CREATE TABLE `tb_status` (
  `idStatus` int(11) NOT NULL,
  `tipoStatus` varchar(120) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_status`
--

INSERT INTO `tb_status` (`idStatus`, `tipoStatus`) VALUES
(1, 'Ativo'),
(2, 'Bloqueado'),
(3, 'Pendente'),
(4, 'Revisão'),
(5, 'Aceito');

-- --------------------------------------------------------

--
-- Table structure for table `tb_statusvagausuario`
--

CREATE TABLE `tb_statusvagausuario` (
  `idStatusVagaUsuario` int(11) NOT NULL,
  `tipoStatusVaga` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tb_statusvagausuario`
--

INSERT INTO `tb_statusvagausuario` (`idStatusVagaUsuario`, `tipoStatusVaga`) VALUES
(1, 'Pendente'),
(2, 'Chamado'),
(3, 'Reprovado');

-- --------------------------------------------------------

--
-- Table structure for table `tb_usuario`
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

-- --------------------------------------------------------

--
-- Table structure for table `tb_vaga`
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
-- Dumping data for table `tb_vaga`
--

INSERT INTO `tb_vaga` (`idVaga`, `nomeVaga`, `descricaoVaga`, `prazoVaga`, `salarioVaga`, `cidadeVaga`, `estadoVaga`, `beneficiosVaga`, `diferencialVaga`, `idEmpresa`, `idArea`, `idStatus`, `idModalidadeVaga`, `created_at`, `updated_at`) VALUES
(2, 'Consultor de Gestão Estratégica', 'O consultor será responsável por analisar e otimizar os processos internos de empresas clientes, fornecendo soluções estratégicas e personalizadas. Procuramos alguém com perfil analítico e habilidades para liderar projetos de transformação organizacional.', '2024-12-10', 2000.00, 'Belo Horizonte', 'MG', 'Vale refeição, Plano de saúde e Auxílio home office', 'Experiência prévia em consultoria de gestão e estratégia de empresas', 9, 3, 3, 2, '2024-11-13 21:53:48', '2024-11-13 21:57:08'),
(3, 'Especialista em Gestão de Mudanças', 'O especialista em gestão de mudanças será responsável por planejar e implementar estratégias que promovam a adoção de mudanças dentro das organizações clientes.', '2024-12-30', 1500.00, 'Belo Horizonte', 'MG', 'Vale refeição, Plano odontológico e Participação nos lucros', 'Experiência prévia em projetos de transformação organizacional', 9, 3, 3, 2, '2024-11-13 22:07:35', '2024-11-13 22:07:35'),
(4, 'Analista de Marketing Digital', 'O analista de marketing digital será responsável por planejar, executar e analisar campanhas de marketing online. Buscamos um profissional criativo e analítico, que entenda das principais plataformas de marketing digital e saiba como gerar leads e aumentar a visibilidade online.', '2025-01-10', 2500.00, 'Belo Horizonte', 'MG', 'Vale transporte, Vale refeição e Plano de saúde', 'Experiência com campanhas pagas no Google Ads e redes sociais', 9, 2, 3, 3, '2024-11-13 22:09:09', '2024-11-13 22:09:09'),
(5, 'Desenvolvedor de Software', 'Estamos em busca de um desenvolvedor de software para criar soluções personalizadas para nossos clientes, com foco em inteligência artificial e automação. O candidato ideal deve ter experiência com frameworks modernos e estar disposto a aprender novas tecnologias.', '2024-11-30', 1550.00, 'São Paulo', 'SP', 'Vale refeição, Plano de saúde e Auxílio home office', 'Experiência com tecnologias de inteligência artificial', 7, 1, 3, 3, '2024-11-13 22:11:27', '2024-11-13 22:11:27'),
(6, 'Auxiliar de Suporte Técnico', 'Elabora, atualiza e mantém a documentação técnica básica do ambiente de TI. Registra as atividades exercidas durante o dia. Realiza atendimento à usuários, estações de trabalho e sistemas de forma remota, por telefone ou no local. Instala e configura softwares e hardwares, orienta os usuários nas especificações e comandos necessários para sua utilização.', '2024-11-30', 1500.00, 'São Paulo', 'SP', 'Vale refeição, Plano de saúde ,Auxílio home office e Programa de treinamento', 'Gerenciamento de equipamentos eletrônicos', 7, 1, 3, 3, '2024-11-13 22:14:53', '2024-11-13 22:14:53'),
(7, 'Assistente de Projetos de TI', 'Estamos em busca de um assistente para apoiar no gerenciamento e execução de projetos de TI. O profissional será responsável por auxiliar nas tarefas diárias do time, organizando reuniões, controlando cronogramas e ajudando no acompanhamento dos projetos. Não é necessário ter experiência prévia, mas é desejável interesse por tecnologia e vontade de aprender.', '2025-03-20', 1800.00, 'São Paulo', 'SP', 'Vale alimentação, Vale transporte, Seguro de vida e Oportunidades de aprendizado e crescimentoo', 'Conhecimento básico de metodologias ágeis (Scrum)', 7, 1, 3, 2, '2024-11-13 22:17:11', '2024-11-13 22:17:11'),
(8, 'Auxiliar de Operações Logísticas', 'A Global Food está procurando um Auxiliar de Operações Logísticas para ajudar nas atividades diárias do setor. O profissional será responsável por auxiliar no controle de estoques, organização de entregas e suporte às equipes de logística. Não é necessário experiência anterior, mas é importante ter interesse em aprender e crescer na área.', '2024-12-20', 1800.00, 'São Paulo', 'SP', 'Vale refeição, Vale transporte e Plano de saúde', 'Interesse em logística e cadeia de suprimentos', 8, 10, 3, 1, '2024-11-13 22:20:35', '2024-11-13 22:20:35'),
(9, 'Assistente de Atendimento ao Cliente', 'A Global Food está contratando Assistentes de Atendimento ao Cliente para fornecer suporte aos consumidores da nossa marca. O profissional irá responder dúvidas sobre produtos, gerenciar pedidos e ajudar a resolver eventuais problemas. Buscamos pessoas com boa comunicação e vontade de aprender sobre o mercado alimentício.', '2025-01-30', 1600.00, 'Campinas', 'SP', 'Vale alimentação, Vale transporte e Descontos em produtos', 'Facilidade de comunicação e empatia com clientes', 8, 3, 3, 2, '2024-11-13 22:22:24', '2024-11-13 22:22:24'),
(10, 'Auxiliar Administrativo', 'O profissional será responsável por realizar atividades como organização de documentos, controle de agenda, suporte ao time de vendas e atendimento telefônico. Não é necessária experiência anterior, apenas organização e disposição para aprender.', '2025-02-18', 1600.00, 'São Paulo', 'SP', 'Vale alimentação, Vale transporte e Plano de saúde', 'Boa organização e vontade de aprender sobre processos administrativos', 8, 5, 3, 1, '2024-11-13 22:24:08', '2024-11-13 22:24:08');

-- --------------------------------------------------------

--
-- Table structure for table `tb_vagausuario`
--

CREATE TABLE `tb_vagausuario` (
  `idVagaUsuario` int(11) NOT NULL,
  `idUsuario` int(11) NOT NULL,
  `idVaga` int(11) NOT NULL,
  `idStatusVagaUsuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD PRIMARY KEY (`idAdmin`),
  ADD UNIQUE KEY `usernameAdmin` (`usernameAdmin`),
  ADD UNIQUE KEY `emailAdmin` (`emailAdmin`),
  ADD KEY `idStatusAdmin` (`idStatus`);

--
-- Indexes for table `tb_area`
--
ALTER TABLE `tb_area`
  ADD PRIMARY KEY (`idArea`);

--
-- Indexes for table `tb_areainteresseusuario`
--
ALTER TABLE `tb_areainteresseusuario`
  ADD PRIMARY KEY (`idAreaInteresseUsuario`),
  ADD KEY `idInteresseUsuario` (`idUsuario`),
  ADD KEY `idAreaInteresse` (`idArea`);

--
-- Indexes for table `tb_atuacaoempresa`
--
ALTER TABLE `tb_atuacaoempresa`
  ADD PRIMARY KEY (`idAtuacaoEmpresa`),
  ADD KEY `idEmpresa` (`idEmpresa`),
  ADD KEY `idArea` (`idArea`);

--
-- Indexes for table `tb_chat`
--
ALTER TABLE `tb_chat`
  ADD PRIMARY KEY (`idChat`),
  ADD KEY `idChatEmpresa` (`idEmpresa`),
  ADD KEY `idChatUsuario` (`idUsuario`),
  ADD KEY `idChatAdmin` (`idAdmin`);

--
-- Indexes for table `tb_denunciaempresa`
--
ALTER TABLE `tb_denunciaempresa`
  ADD PRIMARY KEY (`idDenunciaEmpresa`),
  ADD KEY `idStatusDenuncia` (`idStatus`),
  ADD KEY `idEmpresaDenunciada` (`idEmpresa`),
  ADD KEY `idUsuarioDenunciante` (`idUsuario`);

--
-- Indexes for table `tb_denunciausuario`
--
ALTER TABLE `tb_denunciausuario`
  ADD PRIMARY KEY (`idDenunciaUsuario`),
  ADD KEY `idEmpresaDenunciante` (`idEmpresa`),
  ADD KEY `idUsuarioDenunciado` (`idUsuario`),
  ADD KEY `idStatusDenunciaUsuario` (`idStatus`);

--
-- Indexes for table `tb_denunciavaga`
--
ALTER TABLE `tb_denunciavaga`
  ADD PRIMARY KEY (`idDenunciaVaga`),
  ADD KEY `idStatusDenunciaVaga` (`idStatus`),
  ADD KEY `idVagaDenunciada` (`idVaga`),
  ADD KEY `idDenunciante` (`idUsuario`);

--
-- Indexes for table `tb_empresa`
--
ALTER TABLE `tb_empresa`
  ADD PRIMARY KEY (`idEmpresa`),
  ADD UNIQUE KEY `usernameEmpresa` (`usernameEmpresa`),
  ADD UNIQUE KEY `emailEmpresa` (`emailEmpresa`),
  ADD UNIQUE KEY `cnpjEmpresa` (`cnpjEmpresa`),
  ADD KEY `idStatusEmpresa` (`idStatus`);

--
-- Indexes for table `tb_escolas`
--
ALTER TABLE `tb_escolas`
  ADD PRIMARY KEY (`idEscolas`);

--
-- Indexes for table `tb_linguas`
--
ALTER TABLE `tb_linguas`
  ADD PRIMARY KEY (`idLingua`);

--
-- Indexes for table `tb_mensagem`
--
ALTER TABLE `tb_mensagem`
  ADD PRIMARY KEY (`idMensagem`),
  ADD KEY `idMensagemUsuario` (`idUsuario`),
  ADD KEY `idMensagemEmpresa` (`idEmpresa`),
  ADD KEY `idMensagemChat` (`idChat`);

--
-- Indexes for table `tb_modalidadevaga`
--
ALTER TABLE `tb_modalidadevaga`
  ADD PRIMARY KEY (`idModalidadeVaga`);

--
-- Indexes for table `tb_notificacoes`
--
ALTER TABLE `tb_notificacoes`
  ADD PRIMARY KEY (`idNotificacao`),
  ADD KEY `idNotificacaoEmpresa` (`idEmpresa`),
  ADD KEY `idNotificacaoUsuario` (`idUsuario`),
  ADD KEY `idNotificacaoVaga` (`idVaga`);

--
-- Indexes for table `tb_publicacao`
--
ALTER TABLE `tb_publicacao`
  ADD PRIMARY KEY (`idPublicacao`),
  ADD KEY `idEmpresaPublicadora` (`idEmpresa`),
  ADD KEY `idVagaRelacionada` (`idVaga`),
  ADD KEY `idAdminAprovador` (`idAdmin`);

--
-- Indexes for table `tb_salvarvaga`
--
ALTER TABLE `tb_salvarvaga`
  ADD PRIMARY KEY (`idSalvarVaga`),
  ADD KEY `idUsuarioFavoritador` (`idUsuario`),
  ADD KEY `idVagaSalva` (`idVaga`);

--
-- Indexes for table `tb_seguir`
--
ALTER TABLE `tb_seguir`
  ADD PRIMARY KEY (`idSeguir`);

--
-- Indexes for table `tb_status`
--
ALTER TABLE `tb_status`
  ADD PRIMARY KEY (`idStatus`);

--
-- Indexes for table `tb_statusvagausuario`
--
ALTER TABLE `tb_statusvagausuario`
  ADD PRIMARY KEY (`idStatusVagaUsuario`);

--
-- Indexes for table `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD PRIMARY KEY (`idUsuario`),
  ADD UNIQUE KEY `usernameUsuario` (`usernameUsuario`),
  ADD UNIQUE KEY `emailUsuario` (`emailUsuario`),
  ADD KEY `idStatusUsuario` (`idStatus`);

--
-- Indexes for table `tb_vaga`
--
ALTER TABLE `tb_vaga`
  ADD PRIMARY KEY (`idVaga`),
  ADD KEY `idStatusVaga` (`idStatus`),
  ADD KEY `idVagaEmpresa` (`idEmpresa`);

--
-- Indexes for table `tb_vagausuario`
--
ALTER TABLE `tb_vagausuario`
  ADD PRIMARY KEY (`idVagaUsuario`),
  ADD KEY `idUsuarioVaga` (`idUsuario`),
  ADD KEY `idVagaEscolhida` (`idVaga`),
  ADD KEY `idStatusVagaUsuario` (`idStatusVagaUsuario`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_area`
--
ALTER TABLE `tb_area`
  MODIFY `idArea` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `tb_areainteresseusuario`
--
ALTER TABLE `tb_areainteresseusuario`
  MODIFY `idAreaInteresseUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_atuacaoempresa`
--
ALTER TABLE `tb_atuacaoempresa`
  MODIFY `idAtuacaoEmpresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `tb_chat`
--
ALTER TABLE `tb_chat`
  MODIFY `idChat` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_denunciaempresa`
--
ALTER TABLE `tb_denunciaempresa`
  MODIFY `idDenunciaEmpresa` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_denunciausuario`
--
ALTER TABLE `tb_denunciausuario`
  MODIFY `idDenunciaUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_denunciavaga`
--
ALTER TABLE `tb_denunciavaga`
  MODIFY `idDenunciaVaga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_empresa`
--
ALTER TABLE `tb_empresa`
  MODIFY `idEmpresa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_escolas`
--
ALTER TABLE `tb_escolas`
  MODIFY `idEscolas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_linguas`
--
ALTER TABLE `tb_linguas`
  MODIFY `idLingua` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_mensagem`
--
ALTER TABLE `tb_mensagem`
  MODIFY `idMensagem` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_modalidadevaga`
--
ALTER TABLE `tb_modalidadevaga`
  MODIFY `idModalidadeVaga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_notificacoes`
--
ALTER TABLE `tb_notificacoes`
  MODIFY `idNotificacao` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_publicacao`
--
ALTER TABLE `tb_publicacao`
  MODIFY `idPublicacao` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tb_salvarvaga`
--
ALTER TABLE `tb_salvarvaga`
  MODIFY `idSalvarVaga` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_seguir`
--
ALTER TABLE `tb_seguir`
  MODIFY `idSeguir` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_status`
--
ALTER TABLE `tb_status`
  MODIFY `idStatus` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tb_statusvagausuario`
--
ALTER TABLE `tb_statusvagausuario`
  MODIFY `idStatusVagaUsuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tb_usuario`
--
ALTER TABLE `tb_usuario`
  MODIFY `idUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `tb_vaga`
--
ALTER TABLE `tb_vaga`
  MODIFY `idVaga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tb_vagausuario`
--
ALTER TABLE `tb_vagausuario`
  MODIFY `idVagaUsuario` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tb_admin`
--
ALTER TABLE `tb_admin`
  ADD CONSTRAINT `idStatusAdmin` FOREIGN KEY (`idStatus`) REFERENCES `tb_status` (`idStatus`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_areainteresseusuario`
--
ALTER TABLE `tb_areainteresseusuario`
  ADD CONSTRAINT `idAreaInteresse` FOREIGN KEY (`idArea`) REFERENCES `tb_area` (`idArea`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idInteresseUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_atuacaoempresa`
--
ALTER TABLE `tb_atuacaoempresa`
  ADD CONSTRAINT `idArea` FOREIGN KEY (`idArea`) REFERENCES `tb_area` (`idArea`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idEmpresa` FOREIGN KEY (`idEmpresa`) REFERENCES `tb_empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_chat`
--
ALTER TABLE `tb_chat`
  ADD CONSTRAINT `idChatAdmin` FOREIGN KEY (`idAdmin`) REFERENCES `tb_admin` (`idAdmin`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idChatEmpresa` FOREIGN KEY (`idEmpresa`) REFERENCES `tb_empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idChatUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_denunciaempresa`
--
ALTER TABLE `tb_denunciaempresa`
  ADD CONSTRAINT `idEmpresaDenunciada` FOREIGN KEY (`idEmpresa`) REFERENCES `tb_empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idStatusDenuncia` FOREIGN KEY (`idStatus`) REFERENCES `tb_status` (`idStatus`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idUsuarioDenunciante` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_denunciausuario`
--
ALTER TABLE `tb_denunciausuario`
  ADD CONSTRAINT `idEmpresaDenunciante` FOREIGN KEY (`idEmpresa`) REFERENCES `tb_empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idStatusDenunciaUsuario` FOREIGN KEY (`idStatus`) REFERENCES `tb_status` (`idStatus`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idUsuarioDenunciado` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_denunciavaga`
--
ALTER TABLE `tb_denunciavaga`
  ADD CONSTRAINT `idDenunciante` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idStatusDenunciaVaga` FOREIGN KEY (`idStatus`) REFERENCES `tb_status` (`idStatus`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idVagaDenunciada` FOREIGN KEY (`idVaga`) REFERENCES `tb_vaga` (`idVaga`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_empresa`
--
ALTER TABLE `tb_empresa`
  ADD CONSTRAINT `idStatusEmpresa` FOREIGN KEY (`idStatus`) REFERENCES `tb_status` (`idStatus`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_mensagem`
--
ALTER TABLE `tb_mensagem`
  ADD CONSTRAINT `idMensagemChat` FOREIGN KEY (`idChat`) REFERENCES `tb_chat` (`idChat`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idMensagemEmpresa` FOREIGN KEY (`idEmpresa`) REFERENCES `tb_empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idMensagemUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_notificacoes`
--
ALTER TABLE `tb_notificacoes`
  ADD CONSTRAINT `idNotificacaoEmpresa` FOREIGN KEY (`idEmpresa`) REFERENCES `tb_empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idNotificacaoUsuario` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idNotificacaoVaga` FOREIGN KEY (`idVaga`) REFERENCES `tb_vaga` (`idVaga`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_publicacao`
--
ALTER TABLE `tb_publicacao`
  ADD CONSTRAINT `idAdminAprovador` FOREIGN KEY (`idAdmin`) REFERENCES `tb_admin` (`idAdmin`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idEmpresaPublicadora` FOREIGN KEY (`idEmpresa`) REFERENCES `tb_empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idVagaRelacionada` FOREIGN KEY (`idVaga`) REFERENCES `tb_vaga` (`idVaga`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_salvarvaga`
--
ALTER TABLE `tb_salvarvaga`
  ADD CONSTRAINT `idUsuarioFavoritador` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idVagaSalva` FOREIGN KEY (`idVaga`) REFERENCES `tb_vaga` (`idVaga`);

--
-- Constraints for table `tb_usuario`
--
ALTER TABLE `tb_usuario`
  ADD CONSTRAINT `idStatusUsuario` FOREIGN KEY (`idStatus`) REFERENCES `tb_status` (`idStatus`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_vaga`
--
ALTER TABLE `tb_vaga`
  ADD CONSTRAINT `idStatusVaga` FOREIGN KEY (`idStatus`) REFERENCES `tb_status` (`idStatus`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idVagaEmpresa` FOREIGN KEY (`idEmpresa`) REFERENCES `tb_empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tb_vagausuario`
--
ALTER TABLE `tb_vagausuario`
  ADD CONSTRAINT `idStatusVagaUsuario` FOREIGN KEY (`idStatusVagaUsuario`) REFERENCES `tb_statusvagausuario` (`idStatusVagaUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idUsuarioVaga` FOREIGN KEY (`idUsuario`) REFERENCES `tb_usuario` (`idUsuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idVagaEscolhida` FOREIGN KEY (`idVaga`) REFERENCES `tb_vaga` (`idVaga`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
