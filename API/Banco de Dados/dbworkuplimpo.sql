-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 12, 2024 at 01:21 AM
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
-- Database: `dbworkuplimpo`
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
  `senhaAdmin` varchar(120) NOT NULL,
  `contatoAdmin` varchar(120) NOT NULL,
  `fotoAdmin` text NOT NULL,
  `idStatus` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `senhaEmpresa` varchar(50) NOT NULL,
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
  `idVaga` int(11) NOT NULL,
  `updated_at` datetime NOT NULL,
  `created_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

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
  `senhaUsuario` varchar(50) NOT NULL,
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
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_admin`
--
ALTER TABLE `tb_admin`
  MODIFY `idAdmin` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `idAtuacaoEmpresa` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `idEmpresa` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `idPublicacao` int(11) NOT NULL AUTO_INCREMENT;

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
  MODIFY `idVaga` int(11) NOT NULL AUTO_INCREMENT;

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
  ADD CONSTRAINT `idEmpresaPublicadora` FOREIGN KEY (`idEmpresa`) REFERENCES `tb_publicacao` (`idPublicacao`) ON DELETE CASCADE ON UPDATE CASCADE,
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
  ADD CONSTRAINT `idStatusVaga` FOREIGN KEY (`idStatus`) REFERENCES `tb_vaga` (`idVaga`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `idVagaEmpresa` FOREIGN KEY (`idEmpresa`) REFERENCES `tb_empresa` (`idEmpresa`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
