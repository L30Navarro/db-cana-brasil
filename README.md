# **db-cana-brasil - Banco de Dados Relacional da produção de cana-de-açúcar no Brasil.**
## Este repositório, que foi modelado em PostgreSQL, contém a modelagem completa do banco de dados da produção de cana-de-açúcar no Brasil, utilizando dados públicos da Produção Agrícola Municipal (PAM/IBGE), abrangendo as safras de 2009 até 2022. O objetivo é centralizar, padronizar e estruturar informações de produção para análises estatísticas, exploração geográfica e consultas avançadas, observando os requisitos do sistema e as regras de negócio que orientam a modelagem desse banco de dados.

## Status do projeto
Modelo relacional consolidado, com estrutura definida
e documentação disponível.

## Consultas SQL

O projeto já conta com consultas SQL utilizando:
- JOINs entre múltiplas tabelas relacionais;
- Funções de agregação (SUM e AVG);
- Funções de janela (OVER, PARTITION BY) para análises comparativas
  entre níveis territoriais e temporais.
## Próximos passos

- Ampliar o conjunto de consultas analíticas, explorando cenários
  mais complexos com CTEs e subqueries.
- Criar views para padronizar análises recorrentes e facilitar o
  consumo dos dados.
- Refinar consultas com foco em legibilidade e desempenho.
- Avaliar índices em colunas mais utilizadas em filtros e JOINs.
