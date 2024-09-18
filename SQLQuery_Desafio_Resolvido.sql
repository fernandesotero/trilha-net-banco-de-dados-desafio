SELECT * FROM Filmes

-- 1 - Buscar Nome e Ano dos filmes
SELECT Nome, Ano FROM Filmes

-- 2 - Buscar nome e Ano dos filmes ordenados por ordem crescente pelo ano
SELECT Nome, Ano FROM Filmes
ORDER BY Ano ASC

-- 3 - Buscar pelo filme De Volta Para o Futuro, trazendo o nome, o ano e a duração
SELECT Nome, Ano, Duracao FROM Filmes
WHERE Nome = 'De Volta para o Futuro'

-- 4 - Buscar os filmes lançados em 1997
SELECT * FROM Filmes
WHERE Ano = 1997

-- 5 - Buscar os filmes lançados APÓS o ano 2000
SELECT * FROM Filmes
WHERE Ano > 2000

-- 6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente
SELECT * FROM Filmes
WHERE Duracao > 100 AND Duracao < 150
ORDER BY Duracao ASC

-- 7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente
-- Busca conforme exemplo do READ.me do GitHub
SELECT Ano, COUNT(*) AS Quantidade
FROM Filmes
GROUP BY Ano
ORDER BY Quantidade DESC
-- Busca conforme enunciado
SELECT Ano, COUNT(*) AS Quantidade
FROM Filmes
GROUP BY Ano
ORDER BY MAX(Duracao) DESC

-- 8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome
SELECT PrimeiroNome, UltimoNome, Genero FROM Atores
WHERE Genero = 'M'

-- 9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome
SELECT PrimeiroNome, UltimoNome FROM Atores
WHERE Genero = 'F'
ORDER BY PrimeiroNome

-- 10 - Buscar o nome do filme e o gênero
SELECT * FROM Filmes
SELECT * FROM FilmesGenero
SELECT * FROM Generos

SELECT 
		f.Nome,
		g.Genero
FROM	Filmes f
JOIN	FilmesGenero fg ON f.Id = fg.IdFilme
JOIN	Generos g ON fg.IdGenero = g.Id

-- 11 - Buscar o nome do filme e o gênero do tipo "Mistério"
SELECT
		f.Nome,
		g.Genero
FROM	Filmes f
JOIN	FilmesGenero fg ON f.Id = fg.IdFilme
JOIN	Generos g ON fg.IdGenero = g.Id
WHERE	Genero = 'Mistério'
-- OU
;WITH cte AS (
SELECT 
		f.Nome,
		g.Genero
FROM	Filmes f
JOIN	FilmesGenero fg ON f.Id = fg.IdFilme
JOIN	Generos g ON fg.IdGenero = g.Id)
SELECT * FROM cte
WHERE Genero = 'Mistério'

-- 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel
SELECT * FROM Filmes
SELECT * FROM Atores
SELECT * FROM ElencoFilme

SELECT
		f.Nome,
		a.PrimeiroNome,
		a.UltimoNome,
		ef.Papel
FROM	Filmes f
JOIN	Atores a ON f.Id = a.Id
JOIN	ElencoFilme ef ON a.Id = ef.Id