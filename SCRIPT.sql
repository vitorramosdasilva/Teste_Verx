Use Verx;

IF OBJECT_ID('dbo.Calendario') IS NOT NULL DROP TABLE dbo.Calendario;
Create table Calendario (
year int
)

Insert into Calendario
select  year from [dbo].[IPCA] union
select  year from [dbo].[PIB]  union
select  year  from [dbo].[taxaDesemprego];

IF OBJECT_ID('tempdb..#pib') IS NOT NULL
DROP TABLE #pib;
-- Painel pib


-- Temporárias...
select 
	year, 
	sum(cast(VALUE as float)) as value
	into #pib
from [dbo].pib
group by year;


IF OBJECT_ID('tempdb..#ipca') IS NOT NULL
DROP TABLE #ipca;

SELECT year ,
  avg(CAST(value AS FLOAT)) AS value
  into #ipca
FROM [dbo].[IPCA] 
GROUP BY
  [IPCA].[YEAR];


IF OBJECT_ID('tempdb..#taxaDesemprego') IS NOT NULL
DROP TABLE #taxaDesemprego;
Select 
	year, 
	avg(cast(VALUE as float)) as value
	into #taxaDesemprego
from [dbo].[taxaDesemprego]
group by year;



-- Paineis tableau
--ipca

Select 
	a.year, 
	b.value as soma_value_ipca_anual
	from [dbo].Calendario a

join #ipca b
On a.year = b.year
join #pib c
On a.year = c.year
join #taxaDesemprego d
On a.year = d.year;

--pib
Select 
	a.year, 
	c.value as media_value_pib_anual	
	from [dbo].Calendario a
join #ipca b
On a.year = b.year
join #pib c
On a.year = c.year
join #taxaDesemprego d
On a.year = d.year;

--desemprego...
select 
	a.year, 	
	d.value as media_desemprego_anual
	from [dbo].Calendario a
join #ipca b
On a.year = b.year
join #pib c
On a.year = c.year
join #taxaDesemprego d
On a.year = d.year;


IF OBJECT_ID('dbo.METRICAS_ANUAIS') IS NOT NULL DROP TABLE dbo.METRICAS_ANUAIS;
Select 
	a.year, 
	b.value as soma_value_ipca_anual,
	c.value as media_value_pib_anual,
	d.value as media_desemprego_anual
	into dbo.METRICAS_ANUAIS
	From [dbo].Calendario a
join #ipca b
On a.year = b.year
join #pib c
On a.year = c.year
join #taxaDesemprego d
On a.year = d.year
Order by 1;