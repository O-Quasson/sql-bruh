-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 22/04/2025 às 14:29
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
-- Banco de dados: `projeto_kendy_2`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `aluno`
--

CREATE TABLE `aluno` (
  `cpf` varchar(15) NOT NULL,
  `rm` int(11) DEFAULT NULL,
  `nome` varchar(100) DEFAULT NULL,
  `FK_turma_id` int(3) DEFAULT NULL,
  `FK_projeto_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `aluno`
--

INSERT INTO `aluno` (`cpf`, `rm`, `nome`, `FK_turma_id`, `FK_projeto_id`) VALUES
('066.837.070-06', 20260974, 'Guilherme de Souza Oven', 4, 546),
('177.456.210-38', 20250256, 'Felipe Santos Katakuri', 1, 911),
('267.777.250-75', 20240069, 'João Pedro Perospero', 2, 911),
('587.997.240-22', 20237986, 'Mario Eduardo Cracker', 3, 911);

-- --------------------------------------------------------

--
-- Estrutura para tabela `cursos`
--

CREATE TABLE `cursos` (
  `id` int(2) NOT NULL,
  `nome` varchar(3) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `cursos`
--

INSERT INTO `cursos` (`id`, `nome`) VALUES
(1, 'DS'),
(2, 'MEC'),
(3, 'ELT'),
(4, 'ELN'),
(5, 'ADM'),
(6, 'LOG');

-- --------------------------------------------------------

--
-- Estrutura para tabela `projetos`
--

CREATE TABLE `projetos` (
  `id` int(11) NOT NULL,
  `titulo` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `projetos`
--

INSERT INTO `projetos` (`id`, `titulo`) VALUES
(546, 'Mecanismo para desarmar bombas relógio'),
(911, 'Sistema de Freio Automático para Aviões'),
(20001, 'Site para Ver One Piece Pulando Todos os Fillers'),
(2379645, 'Protótipo de Aplicação de IA em um corpo robotizad');

-- --------------------------------------------------------

--
-- Estrutura para tabela `turmas`
--

CREATE TABLE `turmas` (
  `id` int(3) NOT NULL,
  `serie` int(1) DEFAULT NULL,
  `FK_curso_id` int(2) DEFAULT NULL,
  `FK_turno_id` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `turmas`
--

INSERT INTO `turmas` (`id`, `serie`, `FK_curso_id`, `FK_turno_id`) VALUES
(1, 1, 3, 2),
(2, 2, 1, 2),
(3, 3, 2, 2),
(4, 3, 3, 4);

-- --------------------------------------------------------

--
-- Estrutura para tabela `turnos`
--

CREATE TABLE `turnos` (
  `id` int(1) NOT NULL,
  `nome` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `turnos`
--

INSERT INTO `turnos` (`id`, `nome`) VALUES
(1, 'Matutino'),
(2, 'Vespertino'),
(3, 'Noturno'),
(4, 'Integral');

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `aluno`
--
ALTER TABLE `aluno`
  ADD PRIMARY KEY (`cpf`),
  ADD KEY `FK_turma_id` (`FK_turma_id`),
  ADD KEY `FK_projeto_id` (`FK_projeto_id`);

--
-- Índices de tabela `cursos`
--
ALTER TABLE `cursos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `projetos`
--
ALTER TABLE `projetos`
  ADD PRIMARY KEY (`id`);

--
-- Índices de tabela `turmas`
--
ALTER TABLE `turmas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_curso_id` (`FK_curso_id`),
  ADD KEY `FK_turno_id` (`FK_turno_id`);

--
-- Índices de tabela `turnos`
--
ALTER TABLE `turnos`
  ADD PRIMARY KEY (`id`);

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `aluno`
--
ALTER TABLE `aluno`
  ADD CONSTRAINT `aluno_ibfk_1` FOREIGN KEY (`FK_turma_id`) REFERENCES `turmas` (`id`),
  ADD CONSTRAINT `aluno_ibfk_2` FOREIGN KEY (`FK_projeto_id`) REFERENCES `projetos` (`id`);

--
-- Restrições para tabelas `turmas`
--
ALTER TABLE `turmas`
  ADD CONSTRAINT `turmas_ibfk_1` FOREIGN KEY (`FK_curso_id`) REFERENCES `cursos` (`id`),
  ADD CONSTRAINT `turmas_ibfk_2` FOREIGN KEY (`FK_turno_id`) REFERENCES `turnos` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
