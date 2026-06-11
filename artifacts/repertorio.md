---
arquivo: repertorio.md
versao: 1.0
idioma: pt-BR
gerado_em: 2026-06-09 23:14:49
objetivo: "Repertório-base para IA construir a base de dados do Aplicativo de Controle Pessoal"
---

# repertorio.md — Repertório Base do Aplicativo de Controle Pessoal

Este arquivo serve como repertório inicial para uma IA ou script transformar conteúdo em base de dados.

Ele inclui:

- Matérias e unidades de estudo.
- Templates de estudo.
- Exercícios físicos gerais.
- Mais de 100 exercícios/treinos específicos de futebol.
- Karatê técnico/esportivo.
- Parkour seguro e progressivo.
- Vôlei.
- Corrida e resistência.
- Mobilidade e alongamento.
- Hábitos e micro-hábitos.
- Categorias financeiras.
- Templates operacionais.

> **Princípio do app:** tudo deve ser prático. O usuário precisa registrar ações em poucos segundos, usando favoritos, templates, botões rápidos e histórico reutilizável.

> **Nota de segurança:** os treinos são repertório técnico geral. A IA do app deve adaptar volume, intensidade e progressão ao nível do usuário. Em caso de dor, tontura, lesão ou desconforto forte, o treino deve ser interrompido. Para parkour e técnicas esportivas, priorizar ambiente seguro, progressão baixa e supervisão quando possível.

---

# 1. Esquema de dados recomendado

## 1.1 Item de estudo

```json
{
  "id": "EST-MAT-001",
  "tipo": "unidade_estudo",
  "materia": "Matemática",
  "titulo": "Função afim",
  "objetivo": "Entender coeficiente angular, intercepto e crescimento/decrescimento.",
  "dificuldade": "Intermediário",
  "tempo_estimado_min": 45,
  "tags": ["matematica", "funcoes", "ensino_medio"]
}
```

## 1.2 Item de exercício

```json
{
  "id": "FUT-001",
  "tipo": "exercicio",
  "categoria": "Futebol",
  "subcategoria": "Controle de bola",
  "nome": "Controle de bola em circuito",
  "objetivo": "Aprimorar domínio, coordenação e condução.",
  "habilidades": ["controle", "coordenação", "tomada de decisão"],
  "tempo_medio_min": 15,
  "nivel": "Base",
  "equipamentos": ["bola", "cones"],
  "metricas": ["acertos", "tempo", "erros"],
  "cuidados": "Aquecer antes e evitar piso escorregadio."
}
```

## 1.3 Item financeiro

```json
{
  "id": "FIN-CAT-001",
  "tipo": "categoria_financeira",
  "nome": "Alimentação",
  "natureza": "saida",
  "aceita_recorrencia": true,
  "alerta": "Avisar se passar do limite semanal."
}
```

---

# 2. Matérias e unidades de estudo



## Matemática

| ID | Unidade | Objetivo | Dificuldade | Tempo |
| --- | --- | --- | --- | --- |
| EST-001 | Conjuntos numéricos | Identificar naturais, inteiros, racionais, irracionais e reais. | Base | 35 min |
| EST-002 | Operações com frações | Somar, subtrair, multiplicar e dividir frações em problemas. | Base | 35 min |
| EST-003 | Razão e proporção | Resolver situações com comparação entre grandezas. | Base | 40 min |
| EST-004 | Regra de três simples | Modelar relações proporcionais diretas e inversas. | Base | 35 min |
| EST-005 | Porcentagem | Calcular descontos, acréscimos, juros simples e variações percentuais. | Base | 40 min |
| EST-006 | Equações do 1º grau | Resolver equações lineares e problemas práticos. | Base | 35 min |
| EST-007 | Sistemas lineares | Resolver sistemas por substituição, adição e interpretação gráfica. | Intermediário | 45 min |
| EST-008 | Função afim | Entender coeficiente angular, intercepto e crescimento/decrescimento. | Intermediário | 45 min |
| EST-009 | Função quadrática | Analisar raízes, vértice, concavidade e aplicações. | Intermediário | 50 min |
| EST-010 | Progressão aritmética | Identificar termo geral, soma e padrões lineares. | Intermediário | 40 min |
| EST-011 | Progressão geométrica | Identificar crescimento exponencial e soma de termos. | Intermediário | 45 min |
| EST-012 | Trigonometria no triângulo retângulo | Aplicar seno, cosseno e tangente. | Intermediário | 45 min |
| EST-013 | Geometria plana | Calcular áreas, perímetros e relações em figuras. | Base | 45 min |
| EST-014 | Geometria espacial | Calcular volume e área de prismas, cilindros, cones e esferas. | Intermediário | 50 min |
| EST-015 | Análise combinatória | Contar arranjos, permutações e combinações. | Avançado | 50 min |
| EST-016 | Probabilidade | Calcular chances simples, compostas e condicionais básicas. | Intermediário | 45 min |
| EST-017 | Estatística | Interpretar média, mediana, moda, variância e gráficos. | Base | 40 min |
| EST-018 | Matemática financeira | Entender juros simples, compostos, orçamento e comparação de compras. | Intermediário | 45 min |



## Português

| ID | Unidade | Objetivo | Dificuldade | Tempo |
| --- | --- | --- | --- | --- |
| EST-019 | Interpretação de texto | Identificar ideia principal, inferências e intenção do autor. | Base | 40 min |
| EST-020 | Tipos e gêneros textuais | Diferenciar notícia, crônica, artigo, resenha, conto e dissertação. | Base | 40 min |
| EST-021 | Coesão e coerência | Usar conectivos e manter progressão lógica do texto. | Intermediário | 40 min |
| EST-022 | Pontuação | Aplicar vírgula, ponto e vírgula, dois-pontos e travessão. | Base | 35 min |
| EST-023 | Classes gramaticais | Reconhecer substantivo, verbo, adjetivo, advérbio, pronome e preposição. | Base | 45 min |
| EST-024 | Verbos | Estudar tempos, modos, conjugação e valor semântico. | Intermediário | 45 min |
| EST-025 | Concordância verbal | Aplicar regras em sujeito simples, composto e casos especiais. | Intermediário | 40 min |
| EST-026 | Concordância nominal | Relacionar substantivos, adjetivos, artigos e pronomes. | Intermediário | 40 min |
| EST-027 | Regência | Estudar relação entre verbos/nomes e complementos. | Avançado | 45 min |
| EST-028 | Crase | Identificar uso obrigatório, proibido e facultativo. | Intermediário | 40 min |
| EST-029 | Figuras de linguagem | Reconhecer metáfora, metonímia, hipérbole, ironia e antítese. | Base | 35 min |
| EST-030 | Literatura brasileira | Estudar escolas literárias e contexto histórico. | Intermediário | 50 min |
| EST-031 | Redação dissertativa | Construir tese, argumentos, repertório e proposta de intervenção. | Intermediário | 60 min |
| EST-032 | Reescrita textual | Melhorar clareza, concisão e formalidade. | Intermediário | 45 min |



## História

| ID | Unidade | Objetivo | Dificuldade | Tempo |
| --- | --- | --- | --- | --- |
| EST-033 | Pré-História | Entender nomadismo, sedentarização e primeiras sociedades. | Base | 40 min |
| EST-034 | Civilizações antigas | Estudar Egito, Mesopotâmia, Grécia e Roma. | Base | 50 min |
| EST-035 | Idade Média | Compreender feudalismo, Igreja, cruzadas e cidades medievais. | Intermediário | 45 min |
| EST-036 | Renascimento | Relacionar humanismo, ciência e artes. | Intermediário | 40 min |
| EST-037 | Reforma Protestante | Entender causas religiosas, políticas e sociais. | Intermediário | 45 min |
| EST-038 | Expansão marítima | Analisar navegações, comércio e colonização. | Intermediário | 45 min |
| EST-039 | Brasil Colônia | Estudar economia açucareira, mineração, escravidão e sociedade. | Intermediário | 50 min |
| EST-040 | Revoluções Inglesas e Iluminismo | Relacionar ideias políticas modernas. | Avançado | 45 min |
| EST-041 | Revolução Francesa | Entender crise do Antigo Regime e impactos políticos. | Intermediário | 50 min |
| EST-042 | Revolução Industrial | Analisar trabalho, urbanização e capitalismo industrial. | Intermediário | 50 min |
| EST-043 | Independência do Brasil | Compreender processo político e permanências sociais. | Intermediário | 40 min |
| EST-044 | Brasil Império | Estudar Primeiro Reinado, Regências e Segundo Reinado. | Intermediário | 50 min |
| EST-045 | República Velha | Analisar coronelismo, café com leite e movimentos sociais. | Intermediário | 45 min |
| EST-046 | Era Vargas | Estudar trabalhismo, industrialização e autoritarismo. | Intermediário | 45 min |
| EST-047 | Ditadura Militar no Brasil | Compreender contexto, repressão, economia e redemocratização. | Avançado | 50 min |
| EST-048 | Guerras Mundiais | Estudar causas, alianças, consequências e nova ordem mundial. | Intermediário | 55 min |
| EST-049 | Guerra Fria | Entender bipolaridade, capitalismo, socialismo e conflitos indiretos. | Intermediário | 50 min |



## Geografia

| ID | Unidade | Objetivo | Dificuldade | Tempo |
| --- | --- | --- | --- | --- |
| EST-050 | Cartografia | Ler mapas, escalas, coordenadas e projeções. | Base | 40 min |
| EST-051 | Relevo e estrutura geológica | Entender formação do relevo e agentes internos/externos. | Intermediário | 45 min |
| EST-052 | Clima e tempo | Diferenciar clima, tempo, massas de ar e fenômenos climáticos. | Base | 40 min |
| EST-053 | Biomas brasileiros | Identificar características, localização e impactos ambientais. | Base | 45 min |
| EST-054 | Hidrografia | Entender bacias, rios, uso da água e conflitos. | Intermediário | 40 min |
| EST-055 | Urbanização | Analisar crescimento urbano, metrópoles e problemas sociais. | Intermediário | 45 min |
| EST-056 | População | Estudar demografia, pirâmide etária e migrações. | Intermediário | 45 min |
| EST-057 | Globalização | Analisar fluxos de capital, mercadorias, pessoas e informações. | Intermediário | 45 min |
| EST-058 | Capitalismo x Socialismo | Comparar sistemas econômicos, históricos e políticos. | Intermediário | 45 min |
| EST-059 | Industrialização | Entender modelos industriais e divisão internacional do trabalho. | Intermediário | 45 min |
| EST-060 | Agricultura | Analisar agropecuária, agronegócio, agricultura familiar e impactos. | Intermediário | 45 min |
| EST-061 | Geopolítica mundial | Estudar poder, conflitos, blocos econômicos e organizações. | Avançado | 55 min |
| EST-062 | Meio ambiente | Entender sustentabilidade, poluição, mudanças climáticas e preservação. | Intermediário | 45 min |



## Biologia

| ID | Unidade | Objetivo | Dificuldade | Tempo |
| --- | --- | --- | --- | --- |
| EST-063 | Citologia | Estudar organelas, membrana plasmática e funções celulares. | Base | 45 min |
| EST-064 | Bioquímica celular | Compreender água, sais, carboidratos, lipídios, proteínas e ácidos nucleicos. | Intermediário | 50 min |
| EST-065 | Metabolismo energético | Entender respiração celular, fermentação e fotossíntese. | Intermediário | 55 min |
| EST-066 | Genética mendeliana | Resolver cruzamentos, dominância e heredogramas simples. | Intermediário | 50 min |
| EST-067 | DNA e síntese proteica | Estudar replicação, transcrição, tradução e mutações. | Intermediário | 50 min |
| EST-068 | Evolução | Compreender seleção natural, adaptação e especiação. | Intermediário | 45 min |
| EST-069 | Ecologia | Estudar cadeias alimentares, ciclos biogeoquímicos e relações ecológicas. | Base | 45 min |
| EST-070 | Fisiologia humana | Entender sistemas digestório, respiratório, circulatório e nervoso. | Intermediário | 60 min |
| EST-071 | Imunologia básica | Conhecer defesa do organismo, vacinas e imunidade. | Intermediário | 45 min |
| EST-072 | Botânica | Estudar tecidos, reprodução e fisiologia vegetal. | Intermediário | 50 min |



## Física

| ID | Unidade | Objetivo | Dificuldade | Tempo |
| --- | --- | --- | --- | --- |
| EST-073 | Cinemática | Descrever movimento, velocidade, aceleração e gráficos. | Base | 45 min |
| EST-074 | Dinâmica | Aplicar leis de Newton e forças. | Intermediário | 50 min |
| EST-075 | Trabalho e energia | Relacionar força, deslocamento, energia cinética e potencial. | Intermediário | 45 min |
| EST-076 | Quantidade de movimento | Estudar impulso, colisões e conservação. | Intermediário | 45 min |
| EST-077 | Gravitação | Entender força gravitacional, órbitas e campo gravitacional. | Avançado | 45 min |
| EST-078 | Hidrostática | Estudar pressão, densidade, empuxo e princípio de Arquimedes. | Intermediário | 45 min |
| EST-079 | Termologia | Entender temperatura, calor, dilatação e mudanças de fase. | Base | 45 min |
| EST-080 | Termodinâmica | Estudar máquinas térmicas, leis e rendimento. | Avançado | 50 min |
| EST-081 | Ondulatória | Compreender frequência, período, velocidade e fenômenos ondulatórios. | Intermediário | 45 min |
| EST-082 | Óptica | Estudar reflexão, refração, espelhos e lentes. | Intermediário | 50 min |
| EST-083 | Eletrostática | Entender carga, campo, potencial e força elétrica. | Intermediário | 50 min |
| EST-084 | Eletrodinâmica | Aplicar corrente, tensão, resistência e potência elétrica. | Intermediário | 50 min |



## Química

| ID | Unidade | Objetivo | Dificuldade | Tempo |
| --- | --- | --- | --- | --- |
| EST-085 | Estrutura atômica | Estudar prótons, nêutrons, elétrons e modelos atômicos. | Base | 40 min |
| EST-086 | Tabela periódica | Entender famílias, períodos e propriedades periódicas. | Base | 45 min |
| EST-087 | Ligações químicas | Diferenciar ligações iônicas, covalentes e metálicas. | Intermediário | 45 min |
| EST-088 | Funções inorgânicas | Identificar ácidos, bases, sais e óxidos. | Intermediário | 50 min |
| EST-089 | Reações químicas | Balancear equações e classificar reações. | Intermediário | 45 min |
| EST-090 | Estequiometria | Relacionar mol, massa, volume e rendimento. | Avançado | 55 min |
| EST-091 | Soluções | Estudar concentração, diluição e mistura. | Intermediário | 50 min |
| EST-092 | Termoquímica | Entender entalpia, reações exotérmicas e endotérmicas. | Intermediário | 45 min |
| EST-093 | Cinética química | Analisar velocidade de reação e fatores que influenciam. | Intermediário | 45 min |
| EST-094 | Equilíbrio químico | Estudar constantes, deslocamento e Le Chatelier. | Avançado | 55 min |
| EST-095 | Química orgânica | Identificar cadeias, funções orgânicas e nomenclatura. | Intermediário | 60 min |



## Inglês

| ID | Unidade | Objetivo | Dificuldade | Tempo |
| --- | --- | --- | --- | --- |
| EST-096 | Vocabulário essencial | Construir repertório de palavras do dia a dia. | Base | 30 min |
| EST-097 | Verbo to be | Usar afirmação, negação e pergunta. | Base | 30 min |
| EST-098 | Simple present | Falar sobre rotina, hábitos e fatos. | Base | 35 min |
| EST-099 | Present continuous | Descrever ações em andamento. | Base | 35 min |
| EST-100 | Simple past | Narrar eventos passados. | Intermediário | 40 min |
| EST-101 | Future forms | Usar will, going to e presente contínuo com futuro. | Intermediário | 40 min |
| EST-102 | Modal verbs | Usar can, could, should, must e might. | Intermediário | 40 min |
| EST-103 | Reading comprehension | Interpretar textos curtos e identificar ideia principal. | Intermediário | 45 min |
| EST-104 | Listening practice | Treinar compreensão auditiva com trechos curtos. | Intermediário | 30 min |
| EST-105 | Phrasal verbs básicos | Aprender expressões comuns com get, take, look, put. | Avançado | 45 min |



## Programação

| ID | Unidade | Objetivo | Dificuldade | Tempo |
| --- | --- | --- | --- | --- |
| EST-106 | Lógica de programação | Entender sequência, condição, repetição e decomposição. | Base | 45 min |
| EST-107 | Variáveis e tipos | Usar strings, números, booleanos, arrays e objetos. | Base | 40 min |
| EST-108 | Condicionais | Aplicar if, else, switch e operadores lógicos. | Base | 40 min |
| EST-109 | Laços de repetição | Usar for, while e iteração sobre listas. | Base | 45 min |
| EST-110 | Funções | Criar funções reutilizáveis com parâmetros e retorno. | Base | 45 min |
| EST-111 | Estruturas de dados | Manipular listas, filas, pilhas, mapas e conjuntos. | Intermediário | 55 min |
| EST-112 | APIs REST | Entender requisições, respostas, JSON e métodos HTTP. | Intermediário | 50 min |
| EST-113 | Banco de dados | Modelar tabelas, relacionamentos e consultas básicas. | Intermediário | 55 min |
| EST-114 | Autenticação | Entender login, tokens, sessões e permissões. | Avançado | 55 min |
| EST-115 | Arquitetura de app | Organizar módulos, camadas, estados e persistência. | Avançado | 60 min |
| EST-116 | Testes | Criar testes unitários e validar regras de negócio. | Intermediário | 50 min |



# 3. Templates de estudo e operação


| ID | Nome | Área | Descrição |
| --- | --- | --- | --- |
| TPL-EST-001 | Sessão Pomodoro 25/5 | Estudo | 25 min foco + 5 min pausa; repetir 2-4 ciclos. |
| TPL-EST-002 | Revisão ativa | Estudo | Tentar lembrar sem olhar, conferir, corrigir e resumir. |
| TPL-EST-003 | Revisão espaçada | Estudo | Revisar após 1 dia, 3 dias, 7 dias e 14 dias. |
| TPL-TRE-001 | Treino 15 minutos | Treino | Aquecimento 3 min, bloco principal 10 min, volta à calma 2 min. |
| TPL-TRE-002 | Treino 45 minutos | Treino | Aquecimento 8 min, técnica 15 min, físico 15 min, mobilidade 7 min. |
| TPL-FIN-001 | Fechamento diário | Finanças | Registrar entradas/saídas, revisar saldo e marcar gasto impulsivo. |
| TPL-FIN-002 | Fechamento mensal | Finanças | Somar entradas, saídas, fixos, variáveis, sobra e meta de guardar. |


---

# 4. Repertório de futebol

Esta seção contém **130 exercícios/treinos de futebol**, com foco em controle, passe, condução, drible, finalização, tomada de decisão, transição, defesa, goleiro, bola parada, resistência e agilidade.

## 4.1 Tabela-resumo dos treinos de futebol


| ID | Nome | Categoria | Nível | Tempo | Aprimora |
| --- | --- | --- | --- | --- | --- |
| FUT-001 | Controle de bola: circuito em cones | Controle de bola | Iniciante | 11 min | controle, domínio, coordenação, confiança técnica |
| FUT-002 | Passe curto: duelo cronometrado | Passe curto | Base | 14 min | precisão, comunicação, tempo de passe, apoio |
| FUT-003 | Passe longo: jogo reduzido | Passe longo | Intermediário | 17 min | força controlada, visão de jogo, mudança de corredor |
| FUT-004 | Primeiro toque: rondo progressivo | Primeiro toque | Intermediário | 20 min | orientação corporal, domínio direcionado, velocidade de decisão |
| FUT-005 | Drible: sequência técnica | Drible | Avançado | 23 min | finta, mudança de direção, criatividade, controle sob pressão |
| FUT-006 | Condução: desafio por pontos | Condução | Iniciante | 26 min | toques curtos, aceleração, proteção da bola |
| FUT-007 | Finalização: ondas de ataque | Finalização | Base | 29 min | chute, ajuste corporal, escolha de canto, precisão |
| FUT-008 | Cruzamento: corrida com bola | Cruzamento | Intermediário | 30 min | bola lateral, timing, alvo, qualidade do passe |
| FUT-009 | Cabeceio: estação individual | Cabeceio | Intermediário | 8 min | impulsão, coordenação, ataque à bola, direcionamento |
| FUT-010 | Rondo: parede/rebote | Rondo | Avançado | 11 min | posse, tomada de decisão, pressão, linhas de passe |
| FUT-011 | Marcação: alvo marcado | Marcação | Iniciante | 14 min | posicionamento, distância de combate, leitura defensiva |
| FUT-012 | Transição ofensiva: zona de decisão | Transição ofensiva | Base | 17 min | velocidade, ataque ao espaço, decisão rápida |
| FUT-013 | Transição defensiva: circuito em cones | Transição defensiva | Intermediário | 20 min | reação pós-perda, recomposição, pressão imediata |
| FUT-014 | 1 contra 1: duelo cronometrado | 1 contra 1 | Intermediário | 23 min | duelo, coragem, proteção, leitura do adversário |
| FUT-015 | 2 contra 1: jogo reduzido | 2 contra 1 | Avançado | 26 min | vantagem numérica, passe final, temporização |
| FUT-016 | 3 contra 2: rondo progressivo | 3 contra 2 | Iniciante | 29 min | superioridade, ocupação de espaço, tomada de decisão |
| FUT-017 | Posicionamento: sequência técnica | Posicionamento | Base | 30 min | escaneamento, linhas, cobertura, amplitude |
| FUT-018 | Resistência com bola: desafio por pontos | Resistência com bola | Intermediário | 8 min | capacidade aeróbica, repetição técnica, ritmo |
| FUT-019 | Agilidade: ondas de ataque | Agilidade | Intermediário | 11 min | mudança de direção, freio, aceleração, equilíbrio |
| FUT-020 | Velocidade: corrida com bola | Velocidade | Avançado | 14 min | arranque, reação, sprint curto, mecânica |
| FUT-021 | Goleiro: estação individual | Goleiro | Iniciante | 17 min | base, reflexo, queda, reposição, leitura |
| FUT-022 | Bola parada: parede/rebote | Bola parada | Base | 20 min | cobrança, marcação, posicionamento, leitura de trajetória |
| FUT-023 | Futsal aplicado: alvo marcado | Futsal aplicado | Intermediário | 23 min | espaço curto, giro, domínio, decisões rápidas |
| FUT-024 | Controle de bola: zona de decisão | Controle de bola | Intermediário | 26 min | controle, domínio, coordenação, confiança técnica |
| FUT-025 | Passe curto: circuito em cones | Passe curto | Avançado | 29 min | precisão, comunicação, tempo de passe, apoio |
| FUT-026 | Passe longo: duelo cronometrado | Passe longo | Iniciante | 30 min | força controlada, visão de jogo, mudança de corredor |
| FUT-027 | Primeiro toque: jogo reduzido | Primeiro toque | Base | 8 min | orientação corporal, domínio direcionado, velocidade de decisão |
| FUT-028 | Drible: rondo progressivo | Drible | Intermediário | 11 min | finta, mudança de direção, criatividade, controle sob pressão |
| FUT-029 | Condução: sequência técnica | Condução | Intermediário | 14 min | toques curtos, aceleração, proteção da bola |
| FUT-030 | Finalização: desafio por pontos | Finalização | Avançado | 17 min | chute, ajuste corporal, escolha de canto, precisão |
| FUT-031 | Cruzamento: ondas de ataque | Cruzamento | Iniciante | 20 min | bola lateral, timing, alvo, qualidade do passe |
| FUT-032 | Cabeceio: corrida com bola | Cabeceio | Base | 23 min | impulsão, coordenação, ataque à bola, direcionamento |
| FUT-033 | Rondo: estação individual | Rondo | Intermediário | 26 min | posse, tomada de decisão, pressão, linhas de passe |
| FUT-034 | Marcação: parede/rebote | Marcação | Intermediário | 29 min | posicionamento, distância de combate, leitura defensiva |
| FUT-035 | Transição ofensiva: alvo marcado | Transição ofensiva | Avançado | 30 min | velocidade, ataque ao espaço, decisão rápida |
| FUT-036 | Transição defensiva: zona de decisão | Transição defensiva | Iniciante | 8 min | reação pós-perda, recomposição, pressão imediata |
| FUT-037 | 1 contra 1: circuito em cones | 1 contra 1 | Base | 11 min | duelo, coragem, proteção, leitura do adversário |
| FUT-038 | 2 contra 1: duelo cronometrado | 2 contra 1 | Intermediário | 14 min | vantagem numérica, passe final, temporização |
| FUT-039 | 3 contra 2: jogo reduzido | 3 contra 2 | Intermediário | 17 min | superioridade, ocupação de espaço, tomada de decisão |
| FUT-040 | Posicionamento: rondo progressivo | Posicionamento | Avançado | 20 min | escaneamento, linhas, cobertura, amplitude |
| FUT-041 | Resistência com bola: sequência técnica | Resistência com bola | Iniciante | 23 min | capacidade aeróbica, repetição técnica, ritmo |
| FUT-042 | Agilidade: desafio por pontos | Agilidade | Base | 26 min | mudança de direção, freio, aceleração, equilíbrio |
| FUT-043 | Velocidade: ondas de ataque | Velocidade | Intermediário | 29 min | arranque, reação, sprint curto, mecânica |
| FUT-044 | Goleiro: corrida com bola | Goleiro | Intermediário | 30 min | base, reflexo, queda, reposição, leitura |
| FUT-045 | Bola parada: estação individual | Bola parada | Avançado | 8 min | cobrança, marcação, posicionamento, leitura de trajetória |
| FUT-046 | Futsal aplicado: parede/rebote | Futsal aplicado | Iniciante | 11 min | espaço curto, giro, domínio, decisões rápidas |
| FUT-047 | Controle de bola: alvo marcado | Controle de bola | Base | 14 min | controle, domínio, coordenação, confiança técnica |
| FUT-048 | Passe curto: zona de decisão | Passe curto | Intermediário | 17 min | precisão, comunicação, tempo de passe, apoio |
| FUT-049 | Passe longo: circuito em cones | Passe longo | Intermediário | 20 min | força controlada, visão de jogo, mudança de corredor |
| FUT-050 | Primeiro toque: duelo cronometrado | Primeiro toque | Avançado | 23 min | orientação corporal, domínio direcionado, velocidade de decisão |
| FUT-051 | Drible: jogo reduzido | Drible | Iniciante | 26 min | finta, mudança de direção, criatividade, controle sob pressão |
| FUT-052 | Condução: rondo progressivo | Condução | Base | 29 min | toques curtos, aceleração, proteção da bola |
| FUT-053 | Finalização: sequência técnica | Finalização | Intermediário | 30 min | chute, ajuste corporal, escolha de canto, precisão |
| FUT-054 | Cruzamento: desafio por pontos | Cruzamento | Intermediário | 8 min | bola lateral, timing, alvo, qualidade do passe |
| FUT-055 | Cabeceio: ondas de ataque | Cabeceio | Avançado | 11 min | impulsão, coordenação, ataque à bola, direcionamento |
| FUT-056 | Rondo: corrida com bola | Rondo | Iniciante | 14 min | posse, tomada de decisão, pressão, linhas de passe |
| FUT-057 | Marcação: estação individual | Marcação | Base | 17 min | posicionamento, distância de combate, leitura defensiva |
| FUT-058 | Transição ofensiva: parede/rebote | Transição ofensiva | Intermediário | 20 min | velocidade, ataque ao espaço, decisão rápida |
| FUT-059 | Transição defensiva: alvo marcado | Transição defensiva | Intermediário | 23 min | reação pós-perda, recomposição, pressão imediata |
| FUT-060 | 1 contra 1: zona de decisão | 1 contra 1 | Avançado | 26 min | duelo, coragem, proteção, leitura do adversário |
| FUT-061 | 2 contra 1: circuito em cones | 2 contra 1 | Iniciante | 29 min | vantagem numérica, passe final, temporização |
| FUT-062 | 3 contra 2: duelo cronometrado | 3 contra 2 | Base | 30 min | superioridade, ocupação de espaço, tomada de decisão |
| FUT-063 | Posicionamento: jogo reduzido | Posicionamento | Intermediário | 8 min | escaneamento, linhas, cobertura, amplitude |
| FUT-064 | Resistência com bola: rondo progressivo | Resistência com bola | Intermediário | 11 min | capacidade aeróbica, repetição técnica, ritmo |
| FUT-065 | Agilidade: sequência técnica | Agilidade | Avançado | 14 min | mudança de direção, freio, aceleração, equilíbrio |
| FUT-066 | Velocidade: desafio por pontos | Velocidade | Iniciante | 17 min | arranque, reação, sprint curto, mecânica |
| FUT-067 | Goleiro: ondas de ataque | Goleiro | Base | 20 min | base, reflexo, queda, reposição, leitura |
| FUT-068 | Bola parada: corrida com bola | Bola parada | Intermediário | 23 min | cobrança, marcação, posicionamento, leitura de trajetória |
| FUT-069 | Futsal aplicado: estação individual | Futsal aplicado | Intermediário | 26 min | espaço curto, giro, domínio, decisões rápidas |
| FUT-070 | Controle de bola: parede/rebote | Controle de bola | Avançado | 29 min | controle, domínio, coordenação, confiança técnica |
| FUT-071 | Passe curto: alvo marcado | Passe curto | Iniciante | 30 min | precisão, comunicação, tempo de passe, apoio |
| FUT-072 | Passe longo: zona de decisão | Passe longo | Base | 8 min | força controlada, visão de jogo, mudança de corredor |
| FUT-073 | Primeiro toque: circuito em cones | Primeiro toque | Intermediário | 11 min | orientação corporal, domínio direcionado, velocidade de decisão |
| FUT-074 | Drible: duelo cronometrado | Drible | Intermediário | 14 min | finta, mudança de direção, criatividade, controle sob pressão |
| FUT-075 | Condução: jogo reduzido | Condução | Avançado | 17 min | toques curtos, aceleração, proteção da bola |
| FUT-076 | Finalização: rondo progressivo | Finalização | Iniciante | 20 min | chute, ajuste corporal, escolha de canto, precisão |
| FUT-077 | Cruzamento: sequência técnica | Cruzamento | Base | 23 min | bola lateral, timing, alvo, qualidade do passe |
| FUT-078 | Cabeceio: desafio por pontos | Cabeceio | Intermediário | 26 min | impulsão, coordenação, ataque à bola, direcionamento |
| FUT-079 | Rondo: ondas de ataque | Rondo | Intermediário | 29 min | posse, tomada de decisão, pressão, linhas de passe |
| FUT-080 | Marcação: corrida com bola | Marcação | Avançado | 30 min | posicionamento, distância de combate, leitura defensiva |
| FUT-081 | Transição ofensiva: estação individual | Transição ofensiva | Iniciante | 8 min | velocidade, ataque ao espaço, decisão rápida |
| FUT-082 | Transição defensiva: parede/rebote | Transição defensiva | Base | 11 min | reação pós-perda, recomposição, pressão imediata |
| FUT-083 | 1 contra 1: alvo marcado | 1 contra 1 | Intermediário | 14 min | duelo, coragem, proteção, leitura do adversário |
| FUT-084 | 2 contra 1: zona de decisão | 2 contra 1 | Intermediário | 17 min | vantagem numérica, passe final, temporização |
| FUT-085 | 3 contra 2: circuito em cones | 3 contra 2 | Avançado | 20 min | superioridade, ocupação de espaço, tomada de decisão |
| FUT-086 | Posicionamento: duelo cronometrado | Posicionamento | Iniciante | 23 min | escaneamento, linhas, cobertura, amplitude |
| FUT-087 | Resistência com bola: jogo reduzido | Resistência com bola | Base | 26 min | capacidade aeróbica, repetição técnica, ritmo |
| FUT-088 | Agilidade: rondo progressivo | Agilidade | Intermediário | 29 min | mudança de direção, freio, aceleração, equilíbrio |
| FUT-089 | Velocidade: sequência técnica | Velocidade | Intermediário | 30 min | arranque, reação, sprint curto, mecânica |
| FUT-090 | Goleiro: desafio por pontos | Goleiro | Avançado | 8 min | base, reflexo, queda, reposição, leitura |
| FUT-091 | Bola parada: ondas de ataque | Bola parada | Iniciante | 11 min | cobrança, marcação, posicionamento, leitura de trajetória |
| FUT-092 | Futsal aplicado: corrida com bola | Futsal aplicado | Base | 14 min | espaço curto, giro, domínio, decisões rápidas |
| FUT-093 | Controle de bola: estação individual | Controle de bola | Intermediário | 17 min | controle, domínio, coordenação, confiança técnica |
| FUT-094 | Passe curto: parede/rebote | Passe curto | Intermediário | 20 min | precisão, comunicação, tempo de passe, apoio |
| FUT-095 | Passe longo: alvo marcado | Passe longo | Avançado | 23 min | força controlada, visão de jogo, mudança de corredor |
| FUT-096 | Primeiro toque: zona de decisão | Primeiro toque | Iniciante | 26 min | orientação corporal, domínio direcionado, velocidade de decisão |
| FUT-097 | Drible: circuito em cones | Drible | Base | 29 min | finta, mudança de direção, criatividade, controle sob pressão |
| FUT-098 | Condução: duelo cronometrado | Condução | Intermediário | 30 min | toques curtos, aceleração, proteção da bola |
| FUT-099 | Finalização: jogo reduzido | Finalização | Intermediário | 8 min | chute, ajuste corporal, escolha de canto, precisão |
| FUT-100 | Cruzamento: rondo progressivo | Cruzamento | Avançado | 11 min | bola lateral, timing, alvo, qualidade do passe |
| FUT-101 | Cabeceio: sequência técnica | Cabeceio | Iniciante | 14 min | impulsão, coordenação, ataque à bola, direcionamento |
| FUT-102 | Rondo: desafio por pontos | Rondo | Base | 17 min | posse, tomada de decisão, pressão, linhas de passe |
| FUT-103 | Marcação: ondas de ataque | Marcação | Intermediário | 20 min | posicionamento, distância de combate, leitura defensiva |
| FUT-104 | Transição ofensiva: corrida com bola | Transição ofensiva | Intermediário | 23 min | velocidade, ataque ao espaço, decisão rápida |
| FUT-105 | Transição defensiva: estação individual | Transição defensiva | Avançado | 26 min | reação pós-perda, recomposição, pressão imediata |
| FUT-106 | 1 contra 1: parede/rebote | 1 contra 1 | Iniciante | 29 min | duelo, coragem, proteção, leitura do adversário |
| FUT-107 | 2 contra 1: alvo marcado | 2 contra 1 | Base | 30 min | vantagem numérica, passe final, temporização |
| FUT-108 | 3 contra 2: zona de decisão | 3 contra 2 | Intermediário | 8 min | superioridade, ocupação de espaço, tomada de decisão |
| FUT-109 | Posicionamento: circuito em cones | Posicionamento | Intermediário | 11 min | escaneamento, linhas, cobertura, amplitude |
| FUT-110 | Resistência com bola: duelo cronometrado | Resistência com bola | Avançado | 14 min | capacidade aeróbica, repetição técnica, ritmo |
| FUT-111 | Agilidade: jogo reduzido | Agilidade | Iniciante | 17 min | mudança de direção, freio, aceleração, equilíbrio |
| FUT-112 | Velocidade: rondo progressivo | Velocidade | Base | 20 min | arranque, reação, sprint curto, mecânica |
| FUT-113 | Goleiro: sequência técnica | Goleiro | Intermediário | 23 min | base, reflexo, queda, reposição, leitura |
| FUT-114 | Bola parada: desafio por pontos | Bola parada | Intermediário | 26 min | cobrança, marcação, posicionamento, leitura de trajetória |
| FUT-115 | Futsal aplicado: ondas de ataque | Futsal aplicado | Avançado | 29 min | espaço curto, giro, domínio, decisões rápidas |
| FUT-116 | Controle de bola: corrida com bola | Controle de bola | Iniciante | 30 min | controle, domínio, coordenação, confiança técnica |
| FUT-117 | Passe curto: estação individual | Passe curto | Base | 8 min | precisão, comunicação, tempo de passe, apoio |
| FUT-118 | Passe longo: parede/rebote | Passe longo | Intermediário | 11 min | força controlada, visão de jogo, mudança de corredor |
| FUT-119 | Primeiro toque: alvo marcado | Primeiro toque | Intermediário | 14 min | orientação corporal, domínio direcionado, velocidade de decisão |
| FUT-120 | Drible: zona de decisão | Drible | Avançado | 17 min | finta, mudança de direção, criatividade, controle sob pressão |
| FUT-121 | Condução: circuito em cones | Condução | Iniciante | 20 min | toques curtos, aceleração, proteção da bola |
| FUT-122 | Finalização: duelo cronometrado | Finalização | Base | 23 min | chute, ajuste corporal, escolha de canto, precisão |
| FUT-123 | Cruzamento: jogo reduzido | Cruzamento | Intermediário | 26 min | bola lateral, timing, alvo, qualidade do passe |
| FUT-124 | Cabeceio: rondo progressivo | Cabeceio | Intermediário | 29 min | impulsão, coordenação, ataque à bola, direcionamento |
| FUT-125 | Rondo: sequência técnica | Rondo | Avançado | 30 min | posse, tomada de decisão, pressão, linhas de passe |
| FUT-126 | Marcação: desafio por pontos | Marcação | Iniciante | 8 min | posicionamento, distância de combate, leitura defensiva |
| FUT-127 | Transição ofensiva: ondas de ataque | Transição ofensiva | Base | 11 min | velocidade, ataque ao espaço, decisão rápida |
| FUT-128 | Transição defensiva: corrida com bola | Transição defensiva | Intermediário | 14 min | reação pós-perda, recomposição, pressão imediata |
| FUT-129 | 1 contra 1: estação individual | 1 contra 1 | Intermediário | 17 min | duelo, coragem, proteção, leitura do adversário |
| FUT-130 | 2 contra 1: parede/rebote | 2 contra 1 | Avançado | 20 min | vantagem numérica, passe final, temporização |

## 4.2 Detalhamento dos treinos de futebol


### FUT-001 — Controle de bola: circuito em cones

- **Categoria:** Controle de bola
- **Nível:** Iniciante
- **Tempo médio:** 11 min
- **Aprimora:** controle, domínio, coordenação, confiança técnica
- **Objetivo:** Aprimorar controle, domínio, coordenação, confiança técnica em contexto de circuito em cones.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em controle de bola. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-001",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Controle de bola",
  "nome": "FUT-001 — Controle de bola: circuito em cones",
  "nivel": "Iniciante",
  "tempo_medio_min": 11,
  "habilidades": "controle, domínio, coordenação, confiança técnica"
}
```


### FUT-002 — Passe curto: duelo cronometrado

- **Categoria:** Passe curto
- **Nível:** Base
- **Tempo médio:** 14 min
- **Aprimora:** precisão, comunicação, tempo de passe, apoio
- **Objetivo:** Aprimorar precisão, comunicação, tempo de passe, apoio em contexto de duelo cronometrado.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em passe curto. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-002",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Passe curto",
  "nome": "FUT-002 — Passe curto: duelo cronometrado",
  "nivel": "Base",
  "tempo_medio_min": 14,
  "habilidades": "precisão, comunicação, tempo de passe, apoio"
}
```


### FUT-003 — Passe longo: jogo reduzido

- **Categoria:** Passe longo
- **Nível:** Intermediário
- **Tempo médio:** 17 min
- **Aprimora:** força controlada, visão de jogo, mudança de corredor
- **Objetivo:** Aprimorar força controlada, visão de jogo, mudança de corredor em contexto de jogo reduzido.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em passe longo. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-003",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Passe longo",
  "nome": "FUT-003 — Passe longo: jogo reduzido",
  "nivel": "Intermediário",
  "tempo_medio_min": 17,
  "habilidades": "força controlada, visão de jogo, mudança de corredor"
}
```


### FUT-004 — Primeiro toque: rondo progressivo

- **Categoria:** Primeiro toque
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Aprimora:** orientação corporal, domínio direcionado, velocidade de decisão
- **Objetivo:** Aprimorar orientação corporal, domínio direcionado, velocidade de decisão em contexto de rondo progressivo.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em primeiro toque. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-004",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Primeiro toque",
  "nome": "FUT-004 — Primeiro toque: rondo progressivo",
  "nivel": "Intermediário",
  "tempo_medio_min": 20,
  "habilidades": "orientação corporal, domínio direcionado, velocidade de decisão"
}
```


### FUT-005 — Drible: sequência técnica

- **Categoria:** Drible
- **Nível:** Avançado
- **Tempo médio:** 23 min
- **Aprimora:** finta, mudança de direção, criatividade, controle sob pressão
- **Objetivo:** Aprimorar finta, mudança de direção, criatividade, controle sob pressão em contexto de sequência técnica.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em drible. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-005",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Drible",
  "nome": "FUT-005 — Drible: sequência técnica",
  "nivel": "Avançado",
  "tempo_medio_min": 23,
  "habilidades": "finta, mudança de direção, criatividade, controle sob pressão"
}
```


### FUT-006 — Condução: desafio por pontos

- **Categoria:** Condução
- **Nível:** Iniciante
- **Tempo médio:** 26 min
- **Aprimora:** toques curtos, aceleração, proteção da bola
- **Objetivo:** Aprimorar toques curtos, aceleração, proteção da bola em contexto de desafio por pontos.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em condução. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-006",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Condução",
  "nome": "FUT-006 — Condução: desafio por pontos",
  "nivel": "Iniciante",
  "tempo_medio_min": 26,
  "habilidades": "toques curtos, aceleração, proteção da bola"
}
```


### FUT-007 — Finalização: ondas de ataque

- **Categoria:** Finalização
- **Nível:** Base
- **Tempo médio:** 29 min
- **Aprimora:** chute, ajuste corporal, escolha de canto, precisão
- **Objetivo:** Aprimorar chute, ajuste corporal, escolha de canto, precisão em contexto de ondas de ataque.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em finalização. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-007",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Finalização",
  "nome": "FUT-007 — Finalização: ondas de ataque",
  "nivel": "Base",
  "tempo_medio_min": 29,
  "habilidades": "chute, ajuste corporal, escolha de canto, precisão"
}
```


### FUT-008 — Cruzamento: corrida com bola

- **Categoria:** Cruzamento
- **Nível:** Intermediário
- **Tempo médio:** 30 min
- **Aprimora:** bola lateral, timing, alvo, qualidade do passe
- **Objetivo:** Aprimorar bola lateral, timing, alvo, qualidade do passe em contexto de corrida com bola.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em cruzamento. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-008",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Cruzamento",
  "nome": "FUT-008 — Cruzamento: corrida com bola",
  "nivel": "Intermediário",
  "tempo_medio_min": 30,
  "habilidades": "bola lateral, timing, alvo, qualidade do passe"
}
```


### FUT-009 — Cabeceio: estação individual

- **Categoria:** Cabeceio
- **Nível:** Intermediário
- **Tempo médio:** 8 min
- **Aprimora:** impulsão, coordenação, ataque à bola, direcionamento
- **Objetivo:** Aprimorar impulsão, coordenação, ataque à bola, direcionamento em contexto de estação individual.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em cabeceio. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-009",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Cabeceio",
  "nome": "FUT-009 — Cabeceio: estação individual",
  "nivel": "Intermediário",
  "tempo_medio_min": 8,
  "habilidades": "impulsão, coordenação, ataque à bola, direcionamento"
}
```


### FUT-010 — Rondo: parede/rebote

- **Categoria:** Rondo
- **Nível:** Avançado
- **Tempo médio:** 11 min
- **Aprimora:** posse, tomada de decisão, pressão, linhas de passe
- **Objetivo:** Aprimorar posse, tomada de decisão, pressão, linhas de passe em contexto de parede/rebote.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em rondo. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-010",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Rondo",
  "nome": "FUT-010 — Rondo: parede/rebote",
  "nivel": "Avançado",
  "tempo_medio_min": 11,
  "habilidades": "posse, tomada de decisão, pressão, linhas de passe"
}
```


### FUT-011 — Marcação: alvo marcado

- **Categoria:** Marcação
- **Nível:** Iniciante
- **Tempo médio:** 14 min
- **Aprimora:** posicionamento, distância de combate, leitura defensiva
- **Objetivo:** Aprimorar posicionamento, distância de combate, leitura defensiva em contexto de alvo marcado.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em marcação. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-011",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Marcação",
  "nome": "FUT-011 — Marcação: alvo marcado",
  "nivel": "Iniciante",
  "tempo_medio_min": 14,
  "habilidades": "posicionamento, distância de combate, leitura defensiva"
}
```


### FUT-012 — Transição ofensiva: zona de decisão

- **Categoria:** Transição ofensiva
- **Nível:** Base
- **Tempo médio:** 17 min
- **Aprimora:** velocidade, ataque ao espaço, decisão rápida
- **Objetivo:** Aprimorar velocidade, ataque ao espaço, decisão rápida em contexto de zona de decisão.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em transição ofensiva. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-012",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Transição ofensiva",
  "nome": "FUT-012 — Transição ofensiva: zona de decisão",
  "nivel": "Base",
  "tempo_medio_min": 17,
  "habilidades": "velocidade, ataque ao espaço, decisão rápida"
}
```


### FUT-013 — Transição defensiva: circuito em cones

- **Categoria:** Transição defensiva
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Aprimora:** reação pós-perda, recomposição, pressão imediata
- **Objetivo:** Aprimorar reação pós-perda, recomposição, pressão imediata em contexto de circuito em cones.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em transição defensiva. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-013",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Transição defensiva",
  "nome": "FUT-013 — Transição defensiva: circuito em cones",
  "nivel": "Intermediário",
  "tempo_medio_min": 20,
  "habilidades": "reação pós-perda, recomposição, pressão imediata"
}
```


### FUT-014 — 1 contra 1: duelo cronometrado

- **Categoria:** 1 contra 1
- **Nível:** Intermediário
- **Tempo médio:** 23 min
- **Aprimora:** duelo, coragem, proteção, leitura do adversário
- **Objetivo:** Aprimorar duelo, coragem, proteção, leitura do adversário em contexto de duelo cronometrado.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em 1 contra 1. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-014",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "1 contra 1",
  "nome": "FUT-014 — 1 contra 1: duelo cronometrado",
  "nivel": "Intermediário",
  "tempo_medio_min": 23,
  "habilidades": "duelo, coragem, proteção, leitura do adversário"
}
```


### FUT-015 — 2 contra 1: jogo reduzido

- **Categoria:** 2 contra 1
- **Nível:** Avançado
- **Tempo médio:** 26 min
- **Aprimora:** vantagem numérica, passe final, temporização
- **Objetivo:** Aprimorar vantagem numérica, passe final, temporização em contexto de jogo reduzido.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em 2 contra 1. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-015",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "2 contra 1",
  "nome": "FUT-015 — 2 contra 1: jogo reduzido",
  "nivel": "Avançado",
  "tempo_medio_min": 26,
  "habilidades": "vantagem numérica, passe final, temporização"
}
```


### FUT-016 — 3 contra 2: rondo progressivo

- **Categoria:** 3 contra 2
- **Nível:** Iniciante
- **Tempo médio:** 29 min
- **Aprimora:** superioridade, ocupação de espaço, tomada de decisão
- **Objetivo:** Aprimorar superioridade, ocupação de espaço, tomada de decisão em contexto de rondo progressivo.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em 3 contra 2. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-016",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "3 contra 2",
  "nome": "FUT-016 — 3 contra 2: rondo progressivo",
  "nivel": "Iniciante",
  "tempo_medio_min": 29,
  "habilidades": "superioridade, ocupação de espaço, tomada de decisão"
}
```


### FUT-017 — Posicionamento: sequência técnica

- **Categoria:** Posicionamento
- **Nível:** Base
- **Tempo médio:** 30 min
- **Aprimora:** escaneamento, linhas, cobertura, amplitude
- **Objetivo:** Aprimorar escaneamento, linhas, cobertura, amplitude em contexto de sequência técnica.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em posicionamento. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-017",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Posicionamento",
  "nome": "FUT-017 — Posicionamento: sequência técnica",
  "nivel": "Base",
  "tempo_medio_min": 30,
  "habilidades": "escaneamento, linhas, cobertura, amplitude"
}
```


### FUT-018 — Resistência com bola: desafio por pontos

- **Categoria:** Resistência com bola
- **Nível:** Intermediário
- **Tempo médio:** 8 min
- **Aprimora:** capacidade aeróbica, repetição técnica, ritmo
- **Objetivo:** Aprimorar capacidade aeróbica, repetição técnica, ritmo em contexto de desafio por pontos.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em resistência com bola. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-018",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Resistência com bola",
  "nome": "FUT-018 — Resistência com bola: desafio por pontos",
  "nivel": "Intermediário",
  "tempo_medio_min": 8,
  "habilidades": "capacidade aeróbica, repetição técnica, ritmo"
}
```


### FUT-019 — Agilidade: ondas de ataque

- **Categoria:** Agilidade
- **Nível:** Intermediário
- **Tempo médio:** 11 min
- **Aprimora:** mudança de direção, freio, aceleração, equilíbrio
- **Objetivo:** Aprimorar mudança de direção, freio, aceleração, equilíbrio em contexto de ondas de ataque.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em agilidade. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-019",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Agilidade",
  "nome": "FUT-019 — Agilidade: ondas de ataque",
  "nivel": "Intermediário",
  "tempo_medio_min": 11,
  "habilidades": "mudança de direção, freio, aceleração, equilíbrio"
}
```


### FUT-020 — Velocidade: corrida com bola

- **Categoria:** Velocidade
- **Nível:** Avançado
- **Tempo médio:** 14 min
- **Aprimora:** arranque, reação, sprint curto, mecânica
- **Objetivo:** Aprimorar arranque, reação, sprint curto, mecânica em contexto de corrida com bola.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em velocidade. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-020",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Velocidade",
  "nome": "FUT-020 — Velocidade: corrida com bola",
  "nivel": "Avançado",
  "tempo_medio_min": 14,
  "habilidades": "arranque, reação, sprint curto, mecânica"
}
```


### FUT-021 — Goleiro: estação individual

- **Categoria:** Goleiro
- **Nível:** Iniciante
- **Tempo médio:** 17 min
- **Aprimora:** base, reflexo, queda, reposição, leitura
- **Objetivo:** Aprimorar base, reflexo, queda, reposição, leitura em contexto de estação individual.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em goleiro. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-021",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Goleiro",
  "nome": "FUT-021 — Goleiro: estação individual",
  "nivel": "Iniciante",
  "tempo_medio_min": 17,
  "habilidades": "base, reflexo, queda, reposição, leitura"
}
```


### FUT-022 — Bola parada: parede/rebote

- **Categoria:** Bola parada
- **Nível:** Base
- **Tempo médio:** 20 min
- **Aprimora:** cobrança, marcação, posicionamento, leitura de trajetória
- **Objetivo:** Aprimorar cobrança, marcação, posicionamento, leitura de trajetória em contexto de parede/rebote.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em bola parada. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-022",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Bola parada",
  "nome": "FUT-022 — Bola parada: parede/rebote",
  "nivel": "Base",
  "tempo_medio_min": 20,
  "habilidades": "cobrança, marcação, posicionamento, leitura de trajetória"
}
```


### FUT-023 — Futsal aplicado: alvo marcado

- **Categoria:** Futsal aplicado
- **Nível:** Intermediário
- **Tempo médio:** 23 min
- **Aprimora:** espaço curto, giro, domínio, decisões rápidas
- **Objetivo:** Aprimorar espaço curto, giro, domínio, decisões rápidas em contexto de alvo marcado.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em futsal aplicado. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-023",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Futsal aplicado",
  "nome": "FUT-023 — Futsal aplicado: alvo marcado",
  "nivel": "Intermediário",
  "tempo_medio_min": 23,
  "habilidades": "espaço curto, giro, domínio, decisões rápidas"
}
```


### FUT-024 — Controle de bola: zona de decisão

- **Categoria:** Controle de bola
- **Nível:** Intermediário
- **Tempo médio:** 26 min
- **Aprimora:** controle, domínio, coordenação, confiança técnica
- **Objetivo:** Aprimorar controle, domínio, coordenação, confiança técnica em contexto de zona de decisão.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em controle de bola. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-024",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Controle de bola",
  "nome": "FUT-024 — Controle de bola: zona de decisão",
  "nivel": "Intermediário",
  "tempo_medio_min": 26,
  "habilidades": "controle, domínio, coordenação, confiança técnica"
}
```


### FUT-025 — Passe curto: circuito em cones

- **Categoria:** Passe curto
- **Nível:** Avançado
- **Tempo médio:** 29 min
- **Aprimora:** precisão, comunicação, tempo de passe, apoio
- **Objetivo:** Aprimorar precisão, comunicação, tempo de passe, apoio em contexto de circuito em cones.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em passe curto. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-025",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Passe curto",
  "nome": "FUT-025 — Passe curto: circuito em cones",
  "nivel": "Avançado",
  "tempo_medio_min": 29,
  "habilidades": "precisão, comunicação, tempo de passe, apoio"
}
```


### FUT-026 — Passe longo: duelo cronometrado

- **Categoria:** Passe longo
- **Nível:** Iniciante
- **Tempo médio:** 30 min
- **Aprimora:** força controlada, visão de jogo, mudança de corredor
- **Objetivo:** Aprimorar força controlada, visão de jogo, mudança de corredor em contexto de duelo cronometrado.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em passe longo. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-026",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Passe longo",
  "nome": "FUT-026 — Passe longo: duelo cronometrado",
  "nivel": "Iniciante",
  "tempo_medio_min": 30,
  "habilidades": "força controlada, visão de jogo, mudança de corredor"
}
```


### FUT-027 — Primeiro toque: jogo reduzido

- **Categoria:** Primeiro toque
- **Nível:** Base
- **Tempo médio:** 8 min
- **Aprimora:** orientação corporal, domínio direcionado, velocidade de decisão
- **Objetivo:** Aprimorar orientação corporal, domínio direcionado, velocidade de decisão em contexto de jogo reduzido.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em primeiro toque. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-027",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Primeiro toque",
  "nome": "FUT-027 — Primeiro toque: jogo reduzido",
  "nivel": "Base",
  "tempo_medio_min": 8,
  "habilidades": "orientação corporal, domínio direcionado, velocidade de decisão"
}
```


### FUT-028 — Drible: rondo progressivo

- **Categoria:** Drible
- **Nível:** Intermediário
- **Tempo médio:** 11 min
- **Aprimora:** finta, mudança de direção, criatividade, controle sob pressão
- **Objetivo:** Aprimorar finta, mudança de direção, criatividade, controle sob pressão em contexto de rondo progressivo.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em drible. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-028",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Drible",
  "nome": "FUT-028 — Drible: rondo progressivo",
  "nivel": "Intermediário",
  "tempo_medio_min": 11,
  "habilidades": "finta, mudança de direção, criatividade, controle sob pressão"
}
```


### FUT-029 — Condução: sequência técnica

- **Categoria:** Condução
- **Nível:** Intermediário
- **Tempo médio:** 14 min
- **Aprimora:** toques curtos, aceleração, proteção da bola
- **Objetivo:** Aprimorar toques curtos, aceleração, proteção da bola em contexto de sequência técnica.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em condução. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-029",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Condução",
  "nome": "FUT-029 — Condução: sequência técnica",
  "nivel": "Intermediário",
  "tempo_medio_min": 14,
  "habilidades": "toques curtos, aceleração, proteção da bola"
}
```


### FUT-030 — Finalização: desafio por pontos

- **Categoria:** Finalização
- **Nível:** Avançado
- **Tempo médio:** 17 min
- **Aprimora:** chute, ajuste corporal, escolha de canto, precisão
- **Objetivo:** Aprimorar chute, ajuste corporal, escolha de canto, precisão em contexto de desafio por pontos.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em finalização. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-030",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Finalização",
  "nome": "FUT-030 — Finalização: desafio por pontos",
  "nivel": "Avançado",
  "tempo_medio_min": 17,
  "habilidades": "chute, ajuste corporal, escolha de canto, precisão"
}
```


### FUT-031 — Cruzamento: ondas de ataque

- **Categoria:** Cruzamento
- **Nível:** Iniciante
- **Tempo médio:** 20 min
- **Aprimora:** bola lateral, timing, alvo, qualidade do passe
- **Objetivo:** Aprimorar bola lateral, timing, alvo, qualidade do passe em contexto de ondas de ataque.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em cruzamento. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-031",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Cruzamento",
  "nome": "FUT-031 — Cruzamento: ondas de ataque",
  "nivel": "Iniciante",
  "tempo_medio_min": 20,
  "habilidades": "bola lateral, timing, alvo, qualidade do passe"
}
```


### FUT-032 — Cabeceio: corrida com bola

- **Categoria:** Cabeceio
- **Nível:** Base
- **Tempo médio:** 23 min
- **Aprimora:** impulsão, coordenação, ataque à bola, direcionamento
- **Objetivo:** Aprimorar impulsão, coordenação, ataque à bola, direcionamento em contexto de corrida com bola.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em cabeceio. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-032",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Cabeceio",
  "nome": "FUT-032 — Cabeceio: corrida com bola",
  "nivel": "Base",
  "tempo_medio_min": 23,
  "habilidades": "impulsão, coordenação, ataque à bola, direcionamento"
}
```


### FUT-033 — Rondo: estação individual

- **Categoria:** Rondo
- **Nível:** Intermediário
- **Tempo médio:** 26 min
- **Aprimora:** posse, tomada de decisão, pressão, linhas de passe
- **Objetivo:** Aprimorar posse, tomada de decisão, pressão, linhas de passe em contexto de estação individual.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em rondo. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-033",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Rondo",
  "nome": "FUT-033 — Rondo: estação individual",
  "nivel": "Intermediário",
  "tempo_medio_min": 26,
  "habilidades": "posse, tomada de decisão, pressão, linhas de passe"
}
```


### FUT-034 — Marcação: parede/rebote

- **Categoria:** Marcação
- **Nível:** Intermediário
- **Tempo médio:** 29 min
- **Aprimora:** posicionamento, distância de combate, leitura defensiva
- **Objetivo:** Aprimorar posicionamento, distância de combate, leitura defensiva em contexto de parede/rebote.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em marcação. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-034",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Marcação",
  "nome": "FUT-034 — Marcação: parede/rebote",
  "nivel": "Intermediário",
  "tempo_medio_min": 29,
  "habilidades": "posicionamento, distância de combate, leitura defensiva"
}
```


### FUT-035 — Transição ofensiva: alvo marcado

- **Categoria:** Transição ofensiva
- **Nível:** Avançado
- **Tempo médio:** 30 min
- **Aprimora:** velocidade, ataque ao espaço, decisão rápida
- **Objetivo:** Aprimorar velocidade, ataque ao espaço, decisão rápida em contexto de alvo marcado.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em transição ofensiva. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-035",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Transição ofensiva",
  "nome": "FUT-035 — Transição ofensiva: alvo marcado",
  "nivel": "Avançado",
  "tempo_medio_min": 30,
  "habilidades": "velocidade, ataque ao espaço, decisão rápida"
}
```


### FUT-036 — Transição defensiva: zona de decisão

- **Categoria:** Transição defensiva
- **Nível:** Iniciante
- **Tempo médio:** 8 min
- **Aprimora:** reação pós-perda, recomposição, pressão imediata
- **Objetivo:** Aprimorar reação pós-perda, recomposição, pressão imediata em contexto de zona de decisão.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em transição defensiva. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-036",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Transição defensiva",
  "nome": "FUT-036 — Transição defensiva: zona de decisão",
  "nivel": "Iniciante",
  "tempo_medio_min": 8,
  "habilidades": "reação pós-perda, recomposição, pressão imediata"
}
```


### FUT-037 — 1 contra 1: circuito em cones

- **Categoria:** 1 contra 1
- **Nível:** Base
- **Tempo médio:** 11 min
- **Aprimora:** duelo, coragem, proteção, leitura do adversário
- **Objetivo:** Aprimorar duelo, coragem, proteção, leitura do adversário em contexto de circuito em cones.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em 1 contra 1. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-037",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "1 contra 1",
  "nome": "FUT-037 — 1 contra 1: circuito em cones",
  "nivel": "Base",
  "tempo_medio_min": 11,
  "habilidades": "duelo, coragem, proteção, leitura do adversário"
}
```


### FUT-038 — 2 contra 1: duelo cronometrado

- **Categoria:** 2 contra 1
- **Nível:** Intermediário
- **Tempo médio:** 14 min
- **Aprimora:** vantagem numérica, passe final, temporização
- **Objetivo:** Aprimorar vantagem numérica, passe final, temporização em contexto de duelo cronometrado.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em 2 contra 1. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-038",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "2 contra 1",
  "nome": "FUT-038 — 2 contra 1: duelo cronometrado",
  "nivel": "Intermediário",
  "tempo_medio_min": 14,
  "habilidades": "vantagem numérica, passe final, temporização"
}
```


### FUT-039 — 3 contra 2: jogo reduzido

- **Categoria:** 3 contra 2
- **Nível:** Intermediário
- **Tempo médio:** 17 min
- **Aprimora:** superioridade, ocupação de espaço, tomada de decisão
- **Objetivo:** Aprimorar superioridade, ocupação de espaço, tomada de decisão em contexto de jogo reduzido.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em 3 contra 2. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-039",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "3 contra 2",
  "nome": "FUT-039 — 3 contra 2: jogo reduzido",
  "nivel": "Intermediário",
  "tempo_medio_min": 17,
  "habilidades": "superioridade, ocupação de espaço, tomada de decisão"
}
```


### FUT-040 — Posicionamento: rondo progressivo

- **Categoria:** Posicionamento
- **Nível:** Avançado
- **Tempo médio:** 20 min
- **Aprimora:** escaneamento, linhas, cobertura, amplitude
- **Objetivo:** Aprimorar escaneamento, linhas, cobertura, amplitude em contexto de rondo progressivo.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em posicionamento. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-040",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Posicionamento",
  "nome": "FUT-040 — Posicionamento: rondo progressivo",
  "nivel": "Avançado",
  "tempo_medio_min": 20,
  "habilidades": "escaneamento, linhas, cobertura, amplitude"
}
```


### FUT-041 — Resistência com bola: sequência técnica

- **Categoria:** Resistência com bola
- **Nível:** Iniciante
- **Tempo médio:** 23 min
- **Aprimora:** capacidade aeróbica, repetição técnica, ritmo
- **Objetivo:** Aprimorar capacidade aeróbica, repetição técnica, ritmo em contexto de sequência técnica.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em resistência com bola. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-041",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Resistência com bola",
  "nome": "FUT-041 — Resistência com bola: sequência técnica",
  "nivel": "Iniciante",
  "tempo_medio_min": 23,
  "habilidades": "capacidade aeróbica, repetição técnica, ritmo"
}
```


### FUT-042 — Agilidade: desafio por pontos

- **Categoria:** Agilidade
- **Nível:** Base
- **Tempo médio:** 26 min
- **Aprimora:** mudança de direção, freio, aceleração, equilíbrio
- **Objetivo:** Aprimorar mudança de direção, freio, aceleração, equilíbrio em contexto de desafio por pontos.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em agilidade. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-042",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Agilidade",
  "nome": "FUT-042 — Agilidade: desafio por pontos",
  "nivel": "Base",
  "tempo_medio_min": 26,
  "habilidades": "mudança de direção, freio, aceleração, equilíbrio"
}
```


### FUT-043 — Velocidade: ondas de ataque

- **Categoria:** Velocidade
- **Nível:** Intermediário
- **Tempo médio:** 29 min
- **Aprimora:** arranque, reação, sprint curto, mecânica
- **Objetivo:** Aprimorar arranque, reação, sprint curto, mecânica em contexto de ondas de ataque.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em velocidade. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-043",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Velocidade",
  "nome": "FUT-043 — Velocidade: ondas de ataque",
  "nivel": "Intermediário",
  "tempo_medio_min": 29,
  "habilidades": "arranque, reação, sprint curto, mecânica"
}
```


### FUT-044 — Goleiro: corrida com bola

- **Categoria:** Goleiro
- **Nível:** Intermediário
- **Tempo médio:** 30 min
- **Aprimora:** base, reflexo, queda, reposição, leitura
- **Objetivo:** Aprimorar base, reflexo, queda, reposição, leitura em contexto de corrida com bola.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em goleiro. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-044",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Goleiro",
  "nome": "FUT-044 — Goleiro: corrida com bola",
  "nivel": "Intermediário",
  "tempo_medio_min": 30,
  "habilidades": "base, reflexo, queda, reposição, leitura"
}
```


### FUT-045 — Bola parada: estação individual

- **Categoria:** Bola parada
- **Nível:** Avançado
- **Tempo médio:** 8 min
- **Aprimora:** cobrança, marcação, posicionamento, leitura de trajetória
- **Objetivo:** Aprimorar cobrança, marcação, posicionamento, leitura de trajetória em contexto de estação individual.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em bola parada. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-045",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Bola parada",
  "nome": "FUT-045 — Bola parada: estação individual",
  "nivel": "Avançado",
  "tempo_medio_min": 8,
  "habilidades": "cobrança, marcação, posicionamento, leitura de trajetória"
}
```


### FUT-046 — Futsal aplicado: parede/rebote

- **Categoria:** Futsal aplicado
- **Nível:** Iniciante
- **Tempo médio:** 11 min
- **Aprimora:** espaço curto, giro, domínio, decisões rápidas
- **Objetivo:** Aprimorar espaço curto, giro, domínio, decisões rápidas em contexto de parede/rebote.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em futsal aplicado. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-046",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Futsal aplicado",
  "nome": "FUT-046 — Futsal aplicado: parede/rebote",
  "nivel": "Iniciante",
  "tempo_medio_min": 11,
  "habilidades": "espaço curto, giro, domínio, decisões rápidas"
}
```


### FUT-047 — Controle de bola: alvo marcado

- **Categoria:** Controle de bola
- **Nível:** Base
- **Tempo médio:** 14 min
- **Aprimora:** controle, domínio, coordenação, confiança técnica
- **Objetivo:** Aprimorar controle, domínio, coordenação, confiança técnica em contexto de alvo marcado.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em controle de bola. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-047",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Controle de bola",
  "nome": "FUT-047 — Controle de bola: alvo marcado",
  "nivel": "Base",
  "tempo_medio_min": 14,
  "habilidades": "controle, domínio, coordenação, confiança técnica"
}
```


### FUT-048 — Passe curto: zona de decisão

- **Categoria:** Passe curto
- **Nível:** Intermediário
- **Tempo médio:** 17 min
- **Aprimora:** precisão, comunicação, tempo de passe, apoio
- **Objetivo:** Aprimorar precisão, comunicação, tempo de passe, apoio em contexto de zona de decisão.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em passe curto. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-048",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Passe curto",
  "nome": "FUT-048 — Passe curto: zona de decisão",
  "nivel": "Intermediário",
  "tempo_medio_min": 17,
  "habilidades": "precisão, comunicação, tempo de passe, apoio"
}
```


### FUT-049 — Passe longo: circuito em cones

- **Categoria:** Passe longo
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Aprimora:** força controlada, visão de jogo, mudança de corredor
- **Objetivo:** Aprimorar força controlada, visão de jogo, mudança de corredor em contexto de circuito em cones.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em passe longo. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-049",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Passe longo",
  "nome": "FUT-049 — Passe longo: circuito em cones",
  "nivel": "Intermediário",
  "tempo_medio_min": 20,
  "habilidades": "força controlada, visão de jogo, mudança de corredor"
}
```


### FUT-050 — Primeiro toque: duelo cronometrado

- **Categoria:** Primeiro toque
- **Nível:** Avançado
- **Tempo médio:** 23 min
- **Aprimora:** orientação corporal, domínio direcionado, velocidade de decisão
- **Objetivo:** Aprimorar orientação corporal, domínio direcionado, velocidade de decisão em contexto de duelo cronometrado.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em primeiro toque. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-050",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Primeiro toque",
  "nome": "FUT-050 — Primeiro toque: duelo cronometrado",
  "nivel": "Avançado",
  "tempo_medio_min": 23,
  "habilidades": "orientação corporal, domínio direcionado, velocidade de decisão"
}
```


### FUT-051 — Drible: jogo reduzido

- **Categoria:** Drible
- **Nível:** Iniciante
- **Tempo médio:** 26 min
- **Aprimora:** finta, mudança de direção, criatividade, controle sob pressão
- **Objetivo:** Aprimorar finta, mudança de direção, criatividade, controle sob pressão em contexto de jogo reduzido.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em drible. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-051",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Drible",
  "nome": "FUT-051 — Drible: jogo reduzido",
  "nivel": "Iniciante",
  "tempo_medio_min": 26,
  "habilidades": "finta, mudança de direção, criatividade, controle sob pressão"
}
```


### FUT-052 — Condução: rondo progressivo

- **Categoria:** Condução
- **Nível:** Base
- **Tempo médio:** 29 min
- **Aprimora:** toques curtos, aceleração, proteção da bola
- **Objetivo:** Aprimorar toques curtos, aceleração, proteção da bola em contexto de rondo progressivo.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em condução. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-052",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Condução",
  "nome": "FUT-052 — Condução: rondo progressivo",
  "nivel": "Base",
  "tempo_medio_min": 29,
  "habilidades": "toques curtos, aceleração, proteção da bola"
}
```


### FUT-053 — Finalização: sequência técnica

- **Categoria:** Finalização
- **Nível:** Intermediário
- **Tempo médio:** 30 min
- **Aprimora:** chute, ajuste corporal, escolha de canto, precisão
- **Objetivo:** Aprimorar chute, ajuste corporal, escolha de canto, precisão em contexto de sequência técnica.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em finalização. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-053",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Finalização",
  "nome": "FUT-053 — Finalização: sequência técnica",
  "nivel": "Intermediário",
  "tempo_medio_min": 30,
  "habilidades": "chute, ajuste corporal, escolha de canto, precisão"
}
```


### FUT-054 — Cruzamento: desafio por pontos

- **Categoria:** Cruzamento
- **Nível:** Intermediário
- **Tempo médio:** 8 min
- **Aprimora:** bola lateral, timing, alvo, qualidade do passe
- **Objetivo:** Aprimorar bola lateral, timing, alvo, qualidade do passe em contexto de desafio por pontos.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em cruzamento. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-054",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Cruzamento",
  "nome": "FUT-054 — Cruzamento: desafio por pontos",
  "nivel": "Intermediário",
  "tempo_medio_min": 8,
  "habilidades": "bola lateral, timing, alvo, qualidade do passe"
}
```


### FUT-055 — Cabeceio: ondas de ataque

- **Categoria:** Cabeceio
- **Nível:** Avançado
- **Tempo médio:** 11 min
- **Aprimora:** impulsão, coordenação, ataque à bola, direcionamento
- **Objetivo:** Aprimorar impulsão, coordenação, ataque à bola, direcionamento em contexto de ondas de ataque.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em cabeceio. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-055",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Cabeceio",
  "nome": "FUT-055 — Cabeceio: ondas de ataque",
  "nivel": "Avançado",
  "tempo_medio_min": 11,
  "habilidades": "impulsão, coordenação, ataque à bola, direcionamento"
}
```


### FUT-056 — Rondo: corrida com bola

- **Categoria:** Rondo
- **Nível:** Iniciante
- **Tempo médio:** 14 min
- **Aprimora:** posse, tomada de decisão, pressão, linhas de passe
- **Objetivo:** Aprimorar posse, tomada de decisão, pressão, linhas de passe em contexto de corrida com bola.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em rondo. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-056",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Rondo",
  "nome": "FUT-056 — Rondo: corrida com bola",
  "nivel": "Iniciante",
  "tempo_medio_min": 14,
  "habilidades": "posse, tomada de decisão, pressão, linhas de passe"
}
```


### FUT-057 — Marcação: estação individual

- **Categoria:** Marcação
- **Nível:** Base
- **Tempo médio:** 17 min
- **Aprimora:** posicionamento, distância de combate, leitura defensiva
- **Objetivo:** Aprimorar posicionamento, distância de combate, leitura defensiva em contexto de estação individual.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em marcação. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-057",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Marcação",
  "nome": "FUT-057 — Marcação: estação individual",
  "nivel": "Base",
  "tempo_medio_min": 17,
  "habilidades": "posicionamento, distância de combate, leitura defensiva"
}
```


### FUT-058 — Transição ofensiva: parede/rebote

- **Categoria:** Transição ofensiva
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Aprimora:** velocidade, ataque ao espaço, decisão rápida
- **Objetivo:** Aprimorar velocidade, ataque ao espaço, decisão rápida em contexto de parede/rebote.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em transição ofensiva. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-058",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Transição ofensiva",
  "nome": "FUT-058 — Transição ofensiva: parede/rebote",
  "nivel": "Intermediário",
  "tempo_medio_min": 20,
  "habilidades": "velocidade, ataque ao espaço, decisão rápida"
}
```


### FUT-059 — Transição defensiva: alvo marcado

- **Categoria:** Transição defensiva
- **Nível:** Intermediário
- **Tempo médio:** 23 min
- **Aprimora:** reação pós-perda, recomposição, pressão imediata
- **Objetivo:** Aprimorar reação pós-perda, recomposição, pressão imediata em contexto de alvo marcado.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em transição defensiva. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-059",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Transição defensiva",
  "nome": "FUT-059 — Transição defensiva: alvo marcado",
  "nivel": "Intermediário",
  "tempo_medio_min": 23,
  "habilidades": "reação pós-perda, recomposição, pressão imediata"
}
```


### FUT-060 — 1 contra 1: zona de decisão

- **Categoria:** 1 contra 1
- **Nível:** Avançado
- **Tempo médio:** 26 min
- **Aprimora:** duelo, coragem, proteção, leitura do adversário
- **Objetivo:** Aprimorar duelo, coragem, proteção, leitura do adversário em contexto de zona de decisão.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em 1 contra 1. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-060",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "1 contra 1",
  "nome": "FUT-060 — 1 contra 1: zona de decisão",
  "nivel": "Avançado",
  "tempo_medio_min": 26,
  "habilidades": "duelo, coragem, proteção, leitura do adversário"
}
```


### FUT-061 — 2 contra 1: circuito em cones

- **Categoria:** 2 contra 1
- **Nível:** Iniciante
- **Tempo médio:** 29 min
- **Aprimora:** vantagem numérica, passe final, temporização
- **Objetivo:** Aprimorar vantagem numérica, passe final, temporização em contexto de circuito em cones.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em 2 contra 1. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-061",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "2 contra 1",
  "nome": "FUT-061 — 2 contra 1: circuito em cones",
  "nivel": "Iniciante",
  "tempo_medio_min": 29,
  "habilidades": "vantagem numérica, passe final, temporização"
}
```


### FUT-062 — 3 contra 2: duelo cronometrado

- **Categoria:** 3 contra 2
- **Nível:** Base
- **Tempo médio:** 30 min
- **Aprimora:** superioridade, ocupação de espaço, tomada de decisão
- **Objetivo:** Aprimorar superioridade, ocupação de espaço, tomada de decisão em contexto de duelo cronometrado.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em 3 contra 2. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-062",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "3 contra 2",
  "nome": "FUT-062 — 3 contra 2: duelo cronometrado",
  "nivel": "Base",
  "tempo_medio_min": 30,
  "habilidades": "superioridade, ocupação de espaço, tomada de decisão"
}
```


### FUT-063 — Posicionamento: jogo reduzido

- **Categoria:** Posicionamento
- **Nível:** Intermediário
- **Tempo médio:** 8 min
- **Aprimora:** escaneamento, linhas, cobertura, amplitude
- **Objetivo:** Aprimorar escaneamento, linhas, cobertura, amplitude em contexto de jogo reduzido.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em posicionamento. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-063",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Posicionamento",
  "nome": "FUT-063 — Posicionamento: jogo reduzido",
  "nivel": "Intermediário",
  "tempo_medio_min": 8,
  "habilidades": "escaneamento, linhas, cobertura, amplitude"
}
```


### FUT-064 — Resistência com bola: rondo progressivo

- **Categoria:** Resistência com bola
- **Nível:** Intermediário
- **Tempo médio:** 11 min
- **Aprimora:** capacidade aeróbica, repetição técnica, ritmo
- **Objetivo:** Aprimorar capacidade aeróbica, repetição técnica, ritmo em contexto de rondo progressivo.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em resistência com bola. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-064",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Resistência com bola",
  "nome": "FUT-064 — Resistência com bola: rondo progressivo",
  "nivel": "Intermediário",
  "tempo_medio_min": 11,
  "habilidades": "capacidade aeróbica, repetição técnica, ritmo"
}
```


### FUT-065 — Agilidade: sequência técnica

- **Categoria:** Agilidade
- **Nível:** Avançado
- **Tempo médio:** 14 min
- **Aprimora:** mudança de direção, freio, aceleração, equilíbrio
- **Objetivo:** Aprimorar mudança de direção, freio, aceleração, equilíbrio em contexto de sequência técnica.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em agilidade. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-065",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Agilidade",
  "nome": "FUT-065 — Agilidade: sequência técnica",
  "nivel": "Avançado",
  "tempo_medio_min": 14,
  "habilidades": "mudança de direção, freio, aceleração, equilíbrio"
}
```


### FUT-066 — Velocidade: desafio por pontos

- **Categoria:** Velocidade
- **Nível:** Iniciante
- **Tempo médio:** 17 min
- **Aprimora:** arranque, reação, sprint curto, mecânica
- **Objetivo:** Aprimorar arranque, reação, sprint curto, mecânica em contexto de desafio por pontos.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em velocidade. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-066",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Velocidade",
  "nome": "FUT-066 — Velocidade: desafio por pontos",
  "nivel": "Iniciante",
  "tempo_medio_min": 17,
  "habilidades": "arranque, reação, sprint curto, mecânica"
}
```


### FUT-067 — Goleiro: ondas de ataque

- **Categoria:** Goleiro
- **Nível:** Base
- **Tempo médio:** 20 min
- **Aprimora:** base, reflexo, queda, reposição, leitura
- **Objetivo:** Aprimorar base, reflexo, queda, reposição, leitura em contexto de ondas de ataque.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em goleiro. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-067",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Goleiro",
  "nome": "FUT-067 — Goleiro: ondas de ataque",
  "nivel": "Base",
  "tempo_medio_min": 20,
  "habilidades": "base, reflexo, queda, reposição, leitura"
}
```


### FUT-068 — Bola parada: corrida com bola

- **Categoria:** Bola parada
- **Nível:** Intermediário
- **Tempo médio:** 23 min
- **Aprimora:** cobrança, marcação, posicionamento, leitura de trajetória
- **Objetivo:** Aprimorar cobrança, marcação, posicionamento, leitura de trajetória em contexto de corrida com bola.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em bola parada. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-068",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Bola parada",
  "nome": "FUT-068 — Bola parada: corrida com bola",
  "nivel": "Intermediário",
  "tempo_medio_min": 23,
  "habilidades": "cobrança, marcação, posicionamento, leitura de trajetória"
}
```


### FUT-069 — Futsal aplicado: estação individual

- **Categoria:** Futsal aplicado
- **Nível:** Intermediário
- **Tempo médio:** 26 min
- **Aprimora:** espaço curto, giro, domínio, decisões rápidas
- **Objetivo:** Aprimorar espaço curto, giro, domínio, decisões rápidas em contexto de estação individual.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em futsal aplicado. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-069",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Futsal aplicado",
  "nome": "FUT-069 — Futsal aplicado: estação individual",
  "nivel": "Intermediário",
  "tempo_medio_min": 26,
  "habilidades": "espaço curto, giro, domínio, decisões rápidas"
}
```


### FUT-070 — Controle de bola: parede/rebote

- **Categoria:** Controle de bola
- **Nível:** Avançado
- **Tempo médio:** 29 min
- **Aprimora:** controle, domínio, coordenação, confiança técnica
- **Objetivo:** Aprimorar controle, domínio, coordenação, confiança técnica em contexto de parede/rebote.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em controle de bola. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-070",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Controle de bola",
  "nome": "FUT-070 — Controle de bola: parede/rebote",
  "nivel": "Avançado",
  "tempo_medio_min": 29,
  "habilidades": "controle, domínio, coordenação, confiança técnica"
}
```


### FUT-071 — Passe curto: alvo marcado

- **Categoria:** Passe curto
- **Nível:** Iniciante
- **Tempo médio:** 30 min
- **Aprimora:** precisão, comunicação, tempo de passe, apoio
- **Objetivo:** Aprimorar precisão, comunicação, tempo de passe, apoio em contexto de alvo marcado.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em passe curto. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-071",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Passe curto",
  "nome": "FUT-071 — Passe curto: alvo marcado",
  "nivel": "Iniciante",
  "tempo_medio_min": 30,
  "habilidades": "precisão, comunicação, tempo de passe, apoio"
}
```


### FUT-072 — Passe longo: zona de decisão

- **Categoria:** Passe longo
- **Nível:** Base
- **Tempo médio:** 8 min
- **Aprimora:** força controlada, visão de jogo, mudança de corredor
- **Objetivo:** Aprimorar força controlada, visão de jogo, mudança de corredor em contexto de zona de decisão.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em passe longo. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-072",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Passe longo",
  "nome": "FUT-072 — Passe longo: zona de decisão",
  "nivel": "Base",
  "tempo_medio_min": 8,
  "habilidades": "força controlada, visão de jogo, mudança de corredor"
}
```


### FUT-073 — Primeiro toque: circuito em cones

- **Categoria:** Primeiro toque
- **Nível:** Intermediário
- **Tempo médio:** 11 min
- **Aprimora:** orientação corporal, domínio direcionado, velocidade de decisão
- **Objetivo:** Aprimorar orientação corporal, domínio direcionado, velocidade de decisão em contexto de circuito em cones.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em primeiro toque. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-073",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Primeiro toque",
  "nome": "FUT-073 — Primeiro toque: circuito em cones",
  "nivel": "Intermediário",
  "tempo_medio_min": 11,
  "habilidades": "orientação corporal, domínio direcionado, velocidade de decisão"
}
```


### FUT-074 — Drible: duelo cronometrado

- **Categoria:** Drible
- **Nível:** Intermediário
- **Tempo médio:** 14 min
- **Aprimora:** finta, mudança de direção, criatividade, controle sob pressão
- **Objetivo:** Aprimorar finta, mudança de direção, criatividade, controle sob pressão em contexto de duelo cronometrado.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em drible. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-074",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Drible",
  "nome": "FUT-074 — Drible: duelo cronometrado",
  "nivel": "Intermediário",
  "tempo_medio_min": 14,
  "habilidades": "finta, mudança de direção, criatividade, controle sob pressão"
}
```


### FUT-075 — Condução: jogo reduzido

- **Categoria:** Condução
- **Nível:** Avançado
- **Tempo médio:** 17 min
- **Aprimora:** toques curtos, aceleração, proteção da bola
- **Objetivo:** Aprimorar toques curtos, aceleração, proteção da bola em contexto de jogo reduzido.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em condução. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-075",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Condução",
  "nome": "FUT-075 — Condução: jogo reduzido",
  "nivel": "Avançado",
  "tempo_medio_min": 17,
  "habilidades": "toques curtos, aceleração, proteção da bola"
}
```


### FUT-076 — Finalização: rondo progressivo

- **Categoria:** Finalização
- **Nível:** Iniciante
- **Tempo médio:** 20 min
- **Aprimora:** chute, ajuste corporal, escolha de canto, precisão
- **Objetivo:** Aprimorar chute, ajuste corporal, escolha de canto, precisão em contexto de rondo progressivo.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em finalização. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-076",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Finalização",
  "nome": "FUT-076 — Finalização: rondo progressivo",
  "nivel": "Iniciante",
  "tempo_medio_min": 20,
  "habilidades": "chute, ajuste corporal, escolha de canto, precisão"
}
```


### FUT-077 — Cruzamento: sequência técnica

- **Categoria:** Cruzamento
- **Nível:** Base
- **Tempo médio:** 23 min
- **Aprimora:** bola lateral, timing, alvo, qualidade do passe
- **Objetivo:** Aprimorar bola lateral, timing, alvo, qualidade do passe em contexto de sequência técnica.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em cruzamento. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-077",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Cruzamento",
  "nome": "FUT-077 — Cruzamento: sequência técnica",
  "nivel": "Base",
  "tempo_medio_min": 23,
  "habilidades": "bola lateral, timing, alvo, qualidade do passe"
}
```


### FUT-078 — Cabeceio: desafio por pontos

- **Categoria:** Cabeceio
- **Nível:** Intermediário
- **Tempo médio:** 26 min
- **Aprimora:** impulsão, coordenação, ataque à bola, direcionamento
- **Objetivo:** Aprimorar impulsão, coordenação, ataque à bola, direcionamento em contexto de desafio por pontos.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em cabeceio. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-078",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Cabeceio",
  "nome": "FUT-078 — Cabeceio: desafio por pontos",
  "nivel": "Intermediário",
  "tempo_medio_min": 26,
  "habilidades": "impulsão, coordenação, ataque à bola, direcionamento"
}
```


### FUT-079 — Rondo: ondas de ataque

- **Categoria:** Rondo
- **Nível:** Intermediário
- **Tempo médio:** 29 min
- **Aprimora:** posse, tomada de decisão, pressão, linhas de passe
- **Objetivo:** Aprimorar posse, tomada de decisão, pressão, linhas de passe em contexto de ondas de ataque.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em rondo. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-079",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Rondo",
  "nome": "FUT-079 — Rondo: ondas de ataque",
  "nivel": "Intermediário",
  "tempo_medio_min": 29,
  "habilidades": "posse, tomada de decisão, pressão, linhas de passe"
}
```


### FUT-080 — Marcação: corrida com bola

- **Categoria:** Marcação
- **Nível:** Avançado
- **Tempo médio:** 30 min
- **Aprimora:** posicionamento, distância de combate, leitura defensiva
- **Objetivo:** Aprimorar posicionamento, distância de combate, leitura defensiva em contexto de corrida com bola.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em marcação. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-080",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Marcação",
  "nome": "FUT-080 — Marcação: corrida com bola",
  "nivel": "Avançado",
  "tempo_medio_min": 30,
  "habilidades": "posicionamento, distância de combate, leitura defensiva"
}
```


### FUT-081 — Transição ofensiva: estação individual

- **Categoria:** Transição ofensiva
- **Nível:** Iniciante
- **Tempo médio:** 8 min
- **Aprimora:** velocidade, ataque ao espaço, decisão rápida
- **Objetivo:** Aprimorar velocidade, ataque ao espaço, decisão rápida em contexto de estação individual.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em transição ofensiva. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-081",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Transição ofensiva",
  "nome": "FUT-081 — Transição ofensiva: estação individual",
  "nivel": "Iniciante",
  "tempo_medio_min": 8,
  "habilidades": "velocidade, ataque ao espaço, decisão rápida"
}
```


### FUT-082 — Transição defensiva: parede/rebote

- **Categoria:** Transição defensiva
- **Nível:** Base
- **Tempo médio:** 11 min
- **Aprimora:** reação pós-perda, recomposição, pressão imediata
- **Objetivo:** Aprimorar reação pós-perda, recomposição, pressão imediata em contexto de parede/rebote.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em transição defensiva. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-082",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Transição defensiva",
  "nome": "FUT-082 — Transição defensiva: parede/rebote",
  "nivel": "Base",
  "tempo_medio_min": 11,
  "habilidades": "reação pós-perda, recomposição, pressão imediata"
}
```


### FUT-083 — 1 contra 1: alvo marcado

- **Categoria:** 1 contra 1
- **Nível:** Intermediário
- **Tempo médio:** 14 min
- **Aprimora:** duelo, coragem, proteção, leitura do adversário
- **Objetivo:** Aprimorar duelo, coragem, proteção, leitura do adversário em contexto de alvo marcado.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em 1 contra 1. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-083",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "1 contra 1",
  "nome": "FUT-083 — 1 contra 1: alvo marcado",
  "nivel": "Intermediário",
  "tempo_medio_min": 14,
  "habilidades": "duelo, coragem, proteção, leitura do adversário"
}
```


### FUT-084 — 2 contra 1: zona de decisão

- **Categoria:** 2 contra 1
- **Nível:** Intermediário
- **Tempo médio:** 17 min
- **Aprimora:** vantagem numérica, passe final, temporização
- **Objetivo:** Aprimorar vantagem numérica, passe final, temporização em contexto de zona de decisão.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em 2 contra 1. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-084",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "2 contra 1",
  "nome": "FUT-084 — 2 contra 1: zona de decisão",
  "nivel": "Intermediário",
  "tempo_medio_min": 17,
  "habilidades": "vantagem numérica, passe final, temporização"
}
```


### FUT-085 — 3 contra 2: circuito em cones

- **Categoria:** 3 contra 2
- **Nível:** Avançado
- **Tempo médio:** 20 min
- **Aprimora:** superioridade, ocupação de espaço, tomada de decisão
- **Objetivo:** Aprimorar superioridade, ocupação de espaço, tomada de decisão em contexto de circuito em cones.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em 3 contra 2. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-085",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "3 contra 2",
  "nome": "FUT-085 — 3 contra 2: circuito em cones",
  "nivel": "Avançado",
  "tempo_medio_min": 20,
  "habilidades": "superioridade, ocupação de espaço, tomada de decisão"
}
```


### FUT-086 — Posicionamento: duelo cronometrado

- **Categoria:** Posicionamento
- **Nível:** Iniciante
- **Tempo médio:** 23 min
- **Aprimora:** escaneamento, linhas, cobertura, amplitude
- **Objetivo:** Aprimorar escaneamento, linhas, cobertura, amplitude em contexto de duelo cronometrado.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em posicionamento. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-086",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Posicionamento",
  "nome": "FUT-086 — Posicionamento: duelo cronometrado",
  "nivel": "Iniciante",
  "tempo_medio_min": 23,
  "habilidades": "escaneamento, linhas, cobertura, amplitude"
}
```


### FUT-087 — Resistência com bola: jogo reduzido

- **Categoria:** Resistência com bola
- **Nível:** Base
- **Tempo médio:** 26 min
- **Aprimora:** capacidade aeróbica, repetição técnica, ritmo
- **Objetivo:** Aprimorar capacidade aeróbica, repetição técnica, ritmo em contexto de jogo reduzido.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em resistência com bola. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-087",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Resistência com bola",
  "nome": "FUT-087 — Resistência com bola: jogo reduzido",
  "nivel": "Base",
  "tempo_medio_min": 26,
  "habilidades": "capacidade aeróbica, repetição técnica, ritmo"
}
```


### FUT-088 — Agilidade: rondo progressivo

- **Categoria:** Agilidade
- **Nível:** Intermediário
- **Tempo médio:** 29 min
- **Aprimora:** mudança de direção, freio, aceleração, equilíbrio
- **Objetivo:** Aprimorar mudança de direção, freio, aceleração, equilíbrio em contexto de rondo progressivo.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em agilidade. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-088",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Agilidade",
  "nome": "FUT-088 — Agilidade: rondo progressivo",
  "nivel": "Intermediário",
  "tempo_medio_min": 29,
  "habilidades": "mudança de direção, freio, aceleração, equilíbrio"
}
```


### FUT-089 — Velocidade: sequência técnica

- **Categoria:** Velocidade
- **Nível:** Intermediário
- **Tempo médio:** 30 min
- **Aprimora:** arranque, reação, sprint curto, mecânica
- **Objetivo:** Aprimorar arranque, reação, sprint curto, mecânica em contexto de sequência técnica.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em velocidade. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-089",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Velocidade",
  "nome": "FUT-089 — Velocidade: sequência técnica",
  "nivel": "Intermediário",
  "tempo_medio_min": 30,
  "habilidades": "arranque, reação, sprint curto, mecânica"
}
```


### FUT-090 — Goleiro: desafio por pontos

- **Categoria:** Goleiro
- **Nível:** Avançado
- **Tempo médio:** 8 min
- **Aprimora:** base, reflexo, queda, reposição, leitura
- **Objetivo:** Aprimorar base, reflexo, queda, reposição, leitura em contexto de desafio por pontos.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em goleiro. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-090",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Goleiro",
  "nome": "FUT-090 — Goleiro: desafio por pontos",
  "nivel": "Avançado",
  "tempo_medio_min": 8,
  "habilidades": "base, reflexo, queda, reposição, leitura"
}
```


### FUT-091 — Bola parada: ondas de ataque

- **Categoria:** Bola parada
- **Nível:** Iniciante
- **Tempo médio:** 11 min
- **Aprimora:** cobrança, marcação, posicionamento, leitura de trajetória
- **Objetivo:** Aprimorar cobrança, marcação, posicionamento, leitura de trajetória em contexto de ondas de ataque.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em bola parada. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-091",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Bola parada",
  "nome": "FUT-091 — Bola parada: ondas de ataque",
  "nivel": "Iniciante",
  "tempo_medio_min": 11,
  "habilidades": "cobrança, marcação, posicionamento, leitura de trajetória"
}
```


### FUT-092 — Futsal aplicado: corrida com bola

- **Categoria:** Futsal aplicado
- **Nível:** Base
- **Tempo médio:** 14 min
- **Aprimora:** espaço curto, giro, domínio, decisões rápidas
- **Objetivo:** Aprimorar espaço curto, giro, domínio, decisões rápidas em contexto de corrida com bola.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em futsal aplicado. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-092",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Futsal aplicado",
  "nome": "FUT-092 — Futsal aplicado: corrida com bola",
  "nivel": "Base",
  "tempo_medio_min": 14,
  "habilidades": "espaço curto, giro, domínio, decisões rápidas"
}
```


### FUT-093 — Controle de bola: estação individual

- **Categoria:** Controle de bola
- **Nível:** Intermediário
- **Tempo médio:** 17 min
- **Aprimora:** controle, domínio, coordenação, confiança técnica
- **Objetivo:** Aprimorar controle, domínio, coordenação, confiança técnica em contexto de estação individual.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em controle de bola. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-093",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Controle de bola",
  "nome": "FUT-093 — Controle de bola: estação individual",
  "nivel": "Intermediário",
  "tempo_medio_min": 17,
  "habilidades": "controle, domínio, coordenação, confiança técnica"
}
```


### FUT-094 — Passe curto: parede/rebote

- **Categoria:** Passe curto
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Aprimora:** precisão, comunicação, tempo de passe, apoio
- **Objetivo:** Aprimorar precisão, comunicação, tempo de passe, apoio em contexto de parede/rebote.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em passe curto. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-094",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Passe curto",
  "nome": "FUT-094 — Passe curto: parede/rebote",
  "nivel": "Intermediário",
  "tempo_medio_min": 20,
  "habilidades": "precisão, comunicação, tempo de passe, apoio"
}
```


### FUT-095 — Passe longo: alvo marcado

- **Categoria:** Passe longo
- **Nível:** Avançado
- **Tempo médio:** 23 min
- **Aprimora:** força controlada, visão de jogo, mudança de corredor
- **Objetivo:** Aprimorar força controlada, visão de jogo, mudança de corredor em contexto de alvo marcado.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em passe longo. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-095",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Passe longo",
  "nome": "FUT-095 — Passe longo: alvo marcado",
  "nivel": "Avançado",
  "tempo_medio_min": 23,
  "habilidades": "força controlada, visão de jogo, mudança de corredor"
}
```


### FUT-096 — Primeiro toque: zona de decisão

- **Categoria:** Primeiro toque
- **Nível:** Iniciante
- **Tempo médio:** 26 min
- **Aprimora:** orientação corporal, domínio direcionado, velocidade de decisão
- **Objetivo:** Aprimorar orientação corporal, domínio direcionado, velocidade de decisão em contexto de zona de decisão.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em primeiro toque. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-096",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Primeiro toque",
  "nome": "FUT-096 — Primeiro toque: zona de decisão",
  "nivel": "Iniciante",
  "tempo_medio_min": 26,
  "habilidades": "orientação corporal, domínio direcionado, velocidade de decisão"
}
```


### FUT-097 — Drible: circuito em cones

- **Categoria:** Drible
- **Nível:** Base
- **Tempo médio:** 29 min
- **Aprimora:** finta, mudança de direção, criatividade, controle sob pressão
- **Objetivo:** Aprimorar finta, mudança de direção, criatividade, controle sob pressão em contexto de circuito em cones.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em drible. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-097",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Drible",
  "nome": "FUT-097 — Drible: circuito em cones",
  "nivel": "Base",
  "tempo_medio_min": 29,
  "habilidades": "finta, mudança de direção, criatividade, controle sob pressão"
}
```


### FUT-098 — Condução: duelo cronometrado

- **Categoria:** Condução
- **Nível:** Intermediário
- **Tempo médio:** 30 min
- **Aprimora:** toques curtos, aceleração, proteção da bola
- **Objetivo:** Aprimorar toques curtos, aceleração, proteção da bola em contexto de duelo cronometrado.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em condução. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-098",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Condução",
  "nome": "FUT-098 — Condução: duelo cronometrado",
  "nivel": "Intermediário",
  "tempo_medio_min": 30,
  "habilidades": "toques curtos, aceleração, proteção da bola"
}
```


### FUT-099 — Finalização: jogo reduzido

- **Categoria:** Finalização
- **Nível:** Intermediário
- **Tempo médio:** 8 min
- **Aprimora:** chute, ajuste corporal, escolha de canto, precisão
- **Objetivo:** Aprimorar chute, ajuste corporal, escolha de canto, precisão em contexto de jogo reduzido.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em finalização. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-099",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Finalização",
  "nome": "FUT-099 — Finalização: jogo reduzido",
  "nivel": "Intermediário",
  "tempo_medio_min": 8,
  "habilidades": "chute, ajuste corporal, escolha de canto, precisão"
}
```


### FUT-100 — Cruzamento: rondo progressivo

- **Categoria:** Cruzamento
- **Nível:** Avançado
- **Tempo médio:** 11 min
- **Aprimora:** bola lateral, timing, alvo, qualidade do passe
- **Objetivo:** Aprimorar bola lateral, timing, alvo, qualidade do passe em contexto de rondo progressivo.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em cruzamento. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-100",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Cruzamento",
  "nome": "FUT-100 — Cruzamento: rondo progressivo",
  "nivel": "Avançado",
  "tempo_medio_min": 11,
  "habilidades": "bola lateral, timing, alvo, qualidade do passe"
}
```


### FUT-101 — Cabeceio: sequência técnica

- **Categoria:** Cabeceio
- **Nível:** Iniciante
- **Tempo médio:** 14 min
- **Aprimora:** impulsão, coordenação, ataque à bola, direcionamento
- **Objetivo:** Aprimorar impulsão, coordenação, ataque à bola, direcionamento em contexto de sequência técnica.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em cabeceio. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-101",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Cabeceio",
  "nome": "FUT-101 — Cabeceio: sequência técnica",
  "nivel": "Iniciante",
  "tempo_medio_min": 14,
  "habilidades": "impulsão, coordenação, ataque à bola, direcionamento"
}
```


### FUT-102 — Rondo: desafio por pontos

- **Categoria:** Rondo
- **Nível:** Base
- **Tempo médio:** 17 min
- **Aprimora:** posse, tomada de decisão, pressão, linhas de passe
- **Objetivo:** Aprimorar posse, tomada de decisão, pressão, linhas de passe em contexto de desafio por pontos.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em rondo. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-102",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Rondo",
  "nome": "FUT-102 — Rondo: desafio por pontos",
  "nivel": "Base",
  "tempo_medio_min": 17,
  "habilidades": "posse, tomada de decisão, pressão, linhas de passe"
}
```


### FUT-103 — Marcação: ondas de ataque

- **Categoria:** Marcação
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Aprimora:** posicionamento, distância de combate, leitura defensiva
- **Objetivo:** Aprimorar posicionamento, distância de combate, leitura defensiva em contexto de ondas de ataque.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em marcação. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-103",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Marcação",
  "nome": "FUT-103 — Marcação: ondas de ataque",
  "nivel": "Intermediário",
  "tempo_medio_min": 20,
  "habilidades": "posicionamento, distância de combate, leitura defensiva"
}
```


### FUT-104 — Transição ofensiva: corrida com bola

- **Categoria:** Transição ofensiva
- **Nível:** Intermediário
- **Tempo médio:** 23 min
- **Aprimora:** velocidade, ataque ao espaço, decisão rápida
- **Objetivo:** Aprimorar velocidade, ataque ao espaço, decisão rápida em contexto de corrida com bola.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em transição ofensiva. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-104",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Transição ofensiva",
  "nome": "FUT-104 — Transição ofensiva: corrida com bola",
  "nivel": "Intermediário",
  "tempo_medio_min": 23,
  "habilidades": "velocidade, ataque ao espaço, decisão rápida"
}
```


### FUT-105 — Transição defensiva: estação individual

- **Categoria:** Transição defensiva
- **Nível:** Avançado
- **Tempo médio:** 26 min
- **Aprimora:** reação pós-perda, recomposição, pressão imediata
- **Objetivo:** Aprimorar reação pós-perda, recomposição, pressão imediata em contexto de estação individual.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em transição defensiva. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-105",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Transição defensiva",
  "nome": "FUT-105 — Transição defensiva: estação individual",
  "nivel": "Avançado",
  "tempo_medio_min": 26,
  "habilidades": "reação pós-perda, recomposição, pressão imediata"
}
```


### FUT-106 — 1 contra 1: parede/rebote

- **Categoria:** 1 contra 1
- **Nível:** Iniciante
- **Tempo médio:** 29 min
- **Aprimora:** duelo, coragem, proteção, leitura do adversário
- **Objetivo:** Aprimorar duelo, coragem, proteção, leitura do adversário em contexto de parede/rebote.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em 1 contra 1. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-106",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "1 contra 1",
  "nome": "FUT-106 — 1 contra 1: parede/rebote",
  "nivel": "Iniciante",
  "tempo_medio_min": 29,
  "habilidades": "duelo, coragem, proteção, leitura do adversário"
}
```


### FUT-107 — 2 contra 1: alvo marcado

- **Categoria:** 2 contra 1
- **Nível:** Base
- **Tempo médio:** 30 min
- **Aprimora:** vantagem numérica, passe final, temporização
- **Objetivo:** Aprimorar vantagem numérica, passe final, temporização em contexto de alvo marcado.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em 2 contra 1. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-107",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "2 contra 1",
  "nome": "FUT-107 — 2 contra 1: alvo marcado",
  "nivel": "Base",
  "tempo_medio_min": 30,
  "habilidades": "vantagem numérica, passe final, temporização"
}
```


### FUT-108 — 3 contra 2: zona de decisão

- **Categoria:** 3 contra 2
- **Nível:** Intermediário
- **Tempo médio:** 8 min
- **Aprimora:** superioridade, ocupação de espaço, tomada de decisão
- **Objetivo:** Aprimorar superioridade, ocupação de espaço, tomada de decisão em contexto de zona de decisão.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em 3 contra 2. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-108",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "3 contra 2",
  "nome": "FUT-108 — 3 contra 2: zona de decisão",
  "nivel": "Intermediário",
  "tempo_medio_min": 8,
  "habilidades": "superioridade, ocupação de espaço, tomada de decisão"
}
```


### FUT-109 — Posicionamento: circuito em cones

- **Categoria:** Posicionamento
- **Nível:** Intermediário
- **Tempo médio:** 11 min
- **Aprimora:** escaneamento, linhas, cobertura, amplitude
- **Objetivo:** Aprimorar escaneamento, linhas, cobertura, amplitude em contexto de circuito em cones.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em posicionamento. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-109",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Posicionamento",
  "nome": "FUT-109 — Posicionamento: circuito em cones",
  "nivel": "Intermediário",
  "tempo_medio_min": 11,
  "habilidades": "escaneamento, linhas, cobertura, amplitude"
}
```


### FUT-110 — Resistência com bola: duelo cronometrado

- **Categoria:** Resistência com bola
- **Nível:** Avançado
- **Tempo médio:** 14 min
- **Aprimora:** capacidade aeróbica, repetição técnica, ritmo
- **Objetivo:** Aprimorar capacidade aeróbica, repetição técnica, ritmo em contexto de duelo cronometrado.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em resistência com bola. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-110",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Resistência com bola",
  "nome": "FUT-110 — Resistência com bola: duelo cronometrado",
  "nivel": "Avançado",
  "tempo_medio_min": 14,
  "habilidades": "capacidade aeróbica, repetição técnica, ritmo"
}
```


### FUT-111 — Agilidade: jogo reduzido

- **Categoria:** Agilidade
- **Nível:** Iniciante
- **Tempo médio:** 17 min
- **Aprimora:** mudança de direção, freio, aceleração, equilíbrio
- **Objetivo:** Aprimorar mudança de direção, freio, aceleração, equilíbrio em contexto de jogo reduzido.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em agilidade. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-111",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Agilidade",
  "nome": "FUT-111 — Agilidade: jogo reduzido",
  "nivel": "Iniciante",
  "tempo_medio_min": 17,
  "habilidades": "mudança de direção, freio, aceleração, equilíbrio"
}
```


### FUT-112 — Velocidade: rondo progressivo

- **Categoria:** Velocidade
- **Nível:** Base
- **Tempo médio:** 20 min
- **Aprimora:** arranque, reação, sprint curto, mecânica
- **Objetivo:** Aprimorar arranque, reação, sprint curto, mecânica em contexto de rondo progressivo.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em velocidade. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-112",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Velocidade",
  "nome": "FUT-112 — Velocidade: rondo progressivo",
  "nivel": "Base",
  "tempo_medio_min": 20,
  "habilidades": "arranque, reação, sprint curto, mecânica"
}
```


### FUT-113 — Goleiro: sequência técnica

- **Categoria:** Goleiro
- **Nível:** Intermediário
- **Tempo médio:** 23 min
- **Aprimora:** base, reflexo, queda, reposição, leitura
- **Objetivo:** Aprimorar base, reflexo, queda, reposição, leitura em contexto de sequência técnica.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em goleiro. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-113",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Goleiro",
  "nome": "FUT-113 — Goleiro: sequência técnica",
  "nivel": "Intermediário",
  "tempo_medio_min": 23,
  "habilidades": "base, reflexo, queda, reposição, leitura"
}
```


### FUT-114 — Bola parada: desafio por pontos

- **Categoria:** Bola parada
- **Nível:** Intermediário
- **Tempo médio:** 26 min
- **Aprimora:** cobrança, marcação, posicionamento, leitura de trajetória
- **Objetivo:** Aprimorar cobrança, marcação, posicionamento, leitura de trajetória em contexto de desafio por pontos.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em bola parada. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-114",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Bola parada",
  "nome": "FUT-114 — Bola parada: desafio por pontos",
  "nivel": "Intermediário",
  "tempo_medio_min": 26,
  "habilidades": "cobrança, marcação, posicionamento, leitura de trajetória"
}
```


### FUT-115 — Futsal aplicado: ondas de ataque

- **Categoria:** Futsal aplicado
- **Nível:** Avançado
- **Tempo médio:** 29 min
- **Aprimora:** espaço curto, giro, domínio, decisões rápidas
- **Objetivo:** Aprimorar espaço curto, giro, domínio, decisões rápidas em contexto de ondas de ataque.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em futsal aplicado. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-115",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Futsal aplicado",
  "nome": "FUT-115 — Futsal aplicado: ondas de ataque",
  "nivel": "Avançado",
  "tempo_medio_min": 29,
  "habilidades": "espaço curto, giro, domínio, decisões rápidas"
}
```


### FUT-116 — Controle de bola: corrida com bola

- **Categoria:** Controle de bola
- **Nível:** Iniciante
- **Tempo médio:** 30 min
- **Aprimora:** controle, domínio, coordenação, confiança técnica
- **Objetivo:** Aprimorar controle, domínio, coordenação, confiança técnica em contexto de corrida com bola.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em controle de bola. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-116",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Controle de bola",
  "nome": "FUT-116 — Controle de bola: corrida com bola",
  "nivel": "Iniciante",
  "tempo_medio_min": 30,
  "habilidades": "controle, domínio, coordenação, confiança técnica"
}
```


### FUT-117 — Passe curto: estação individual

- **Categoria:** Passe curto
- **Nível:** Base
- **Tempo médio:** 8 min
- **Aprimora:** precisão, comunicação, tempo de passe, apoio
- **Objetivo:** Aprimorar precisão, comunicação, tempo de passe, apoio em contexto de estação individual.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em passe curto. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-117",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Passe curto",
  "nome": "FUT-117 — Passe curto: estação individual",
  "nivel": "Base",
  "tempo_medio_min": 8,
  "habilidades": "precisão, comunicação, tempo de passe, apoio"
}
```


### FUT-118 — Passe longo: parede/rebote

- **Categoria:** Passe longo
- **Nível:** Intermediário
- **Tempo médio:** 11 min
- **Aprimora:** força controlada, visão de jogo, mudança de corredor
- **Objetivo:** Aprimorar força controlada, visão de jogo, mudança de corredor em contexto de parede/rebote.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em passe longo. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-118",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Passe longo",
  "nome": "FUT-118 — Passe longo: parede/rebote",
  "nivel": "Intermediário",
  "tempo_medio_min": 11,
  "habilidades": "força controlada, visão de jogo, mudança de corredor"
}
```


### FUT-119 — Primeiro toque: alvo marcado

- **Categoria:** Primeiro toque
- **Nível:** Intermediário
- **Tempo médio:** 14 min
- **Aprimora:** orientação corporal, domínio direcionado, velocidade de decisão
- **Objetivo:** Aprimorar orientação corporal, domínio direcionado, velocidade de decisão em contexto de alvo marcado.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em primeiro toque. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-119",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Primeiro toque",
  "nome": "FUT-119 — Primeiro toque: alvo marcado",
  "nivel": "Intermediário",
  "tempo_medio_min": 14,
  "habilidades": "orientação corporal, domínio direcionado, velocidade de decisão"
}
```


### FUT-120 — Drible: zona de decisão

- **Categoria:** Drible
- **Nível:** Avançado
- **Tempo médio:** 17 min
- **Aprimora:** finta, mudança de direção, criatividade, controle sob pressão
- **Objetivo:** Aprimorar finta, mudança de direção, criatividade, controle sob pressão em contexto de zona de decisão.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em drible. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-120",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Drible",
  "nome": "FUT-120 — Drible: zona de decisão",
  "nivel": "Avançado",
  "tempo_medio_min": 17,
  "habilidades": "finta, mudança de direção, criatividade, controle sob pressão"
}
```


### FUT-121 — Condução: circuito em cones

- **Categoria:** Condução
- **Nível:** Iniciante
- **Tempo médio:** 20 min
- **Aprimora:** toques curtos, aceleração, proteção da bola
- **Objetivo:** Aprimorar toques curtos, aceleração, proteção da bola em contexto de circuito em cones.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em condução. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-121",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Condução",
  "nome": "FUT-121 — Condução: circuito em cones",
  "nivel": "Iniciante",
  "tempo_medio_min": 20,
  "habilidades": "toques curtos, aceleração, proteção da bola"
}
```


### FUT-122 — Finalização: duelo cronometrado

- **Categoria:** Finalização
- **Nível:** Base
- **Tempo médio:** 23 min
- **Aprimora:** chute, ajuste corporal, escolha de canto, precisão
- **Objetivo:** Aprimorar chute, ajuste corporal, escolha de canto, precisão em contexto de duelo cronometrado.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em finalização. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-122",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Finalização",
  "nome": "FUT-122 — Finalização: duelo cronometrado",
  "nivel": "Base",
  "tempo_medio_min": 23,
  "habilidades": "chute, ajuste corporal, escolha de canto, precisão"
}
```


### FUT-123 — Cruzamento: jogo reduzido

- **Categoria:** Cruzamento
- **Nível:** Intermediário
- **Tempo médio:** 26 min
- **Aprimora:** bola lateral, timing, alvo, qualidade do passe
- **Objetivo:** Aprimorar bola lateral, timing, alvo, qualidade do passe em contexto de jogo reduzido.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em cruzamento. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-123",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Cruzamento",
  "nome": "FUT-123 — Cruzamento: jogo reduzido",
  "nivel": "Intermediário",
  "tempo_medio_min": 26,
  "habilidades": "bola lateral, timing, alvo, qualidade do passe"
}
```


### FUT-124 — Cabeceio: rondo progressivo

- **Categoria:** Cabeceio
- **Nível:** Intermediário
- **Tempo médio:** 29 min
- **Aprimora:** impulsão, coordenação, ataque à bola, direcionamento
- **Objetivo:** Aprimorar impulsão, coordenação, ataque à bola, direcionamento em contexto de rondo progressivo.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em cabeceio. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-124",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Cabeceio",
  "nome": "FUT-124 — Cabeceio: rondo progressivo",
  "nivel": "Intermediário",
  "tempo_medio_min": 29,
  "habilidades": "impulsão, coordenação, ataque à bola, direcionamento"
}
```


### FUT-125 — Rondo: sequência técnica

- **Categoria:** Rondo
- **Nível:** Avançado
- **Tempo médio:** 30 min
- **Aprimora:** posse, tomada de decisão, pressão, linhas de passe
- **Objetivo:** Aprimorar posse, tomada de decisão, pressão, linhas de passe em contexto de sequência técnica.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em rondo. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-125",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Rondo",
  "nome": "FUT-125 — Rondo: sequência técnica",
  "nivel": "Avançado",
  "tempo_medio_min": 30,
  "habilidades": "posse, tomada de decisão, pressão, linhas de passe"
}
```


### FUT-126 — Marcação: desafio por pontos

- **Categoria:** Marcação
- **Nível:** Iniciante
- **Tempo médio:** 8 min
- **Aprimora:** posicionamento, distância de combate, leitura defensiva
- **Objetivo:** Aprimorar posicionamento, distância de combate, leitura defensiva em contexto de desafio por pontos.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em marcação. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-126",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Marcação",
  "nome": "FUT-126 — Marcação: desafio por pontos",
  "nivel": "Iniciante",
  "tempo_medio_min": 8,
  "habilidades": "posicionamento, distância de combate, leitura defensiva"
}
```


### FUT-127 — Transição ofensiva: ondas de ataque

- **Categoria:** Transição ofensiva
- **Nível:** Base
- **Tempo médio:** 11 min
- **Aprimora:** velocidade, ataque ao espaço, decisão rápida
- **Objetivo:** Aprimorar velocidade, ataque ao espaço, decisão rápida em contexto de ondas de ataque.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em transição ofensiva. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-127",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Transição ofensiva",
  "nome": "FUT-127 — Transição ofensiva: ondas de ataque",
  "nivel": "Base",
  "tempo_medio_min": 11,
  "habilidades": "velocidade, ataque ao espaço, decisão rápida"
}
```


### FUT-128 — Transição defensiva: corrida com bola

- **Categoria:** Transição defensiva
- **Nível:** Intermediário
- **Tempo médio:** 14 min
- **Aprimora:** reação pós-perda, recomposição, pressão imediata
- **Objetivo:** Aprimorar reação pós-perda, recomposição, pressão imediata em contexto de corrida com bola.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em transição defensiva. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-128",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "Transição defensiva",
  "nome": "FUT-128 — Transição defensiva: corrida com bola",
  "nivel": "Intermediário",
  "tempo_medio_min": 14,
  "habilidades": "reação pós-perda, recomposição, pressão imediata"
}
```


### FUT-129 — 1 contra 1: estação individual

- **Categoria:** 1 contra 1
- **Nível:** Intermediário
- **Tempo médio:** 17 min
- **Aprimora:** duelo, coragem, proteção, leitura do adversário
- **Objetivo:** Aprimorar duelo, coragem, proteção, leitura do adversário em contexto de estação individual.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em 1 contra 1. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-129",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "1 contra 1",
  "nome": "FUT-129 — 1 contra 1: estação individual",
  "nivel": "Intermediário",
  "tempo_medio_min": 17,
  "habilidades": "duelo, coragem, proteção, leitura do adversário"
}
```


### FUT-130 — 2 contra 1: parede/rebote

- **Categoria:** 2 contra 1
- **Nível:** Avançado
- **Tempo médio:** 20 min
- **Aprimora:** vantagem numérica, passe final, temporização
- **Objetivo:** Aprimorar vantagem numérica, passe final, temporização em contexto de parede/rebote.
- **Descrição:** Monte uma área segura e execute uma tarefa focada em 2 contra 1. O usuário deve repetir ações curtas, registrar acertos e manter qualidade técnica antes de aumentar velocidade. Priorize controle, postura, percepção do espaço e tomada de decisão.
- **Equipamentos:** bola, cones ou marcações; parede/gol pequeno quando disponível
- **Variações:** reduzir espaço para aumentar pressão, aumentar espaço para focar técnica, usar pé não dominante, incluir meta de acertos consecutivos
- **Métricas:** acertos, erros técnicos, tempo de execução, qualidade percebida 1-5
- **Cuidados:** Parar se houver dor; aquecer antes de sprints; evitar piso escorregadio.

```json
{
  "id": "FUT-130",
  "tipo": "exercicio",
  "modalidade": "futebol",
  "categoria": "2 contra 1",
  "nome": "FUT-130 — 2 contra 1: parede/rebote",
  "nivel": "Avançado",
  "tempo_medio_min": 20,
  "habilidades": "vantagem numérica, passe final, temporização"
}
```


---

# 5. Força e condicionamento muscular

| ID | Nome | Categoria | Nível | Tempo | Objetivo |
| --- | --- | --- | --- | --- | --- |
| FOR-001 | Agachamento livre — variação 1 | Força | Iniciante | 12 min | Desenvolver força de pernas. |
| FOR-002 | Flexão inclinada — variação 1 | Força | Base | 16 min | Desenvolver força de empurrar. |
| FOR-003 | Flexão tradicional — variação 1 | Força | Intermediário | 20 min | Desenvolver core. |
| FOR-004 | Prancha frontal — variação 1 | Força | Avançado | 24 min | Desenvolver estabilidade. |
| FOR-005 | Prancha lateral — variação 1 | Força | Iniciante | 28 min | Desenvolver resistência muscular. |
| FOR-006 | Avanço alternado — variação 1 | Força | Base | 32 min | Desenvolver força de pernas. |
| FOR-007 | Elevação de quadril — variação 1 | Força | Intermediário | 36 min | Desenvolver força de empurrar. |
| FOR-008 | Remada com mochila — variação 1 | Força | Avançado | 8 min | Desenvolver core. |
| FOR-009 | Desenvolvimento com mochila — variação 1 | Força | Iniciante | 12 min | Desenvolver estabilidade. |
| FOR-010 | Panturrilha em pé — variação 1 | Força | Base | 16 min | Desenvolver resistência muscular. |
| FOR-011 | Abdominal dead bug — variação 1 | Força | Intermediário | 20 min | Desenvolver força de pernas. |
| FOR-012 | Superman — variação 1 | Força | Avançado | 24 min | Desenvolver força de empurrar. |
| FOR-013 | Pike push-up — variação 1 | Força | Iniciante | 28 min | Desenvolver core. |
| FOR-014 | Isometria na parede — variação 1 | Força | Base | 32 min | Desenvolver estabilidade. |
| FOR-015 | Burpee técnico — variação 1 | Força | Intermediário | 36 min | Desenvolver resistência muscular. |
| FOR-016 | Agachamento sumô — variação 1 | Força | Avançado | 8 min | Desenvolver força de pernas. |
| FOR-017 | Good morning sem carga — variação 1 | Força | Iniciante | 12 min | Desenvolver força de empurrar. |
| FOR-018 | Afundo reverso — variação 1 | Força | Base | 16 min | Desenvolver core. |
| FOR-019 | Mountain climber — variação 1 | Força | Intermediário | 20 min | Desenvolver estabilidade. |
| FOR-020 | Hollow hold — variação 1 | Força | Avançado | 24 min | Desenvolver resistência muscular. |
| FOR-021 | Agachamento livre — variação 2 | Força | Iniciante | 28 min | Desenvolver força de pernas. |
| FOR-022 | Flexão inclinada — variação 2 | Força | Base | 32 min | Desenvolver força de empurrar. |
| FOR-023 | Flexão tradicional — variação 2 | Força | Intermediário | 36 min | Desenvolver core. |
| FOR-024 | Prancha frontal — variação 2 | Força | Avançado | 8 min | Desenvolver estabilidade. |
| FOR-025 | Prancha lateral — variação 2 | Força | Iniciante | 12 min | Desenvolver resistência muscular. |
| FOR-026 | Avanço alternado — variação 2 | Força | Base | 16 min | Desenvolver força de pernas. |
| FOR-027 | Elevação de quadril — variação 2 | Força | Intermediário | 20 min | Desenvolver força de empurrar. |
| FOR-028 | Remada com mochila — variação 2 | Força | Avançado | 24 min | Desenvolver core. |
| FOR-029 | Desenvolvimento com mochila — variação 2 | Força | Iniciante | 28 min | Desenvolver estabilidade. |
| FOR-030 | Panturrilha em pé — variação 2 | Força | Base | 32 min | Desenvolver resistência muscular. |
| FOR-031 | Abdominal dead bug — variação 2 | Força | Intermediário | 36 min | Desenvolver força de pernas. |
| FOR-032 | Superman — variação 2 | Força | Avançado | 8 min | Desenvolver força de empurrar. |
| FOR-033 | Pike push-up — variação 2 | Força | Iniciante | 12 min | Desenvolver core. |
| FOR-034 | Isometria na parede — variação 2 | Força | Base | 16 min | Desenvolver estabilidade. |
| FOR-035 | Burpee técnico — variação 2 | Força | Intermediário | 20 min | Desenvolver resistência muscular. |
| FOR-036 | Agachamento sumô — variação 2 | Força | Avançado | 24 min | Desenvolver força de pernas. |
| FOR-037 | Good morning sem carga — variação 2 | Força | Iniciante | 28 min | Desenvolver força de empurrar. |
| FOR-038 | Afundo reverso — variação 2 | Força | Base | 32 min | Desenvolver core. |
| FOR-039 | Mountain climber — variação 2 | Força | Intermediário | 36 min | Desenvolver estabilidade. |
| FOR-040 | Hollow hold — variação 2 | Força | Avançado | 8 min | Desenvolver resistência muscular. |
| FOR-041 | Agachamento livre — variação 3 | Força | Iniciante | 12 min | Desenvolver força de pernas. |
| FOR-042 | Flexão inclinada — variação 3 | Força | Base | 16 min | Desenvolver força de empurrar. |
| FOR-043 | Flexão tradicional — variação 3 | Força | Intermediário | 20 min | Desenvolver core. |
| FOR-044 | Prancha frontal — variação 3 | Força | Avançado | 24 min | Desenvolver estabilidade. |
| FOR-045 | Prancha lateral — variação 3 | Força | Iniciante | 28 min | Desenvolver resistência muscular. |

## Detalhamento


### FOR-001 — Agachamento livre — variação 1

- **Categoria:** Força
- **Nível:** Iniciante
- **Tempo médio:** 12 min
- **Objetivo:** Desenvolver força de pernas.
- **Descrição:** Executar agachamento livre com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-002 — Flexão inclinada — variação 1

- **Categoria:** Força
- **Nível:** Base
- **Tempo médio:** 16 min
- **Objetivo:** Desenvolver força de empurrar.
- **Descrição:** Executar flexão inclinada com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-003 — Flexão tradicional — variação 1

- **Categoria:** Força
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Objetivo:** Desenvolver core.
- **Descrição:** Executar flexão tradicional com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-004 — Prancha frontal — variação 1

- **Categoria:** Força
- **Nível:** Avançado
- **Tempo médio:** 24 min
- **Objetivo:** Desenvolver estabilidade.
- **Descrição:** Executar prancha frontal com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-005 — Prancha lateral — variação 1

- **Categoria:** Força
- **Nível:** Iniciante
- **Tempo médio:** 28 min
- **Objetivo:** Desenvolver resistência muscular.
- **Descrição:** Executar prancha lateral com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-006 — Avanço alternado — variação 1

- **Categoria:** Força
- **Nível:** Base
- **Tempo médio:** 32 min
- **Objetivo:** Desenvolver força de pernas.
- **Descrição:** Executar avanço alternado com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-007 — Elevação de quadril — variação 1

- **Categoria:** Força
- **Nível:** Intermediário
- **Tempo médio:** 36 min
- **Objetivo:** Desenvolver força de empurrar.
- **Descrição:** Executar elevação de quadril com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-008 — Remada com mochila — variação 1

- **Categoria:** Força
- **Nível:** Avançado
- **Tempo médio:** 8 min
- **Objetivo:** Desenvolver core.
- **Descrição:** Executar remada com mochila com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-009 — Desenvolvimento com mochila — variação 1

- **Categoria:** Força
- **Nível:** Iniciante
- **Tempo médio:** 12 min
- **Objetivo:** Desenvolver estabilidade.
- **Descrição:** Executar desenvolvimento com mochila com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-010 — Panturrilha em pé — variação 1

- **Categoria:** Força
- **Nível:** Base
- **Tempo médio:** 16 min
- **Objetivo:** Desenvolver resistência muscular.
- **Descrição:** Executar panturrilha em pé com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-011 — Abdominal dead bug — variação 1

- **Categoria:** Força
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Objetivo:** Desenvolver força de pernas.
- **Descrição:** Executar abdominal dead bug com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-012 — Superman — variação 1

- **Categoria:** Força
- **Nível:** Avançado
- **Tempo médio:** 24 min
- **Objetivo:** Desenvolver força de empurrar.
- **Descrição:** Executar superman com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-013 — Pike push-up — variação 1

- **Categoria:** Força
- **Nível:** Iniciante
- **Tempo médio:** 28 min
- **Objetivo:** Desenvolver core.
- **Descrição:** Executar pike push-up com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-014 — Isometria na parede — variação 1

- **Categoria:** Força
- **Nível:** Base
- **Tempo médio:** 32 min
- **Objetivo:** Desenvolver estabilidade.
- **Descrição:** Executar isometria na parede com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-015 — Burpee técnico — variação 1

- **Categoria:** Força
- **Nível:** Intermediário
- **Tempo médio:** 36 min
- **Objetivo:** Desenvolver resistência muscular.
- **Descrição:** Executar burpee técnico com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-016 — Agachamento sumô — variação 1

- **Categoria:** Força
- **Nível:** Avançado
- **Tempo médio:** 8 min
- **Objetivo:** Desenvolver força de pernas.
- **Descrição:** Executar agachamento sumô com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-017 — Good morning sem carga — variação 1

- **Categoria:** Força
- **Nível:** Iniciante
- **Tempo médio:** 12 min
- **Objetivo:** Desenvolver força de empurrar.
- **Descrição:** Executar good morning sem carga com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-018 — Afundo reverso — variação 1

- **Categoria:** Força
- **Nível:** Base
- **Tempo médio:** 16 min
- **Objetivo:** Desenvolver core.
- **Descrição:** Executar afundo reverso com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-019 — Mountain climber — variação 1

- **Categoria:** Força
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Objetivo:** Desenvolver estabilidade.
- **Descrição:** Executar mountain climber com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-020 — Hollow hold — variação 1

- **Categoria:** Força
- **Nível:** Avançado
- **Tempo médio:** 24 min
- **Objetivo:** Desenvolver resistência muscular.
- **Descrição:** Executar hollow hold com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-021 — Agachamento livre — variação 2

- **Categoria:** Força
- **Nível:** Iniciante
- **Tempo médio:** 28 min
- **Objetivo:** Desenvolver força de pernas.
- **Descrição:** Executar agachamento livre com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-022 — Flexão inclinada — variação 2

- **Categoria:** Força
- **Nível:** Base
- **Tempo médio:** 32 min
- **Objetivo:** Desenvolver força de empurrar.
- **Descrição:** Executar flexão inclinada com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-023 — Flexão tradicional — variação 2

- **Categoria:** Força
- **Nível:** Intermediário
- **Tempo médio:** 36 min
- **Objetivo:** Desenvolver core.
- **Descrição:** Executar flexão tradicional com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-024 — Prancha frontal — variação 2

- **Categoria:** Força
- **Nível:** Avançado
- **Tempo médio:** 8 min
- **Objetivo:** Desenvolver estabilidade.
- **Descrição:** Executar prancha frontal com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-025 — Prancha lateral — variação 2

- **Categoria:** Força
- **Nível:** Iniciante
- **Tempo médio:** 12 min
- **Objetivo:** Desenvolver resistência muscular.
- **Descrição:** Executar prancha lateral com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-026 — Avanço alternado — variação 2

- **Categoria:** Força
- **Nível:** Base
- **Tempo médio:** 16 min
- **Objetivo:** Desenvolver força de pernas.
- **Descrição:** Executar avanço alternado com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-027 — Elevação de quadril — variação 2

- **Categoria:** Força
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Objetivo:** Desenvolver força de empurrar.
- **Descrição:** Executar elevação de quadril com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-028 — Remada com mochila — variação 2

- **Categoria:** Força
- **Nível:** Avançado
- **Tempo médio:** 24 min
- **Objetivo:** Desenvolver core.
- **Descrição:** Executar remada com mochila com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-029 — Desenvolvimento com mochila — variação 2

- **Categoria:** Força
- **Nível:** Iniciante
- **Tempo médio:** 28 min
- **Objetivo:** Desenvolver estabilidade.
- **Descrição:** Executar desenvolvimento com mochila com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-030 — Panturrilha em pé — variação 2

- **Categoria:** Força
- **Nível:** Base
- **Tempo médio:** 32 min
- **Objetivo:** Desenvolver resistência muscular.
- **Descrição:** Executar panturrilha em pé com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-031 — Abdominal dead bug — variação 2

- **Categoria:** Força
- **Nível:** Intermediário
- **Tempo médio:** 36 min
- **Objetivo:** Desenvolver força de pernas.
- **Descrição:** Executar abdominal dead bug com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-032 — Superman — variação 2

- **Categoria:** Força
- **Nível:** Avançado
- **Tempo médio:** 8 min
- **Objetivo:** Desenvolver força de empurrar.
- **Descrição:** Executar superman com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-033 — Pike push-up — variação 2

- **Categoria:** Força
- **Nível:** Iniciante
- **Tempo médio:** 12 min
- **Objetivo:** Desenvolver core.
- **Descrição:** Executar pike push-up com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-034 — Isometria na parede — variação 2

- **Categoria:** Força
- **Nível:** Base
- **Tempo médio:** 16 min
- **Objetivo:** Desenvolver estabilidade.
- **Descrição:** Executar isometria na parede com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-035 — Burpee técnico — variação 2

- **Categoria:** Força
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Objetivo:** Desenvolver resistência muscular.
- **Descrição:** Executar burpee técnico com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-036 — Agachamento sumô — variação 2

- **Categoria:** Força
- **Nível:** Avançado
- **Tempo médio:** 24 min
- **Objetivo:** Desenvolver força de pernas.
- **Descrição:** Executar agachamento sumô com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-037 — Good morning sem carga — variação 2

- **Categoria:** Força
- **Nível:** Iniciante
- **Tempo médio:** 28 min
- **Objetivo:** Desenvolver força de empurrar.
- **Descrição:** Executar good morning sem carga com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-038 — Afundo reverso — variação 2

- **Categoria:** Força
- **Nível:** Base
- **Tempo médio:** 32 min
- **Objetivo:** Desenvolver core.
- **Descrição:** Executar afundo reverso com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-039 — Mountain climber — variação 2

- **Categoria:** Força
- **Nível:** Intermediário
- **Tempo médio:** 36 min
- **Objetivo:** Desenvolver estabilidade.
- **Descrição:** Executar mountain climber com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-040 — Hollow hold — variação 2

- **Categoria:** Força
- **Nível:** Avançado
- **Tempo médio:** 8 min
- **Objetivo:** Desenvolver resistência muscular.
- **Descrição:** Executar hollow hold com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-041 — Agachamento livre — variação 3

- **Categoria:** Força
- **Nível:** Iniciante
- **Tempo médio:** 12 min
- **Objetivo:** Desenvolver força de pernas.
- **Descrição:** Executar agachamento livre com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-042 — Flexão inclinada — variação 3

- **Categoria:** Força
- **Nível:** Base
- **Tempo médio:** 16 min
- **Objetivo:** Desenvolver força de empurrar.
- **Descrição:** Executar flexão inclinada com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-043 — Flexão tradicional — variação 3

- **Categoria:** Força
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Objetivo:** Desenvolver core.
- **Descrição:** Executar flexão tradicional com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-044 — Prancha frontal — variação 3

- **Categoria:** Força
- **Nível:** Avançado
- **Tempo médio:** 24 min
- **Objetivo:** Desenvolver estabilidade.
- **Descrição:** Executar prancha frontal com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### FOR-045 — Prancha lateral — variação 3

- **Categoria:** Força
- **Nível:** Iniciante
- **Tempo médio:** 28 min
- **Objetivo:** Desenvolver resistência muscular.
- **Descrição:** Executar prancha lateral com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


---

# 6. Mobilidade e alongamento

| ID | Nome | Categoria | Nível | Tempo | Objetivo |
| --- | --- | --- | --- | --- | --- |
| MOB-001 | Mobilidade de tornozelo — variação 1 | Mobilidade e alongamento | Iniciante | 10 min | Desenvolver amplitude articular. |
| MOB-002 | Círculos de quadril — variação 1 | Mobilidade e alongamento | Base | 14 min | Desenvolver postura. |
| MOB-003 | Rotação torácica — variação 1 | Mobilidade e alongamento | Intermediário | 18 min | Desenvolver recuperação. |
| MOB-004 | Alongamento de posterior — variação 1 | Mobilidade e alongamento | Avançado | 22 min | Desenvolver controle motor. |
| MOB-005 | Alongamento de flexor do quadril — variação 1 | Mobilidade e alongamento | Iniciante | 26 min | Desenvolver prevenção de sobrecarga. |
| MOB-006 | Mobilidade de ombro — variação 1 | Mobilidade e alongamento | Base | 30 min | Desenvolver amplitude articular. |
| MOB-007 | Cat-cow — variação 1 | Mobilidade e alongamento | Intermediário | 34 min | Desenvolver postura. |
| MOB-008 | World's greatest stretch — variação 1 | Mobilidade e alongamento | Avançado | 6 min | Desenvolver recuperação. |
| MOB-009 | Agachamento profundo assistido — variação 1 | Mobilidade e alongamento | Iniciante | 10 min | Desenvolver controle motor. |
| MOB-010 | Liberação de panturrilha — variação 1 | Mobilidade e alongamento | Base | 14 min | Desenvolver prevenção de sobrecarga. |
| MOB-011 | Elevação escapular controlada — variação 1 | Mobilidade e alongamento | Intermediário | 18 min | Desenvolver amplitude articular. |
| MOB-012 | Alongamento de peitoral — variação 1 | Mobilidade e alongamento | Avançado | 22 min | Desenvolver postura. |
| MOB-013 | Mobilidade de punho — variação 1 | Mobilidade e alongamento | Iniciante | 26 min | Desenvolver recuperação. |
| MOB-014 | Cossack squat assistido — variação 1 | Mobilidade e alongamento | Base | 30 min | Desenvolver controle motor. |
| MOB-015 | Respiração diafragmática — variação 1 | Mobilidade e alongamento | Intermediário | 34 min | Desenvolver prevenção de sobrecarga. |
| MOB-016 | Mobilidade de tornozelo — variação 2 | Mobilidade e alongamento | Avançado | 6 min | Desenvolver amplitude articular. |
| MOB-017 | Círculos de quadril — variação 2 | Mobilidade e alongamento | Iniciante | 10 min | Desenvolver postura. |
| MOB-018 | Rotação torácica — variação 2 | Mobilidade e alongamento | Base | 14 min | Desenvolver recuperação. |
| MOB-019 | Alongamento de posterior — variação 2 | Mobilidade e alongamento | Intermediário | 18 min | Desenvolver controle motor. |
| MOB-020 | Alongamento de flexor do quadril — variação 2 | Mobilidade e alongamento | Avançado | 22 min | Desenvolver prevenção de sobrecarga. |
| MOB-021 | Mobilidade de ombro — variação 2 | Mobilidade e alongamento | Iniciante | 26 min | Desenvolver amplitude articular. |
| MOB-022 | Cat-cow — variação 2 | Mobilidade e alongamento | Base | 30 min | Desenvolver postura. |
| MOB-023 | World's greatest stretch — variação 2 | Mobilidade e alongamento | Intermediário | 34 min | Desenvolver recuperação. |
| MOB-024 | Agachamento profundo assistido — variação 2 | Mobilidade e alongamento | Avançado | 6 min | Desenvolver controle motor. |
| MOB-025 | Liberação de panturrilha — variação 2 | Mobilidade e alongamento | Iniciante | 10 min | Desenvolver prevenção de sobrecarga. |
| MOB-026 | Elevação escapular controlada — variação 2 | Mobilidade e alongamento | Base | 14 min | Desenvolver amplitude articular. |
| MOB-027 | Alongamento de peitoral — variação 2 | Mobilidade e alongamento | Intermediário | 18 min | Desenvolver postura. |
| MOB-028 | Mobilidade de punho — variação 2 | Mobilidade e alongamento | Avançado | 22 min | Desenvolver recuperação. |
| MOB-029 | Cossack squat assistido — variação 2 | Mobilidade e alongamento | Iniciante | 26 min | Desenvolver controle motor. |
| MOB-030 | Respiração diafragmática — variação 2 | Mobilidade e alongamento | Base | 30 min | Desenvolver prevenção de sobrecarga. |
| MOB-031 | Mobilidade de tornozelo — variação 3 | Mobilidade e alongamento | Intermediário | 34 min | Desenvolver amplitude articular. |
| MOB-032 | Círculos de quadril — variação 3 | Mobilidade e alongamento | Avançado | 6 min | Desenvolver postura. |
| MOB-033 | Rotação torácica — variação 3 | Mobilidade e alongamento | Iniciante | 10 min | Desenvolver recuperação. |
| MOB-034 | Alongamento de posterior — variação 3 | Mobilidade e alongamento | Base | 14 min | Desenvolver controle motor. |
| MOB-035 | Alongamento de flexor do quadril — variação 3 | Mobilidade e alongamento | Intermediário | 18 min | Desenvolver prevenção de sobrecarga. |

## Detalhamento


### MOB-001 — Mobilidade de tornozelo — variação 1

- **Categoria:** Mobilidade e alongamento
- **Nível:** Iniciante
- **Tempo médio:** 10 min
- **Objetivo:** Desenvolver amplitude articular.
- **Descrição:** Executar mobilidade de tornozelo com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-002 — Círculos de quadril — variação 1

- **Categoria:** Mobilidade e alongamento
- **Nível:** Base
- **Tempo médio:** 14 min
- **Objetivo:** Desenvolver postura.
- **Descrição:** Executar círculos de quadril com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-003 — Rotação torácica — variação 1

- **Categoria:** Mobilidade e alongamento
- **Nível:** Intermediário
- **Tempo médio:** 18 min
- **Objetivo:** Desenvolver recuperação.
- **Descrição:** Executar rotação torácica com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-004 — Alongamento de posterior — variação 1

- **Categoria:** Mobilidade e alongamento
- **Nível:** Avançado
- **Tempo médio:** 22 min
- **Objetivo:** Desenvolver controle motor.
- **Descrição:** Executar alongamento de posterior com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-005 — Alongamento de flexor do quadril — variação 1

- **Categoria:** Mobilidade e alongamento
- **Nível:** Iniciante
- **Tempo médio:** 26 min
- **Objetivo:** Desenvolver prevenção de sobrecarga.
- **Descrição:** Executar alongamento de flexor do quadril com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-006 — Mobilidade de ombro — variação 1

- **Categoria:** Mobilidade e alongamento
- **Nível:** Base
- **Tempo médio:** 30 min
- **Objetivo:** Desenvolver amplitude articular.
- **Descrição:** Executar mobilidade de ombro com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-007 — Cat-cow — variação 1

- **Categoria:** Mobilidade e alongamento
- **Nível:** Intermediário
- **Tempo médio:** 34 min
- **Objetivo:** Desenvolver postura.
- **Descrição:** Executar cat-cow com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-008 — World's greatest stretch — variação 1

- **Categoria:** Mobilidade e alongamento
- **Nível:** Avançado
- **Tempo médio:** 6 min
- **Objetivo:** Desenvolver recuperação.
- **Descrição:** Executar world's greatest stretch com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-009 — Agachamento profundo assistido — variação 1

- **Categoria:** Mobilidade e alongamento
- **Nível:** Iniciante
- **Tempo médio:** 10 min
- **Objetivo:** Desenvolver controle motor.
- **Descrição:** Executar agachamento profundo assistido com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-010 — Liberação de panturrilha — variação 1

- **Categoria:** Mobilidade e alongamento
- **Nível:** Base
- **Tempo médio:** 14 min
- **Objetivo:** Desenvolver prevenção de sobrecarga.
- **Descrição:** Executar liberação de panturrilha com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-011 — Elevação escapular controlada — variação 1

- **Categoria:** Mobilidade e alongamento
- **Nível:** Intermediário
- **Tempo médio:** 18 min
- **Objetivo:** Desenvolver amplitude articular.
- **Descrição:** Executar elevação escapular controlada com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-012 — Alongamento de peitoral — variação 1

- **Categoria:** Mobilidade e alongamento
- **Nível:** Avançado
- **Tempo médio:** 22 min
- **Objetivo:** Desenvolver postura.
- **Descrição:** Executar alongamento de peitoral com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-013 — Mobilidade de punho — variação 1

- **Categoria:** Mobilidade e alongamento
- **Nível:** Iniciante
- **Tempo médio:** 26 min
- **Objetivo:** Desenvolver recuperação.
- **Descrição:** Executar mobilidade de punho com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-014 — Cossack squat assistido — variação 1

- **Categoria:** Mobilidade e alongamento
- **Nível:** Base
- **Tempo médio:** 30 min
- **Objetivo:** Desenvolver controle motor.
- **Descrição:** Executar cossack squat assistido com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-015 — Respiração diafragmática — variação 1

- **Categoria:** Mobilidade e alongamento
- **Nível:** Intermediário
- **Tempo médio:** 34 min
- **Objetivo:** Desenvolver prevenção de sobrecarga.
- **Descrição:** Executar respiração diafragmática com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-016 — Mobilidade de tornozelo — variação 2

- **Categoria:** Mobilidade e alongamento
- **Nível:** Avançado
- **Tempo médio:** 6 min
- **Objetivo:** Desenvolver amplitude articular.
- **Descrição:** Executar mobilidade de tornozelo com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-017 — Círculos de quadril — variação 2

- **Categoria:** Mobilidade e alongamento
- **Nível:** Iniciante
- **Tempo médio:** 10 min
- **Objetivo:** Desenvolver postura.
- **Descrição:** Executar círculos de quadril com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-018 — Rotação torácica — variação 2

- **Categoria:** Mobilidade e alongamento
- **Nível:** Base
- **Tempo médio:** 14 min
- **Objetivo:** Desenvolver recuperação.
- **Descrição:** Executar rotação torácica com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-019 — Alongamento de posterior — variação 2

- **Categoria:** Mobilidade e alongamento
- **Nível:** Intermediário
- **Tempo médio:** 18 min
- **Objetivo:** Desenvolver controle motor.
- **Descrição:** Executar alongamento de posterior com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-020 — Alongamento de flexor do quadril — variação 2

- **Categoria:** Mobilidade e alongamento
- **Nível:** Avançado
- **Tempo médio:** 22 min
- **Objetivo:** Desenvolver prevenção de sobrecarga.
- **Descrição:** Executar alongamento de flexor do quadril com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-021 — Mobilidade de ombro — variação 2

- **Categoria:** Mobilidade e alongamento
- **Nível:** Iniciante
- **Tempo médio:** 26 min
- **Objetivo:** Desenvolver amplitude articular.
- **Descrição:** Executar mobilidade de ombro com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-022 — Cat-cow — variação 2

- **Categoria:** Mobilidade e alongamento
- **Nível:** Base
- **Tempo médio:** 30 min
- **Objetivo:** Desenvolver postura.
- **Descrição:** Executar cat-cow com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-023 — World's greatest stretch — variação 2

- **Categoria:** Mobilidade e alongamento
- **Nível:** Intermediário
- **Tempo médio:** 34 min
- **Objetivo:** Desenvolver recuperação.
- **Descrição:** Executar world's greatest stretch com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-024 — Agachamento profundo assistido — variação 2

- **Categoria:** Mobilidade e alongamento
- **Nível:** Avançado
- **Tempo médio:** 6 min
- **Objetivo:** Desenvolver controle motor.
- **Descrição:** Executar agachamento profundo assistido com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-025 — Liberação de panturrilha — variação 2

- **Categoria:** Mobilidade e alongamento
- **Nível:** Iniciante
- **Tempo médio:** 10 min
- **Objetivo:** Desenvolver prevenção de sobrecarga.
- **Descrição:** Executar liberação de panturrilha com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-026 — Elevação escapular controlada — variação 2

- **Categoria:** Mobilidade e alongamento
- **Nível:** Base
- **Tempo médio:** 14 min
- **Objetivo:** Desenvolver amplitude articular.
- **Descrição:** Executar elevação escapular controlada com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-027 — Alongamento de peitoral — variação 2

- **Categoria:** Mobilidade e alongamento
- **Nível:** Intermediário
- **Tempo médio:** 18 min
- **Objetivo:** Desenvolver postura.
- **Descrição:** Executar alongamento de peitoral com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-028 — Mobilidade de punho — variação 2

- **Categoria:** Mobilidade e alongamento
- **Nível:** Avançado
- **Tempo médio:** 22 min
- **Objetivo:** Desenvolver recuperação.
- **Descrição:** Executar mobilidade de punho com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-029 — Cossack squat assistido — variação 2

- **Categoria:** Mobilidade e alongamento
- **Nível:** Iniciante
- **Tempo médio:** 26 min
- **Objetivo:** Desenvolver controle motor.
- **Descrição:** Executar cossack squat assistido com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-030 — Respiração diafragmática — variação 2

- **Categoria:** Mobilidade e alongamento
- **Nível:** Base
- **Tempo médio:** 30 min
- **Objetivo:** Desenvolver prevenção de sobrecarga.
- **Descrição:** Executar respiração diafragmática com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-031 — Mobilidade de tornozelo — variação 3

- **Categoria:** Mobilidade e alongamento
- **Nível:** Intermediário
- **Tempo médio:** 34 min
- **Objetivo:** Desenvolver amplitude articular.
- **Descrição:** Executar mobilidade de tornozelo com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-032 — Círculos de quadril — variação 3

- **Categoria:** Mobilidade e alongamento
- **Nível:** Avançado
- **Tempo médio:** 6 min
- **Objetivo:** Desenvolver postura.
- **Descrição:** Executar círculos de quadril com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-033 — Rotação torácica — variação 3

- **Categoria:** Mobilidade e alongamento
- **Nível:** Iniciante
- **Tempo médio:** 10 min
- **Objetivo:** Desenvolver recuperação.
- **Descrição:** Executar rotação torácica com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-034 — Alongamento de posterior — variação 3

- **Categoria:** Mobilidade e alongamento
- **Nível:** Base
- **Tempo médio:** 14 min
- **Objetivo:** Desenvolver controle motor.
- **Descrição:** Executar alongamento de posterior com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### MOB-035 — Alongamento de flexor do quadril — variação 3

- **Categoria:** Mobilidade e alongamento
- **Nível:** Intermediário
- **Tempo médio:** 18 min
- **Objetivo:** Desenvolver prevenção de sobrecarga.
- **Descrição:** Executar alongamento de flexor do quadril com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


---

# 7. Karatê técnico/esportivo

| ID | Nome | Categoria | Nível | Tempo | Objetivo |
| --- | --- | --- | --- | --- | --- |
| KRT-001 | Guarda e base zenkutsu-dachi — variação 1 | Karatê esportivo e técnico | Iniciante | 12 min | Desenvolver coordenação. |
| KRT-002 | Base kokutsu-dachi — variação 1 | Karatê esportivo e técnico | Base | 16 min | Desenvolver equilíbrio. |
| KRT-003 | Base kiba-dachi — variação 1 | Karatê esportivo e técnico | Intermediário | 20 min | Desenvolver técnica. |
| KRT-004 | Oi-zuki técnico — variação 1 | Karatê esportivo e técnico | Avançado | 24 min | Desenvolver controle de distância. |
| KRT-005 | Gyaku-zuki técnico — variação 1 | Karatê esportivo e técnico | Iniciante | 28 min | Desenvolver disciplina motora. |
| KRT-006 | Mae-geri controlado — variação 1 | Karatê esportivo e técnico | Base | 32 min | Desenvolver coordenação. |
| KRT-007 | Yoko-geri controlado — variação 1 | Karatê esportivo e técnico | Intermediário | 36 min | Desenvolver equilíbrio. |
| KRT-008 | Mawashi-geri controlado — variação 1 | Karatê esportivo e técnico | Avançado | 8 min | Desenvolver técnica. |
| KRT-009 | Age-uke — variação 1 | Karatê esportivo e técnico | Iniciante | 12 min | Desenvolver controle de distância. |
| KRT-010 | Soto-uke — variação 1 | Karatê esportivo e técnico | Base | 16 min | Desenvolver disciplina motora. |
| KRT-011 | Uchi-uke — variação 1 | Karatê esportivo e técnico | Intermediário | 20 min | Desenvolver coordenação. |
| KRT-012 | Gedan-barai — variação 1 | Karatê esportivo e técnico | Avançado | 24 min | Desenvolver equilíbrio. |
| KRT-013 | Sequência kihon 1 — variação 1 | Karatê esportivo e técnico | Iniciante | 28 min | Desenvolver técnica. |
| KRT-014 | Sequência kihon 2 — variação 1 | Karatê esportivo e técnico | Base | 32 min | Desenvolver controle de distância. |
| KRT-015 | Deslocamento com guarda — variação 1 | Karatê esportivo e técnico | Intermediário | 36 min | Desenvolver disciplina motora. |
| KRT-016 | Kumite sombra — variação 1 | Karatê esportivo e técnico | Avançado | 8 min | Desenvolver coordenação. |
| KRT-017 | Controle de distância — variação 1 | Karatê esportivo e técnico | Iniciante | 12 min | Desenvolver equilíbrio. |
| KRT-018 | Entrada e saída — variação 1 | Karatê esportivo e técnico | Base | 16 min | Desenvolver técnica. |
| KRT-019 | Respiração e kiai técnico — variação 1 | Karatê esportivo e técnico | Intermediário | 20 min | Desenvolver controle de distância. |
| KRT-020 | Kata por blocos — variação 1 | Karatê esportivo e técnico | Avançado | 24 min | Desenvolver disciplina motora. |
| KRT-021 | Guarda e base zenkutsu-dachi — variação 2 | Karatê esportivo e técnico | Iniciante | 28 min | Desenvolver coordenação. |
| KRT-022 | Base kokutsu-dachi — variação 2 | Karatê esportivo e técnico | Base | 32 min | Desenvolver equilíbrio. |
| KRT-023 | Base kiba-dachi — variação 2 | Karatê esportivo e técnico | Intermediário | 36 min | Desenvolver técnica. |
| KRT-024 | Oi-zuki técnico — variação 2 | Karatê esportivo e técnico | Avançado | 8 min | Desenvolver controle de distância. |
| KRT-025 | Gyaku-zuki técnico — variação 2 | Karatê esportivo e técnico | Iniciante | 12 min | Desenvolver disciplina motora. |
| KRT-026 | Mae-geri controlado — variação 2 | Karatê esportivo e técnico | Base | 16 min | Desenvolver coordenação. |
| KRT-027 | Yoko-geri controlado — variação 2 | Karatê esportivo e técnico | Intermediário | 20 min | Desenvolver equilíbrio. |
| KRT-028 | Mawashi-geri controlado — variação 2 | Karatê esportivo e técnico | Avançado | 24 min | Desenvolver técnica. |
| KRT-029 | Age-uke — variação 2 | Karatê esportivo e técnico | Iniciante | 28 min | Desenvolver controle de distância. |
| KRT-030 | Soto-uke — variação 2 | Karatê esportivo e técnico | Base | 32 min | Desenvolver disciplina motora. |
| KRT-031 | Uchi-uke — variação 2 | Karatê esportivo e técnico | Intermediário | 36 min | Desenvolver coordenação. |
| KRT-032 | Gedan-barai — variação 2 | Karatê esportivo e técnico | Avançado | 8 min | Desenvolver equilíbrio. |
| KRT-033 | Sequência kihon 1 — variação 2 | Karatê esportivo e técnico | Iniciante | 12 min | Desenvolver técnica. |
| KRT-034 | Sequência kihon 2 — variação 2 | Karatê esportivo e técnico | Base | 16 min | Desenvolver controle de distância. |
| KRT-035 | Deslocamento com guarda — variação 2 | Karatê esportivo e técnico | Intermediário | 20 min | Desenvolver disciplina motora. |
| KRT-036 | Kumite sombra — variação 2 | Karatê esportivo e técnico | Avançado | 24 min | Desenvolver coordenação. |
| KRT-037 | Controle de distância — variação 2 | Karatê esportivo e técnico | Iniciante | 28 min | Desenvolver equilíbrio. |
| KRT-038 | Entrada e saída — variação 2 | Karatê esportivo e técnico | Base | 32 min | Desenvolver técnica. |
| KRT-039 | Respiração e kiai técnico — variação 2 | Karatê esportivo e técnico | Intermediário | 36 min | Desenvolver controle de distância. |
| KRT-040 | Kata por blocos — variação 2 | Karatê esportivo e técnico | Avançado | 8 min | Desenvolver disciplina motora. |
| KRT-041 | Guarda e base zenkutsu-dachi — variação 3 | Karatê esportivo e técnico | Iniciante | 12 min | Desenvolver coordenação. |
| KRT-042 | Base kokutsu-dachi — variação 3 | Karatê esportivo e técnico | Base | 16 min | Desenvolver equilíbrio. |
| KRT-043 | Base kiba-dachi — variação 3 | Karatê esportivo e técnico | Intermediário | 20 min | Desenvolver técnica. |
| KRT-044 | Oi-zuki técnico — variação 3 | Karatê esportivo e técnico | Avançado | 24 min | Desenvolver controle de distância. |
| KRT-045 | Gyaku-zuki técnico — variação 3 | Karatê esportivo e técnico | Iniciante | 28 min | Desenvolver disciplina motora. |
| KRT-046 | Mae-geri controlado — variação 3 | Karatê esportivo e técnico | Base | 32 min | Desenvolver coordenação. |
| KRT-047 | Yoko-geri controlado — variação 3 | Karatê esportivo e técnico | Intermediário | 36 min | Desenvolver equilíbrio. |
| KRT-048 | Mawashi-geri controlado — variação 3 | Karatê esportivo e técnico | Avançado | 8 min | Desenvolver técnica. |
| KRT-049 | Age-uke — variação 3 | Karatê esportivo e técnico | Iniciante | 12 min | Desenvolver controle de distância. |
| KRT-050 | Soto-uke — variação 3 | Karatê esportivo e técnico | Base | 16 min | Desenvolver disciplina motora. |

## Detalhamento


### KRT-001 — Guarda e base zenkutsu-dachi — variação 1

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Iniciante
- **Tempo médio:** 12 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar guarda e base zenkutsu-dachi com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-002 — Base kokutsu-dachi — variação 1

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Base
- **Tempo médio:** 16 min
- **Objetivo:** Desenvolver equilíbrio.
- **Descrição:** Executar base kokutsu-dachi com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-003 — Base kiba-dachi — variação 1

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Objetivo:** Desenvolver técnica.
- **Descrição:** Executar base kiba-dachi com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-004 — Oi-zuki técnico — variação 1

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Avançado
- **Tempo médio:** 24 min
- **Objetivo:** Desenvolver controle de distância.
- **Descrição:** Executar oi-zuki técnico com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-005 — Gyaku-zuki técnico — variação 1

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Iniciante
- **Tempo médio:** 28 min
- **Objetivo:** Desenvolver disciplina motora.
- **Descrição:** Executar gyaku-zuki técnico com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-006 — Mae-geri controlado — variação 1

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Base
- **Tempo médio:** 32 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar mae-geri controlado com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-007 — Yoko-geri controlado — variação 1

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Intermediário
- **Tempo médio:** 36 min
- **Objetivo:** Desenvolver equilíbrio.
- **Descrição:** Executar yoko-geri controlado com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-008 — Mawashi-geri controlado — variação 1

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Avançado
- **Tempo médio:** 8 min
- **Objetivo:** Desenvolver técnica.
- **Descrição:** Executar mawashi-geri controlado com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-009 — Age-uke — variação 1

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Iniciante
- **Tempo médio:** 12 min
- **Objetivo:** Desenvolver controle de distância.
- **Descrição:** Executar age-uke com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-010 — Soto-uke — variação 1

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Base
- **Tempo médio:** 16 min
- **Objetivo:** Desenvolver disciplina motora.
- **Descrição:** Executar soto-uke com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-011 — Uchi-uke — variação 1

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar uchi-uke com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-012 — Gedan-barai — variação 1

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Avançado
- **Tempo médio:** 24 min
- **Objetivo:** Desenvolver equilíbrio.
- **Descrição:** Executar gedan-barai com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-013 — Sequência kihon 1 — variação 1

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Iniciante
- **Tempo médio:** 28 min
- **Objetivo:** Desenvolver técnica.
- **Descrição:** Executar sequência kihon 1 com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-014 — Sequência kihon 2 — variação 1

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Base
- **Tempo médio:** 32 min
- **Objetivo:** Desenvolver controle de distância.
- **Descrição:** Executar sequência kihon 2 com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-015 — Deslocamento com guarda — variação 1

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Intermediário
- **Tempo médio:** 36 min
- **Objetivo:** Desenvolver disciplina motora.
- **Descrição:** Executar deslocamento com guarda com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-016 — Kumite sombra — variação 1

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Avançado
- **Tempo médio:** 8 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar kumite sombra com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-017 — Controle de distância — variação 1

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Iniciante
- **Tempo médio:** 12 min
- **Objetivo:** Desenvolver equilíbrio.
- **Descrição:** Executar controle de distância com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-018 — Entrada e saída — variação 1

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Base
- **Tempo médio:** 16 min
- **Objetivo:** Desenvolver técnica.
- **Descrição:** Executar entrada e saída com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-019 — Respiração e kiai técnico — variação 1

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Objetivo:** Desenvolver controle de distância.
- **Descrição:** Executar respiração e kiai técnico com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-020 — Kata por blocos — variação 1

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Avançado
- **Tempo médio:** 24 min
- **Objetivo:** Desenvolver disciplina motora.
- **Descrição:** Executar kata por blocos com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-021 — Guarda e base zenkutsu-dachi — variação 2

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Iniciante
- **Tempo médio:** 28 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar guarda e base zenkutsu-dachi com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-022 — Base kokutsu-dachi — variação 2

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Base
- **Tempo médio:** 32 min
- **Objetivo:** Desenvolver equilíbrio.
- **Descrição:** Executar base kokutsu-dachi com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-023 — Base kiba-dachi — variação 2

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Intermediário
- **Tempo médio:** 36 min
- **Objetivo:** Desenvolver técnica.
- **Descrição:** Executar base kiba-dachi com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-024 — Oi-zuki técnico — variação 2

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Avançado
- **Tempo médio:** 8 min
- **Objetivo:** Desenvolver controle de distância.
- **Descrição:** Executar oi-zuki técnico com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-025 — Gyaku-zuki técnico — variação 2

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Iniciante
- **Tempo médio:** 12 min
- **Objetivo:** Desenvolver disciplina motora.
- **Descrição:** Executar gyaku-zuki técnico com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-026 — Mae-geri controlado — variação 2

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Base
- **Tempo médio:** 16 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar mae-geri controlado com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-027 — Yoko-geri controlado — variação 2

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Objetivo:** Desenvolver equilíbrio.
- **Descrição:** Executar yoko-geri controlado com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-028 — Mawashi-geri controlado — variação 2

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Avançado
- **Tempo médio:** 24 min
- **Objetivo:** Desenvolver técnica.
- **Descrição:** Executar mawashi-geri controlado com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-029 — Age-uke — variação 2

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Iniciante
- **Tempo médio:** 28 min
- **Objetivo:** Desenvolver controle de distância.
- **Descrição:** Executar age-uke com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-030 — Soto-uke — variação 2

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Base
- **Tempo médio:** 32 min
- **Objetivo:** Desenvolver disciplina motora.
- **Descrição:** Executar soto-uke com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-031 — Uchi-uke — variação 2

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Intermediário
- **Tempo médio:** 36 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar uchi-uke com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-032 — Gedan-barai — variação 2

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Avançado
- **Tempo médio:** 8 min
- **Objetivo:** Desenvolver equilíbrio.
- **Descrição:** Executar gedan-barai com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-033 — Sequência kihon 1 — variação 2

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Iniciante
- **Tempo médio:** 12 min
- **Objetivo:** Desenvolver técnica.
- **Descrição:** Executar sequência kihon 1 com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-034 — Sequência kihon 2 — variação 2

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Base
- **Tempo médio:** 16 min
- **Objetivo:** Desenvolver controle de distância.
- **Descrição:** Executar sequência kihon 2 com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-035 — Deslocamento com guarda — variação 2

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Objetivo:** Desenvolver disciplina motora.
- **Descrição:** Executar deslocamento com guarda com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-036 — Kumite sombra — variação 2

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Avançado
- **Tempo médio:** 24 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar kumite sombra com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-037 — Controle de distância — variação 2

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Iniciante
- **Tempo médio:** 28 min
- **Objetivo:** Desenvolver equilíbrio.
- **Descrição:** Executar controle de distância com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-038 — Entrada e saída — variação 2

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Base
- **Tempo médio:** 32 min
- **Objetivo:** Desenvolver técnica.
- **Descrição:** Executar entrada e saída com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-039 — Respiração e kiai técnico — variação 2

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Intermediário
- **Tempo médio:** 36 min
- **Objetivo:** Desenvolver controle de distância.
- **Descrição:** Executar respiração e kiai técnico com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-040 — Kata por blocos — variação 2

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Avançado
- **Tempo médio:** 8 min
- **Objetivo:** Desenvolver disciplina motora.
- **Descrição:** Executar kata por blocos com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-041 — Guarda e base zenkutsu-dachi — variação 3

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Iniciante
- **Tempo médio:** 12 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar guarda e base zenkutsu-dachi com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-042 — Base kokutsu-dachi — variação 3

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Base
- **Tempo médio:** 16 min
- **Objetivo:** Desenvolver equilíbrio.
- **Descrição:** Executar base kokutsu-dachi com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-043 — Base kiba-dachi — variação 3

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Objetivo:** Desenvolver técnica.
- **Descrição:** Executar base kiba-dachi com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-044 — Oi-zuki técnico — variação 3

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Avançado
- **Tempo médio:** 24 min
- **Objetivo:** Desenvolver controle de distância.
- **Descrição:** Executar oi-zuki técnico com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-045 — Gyaku-zuki técnico — variação 3

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Iniciante
- **Tempo médio:** 28 min
- **Objetivo:** Desenvolver disciplina motora.
- **Descrição:** Executar gyaku-zuki técnico com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-046 — Mae-geri controlado — variação 3

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Base
- **Tempo médio:** 32 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar mae-geri controlado com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-047 — Yoko-geri controlado — variação 3

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Intermediário
- **Tempo médio:** 36 min
- **Objetivo:** Desenvolver equilíbrio.
- **Descrição:** Executar yoko-geri controlado com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-048 — Mawashi-geri controlado — variação 3

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Avançado
- **Tempo médio:** 8 min
- **Objetivo:** Desenvolver técnica.
- **Descrição:** Executar mawashi-geri controlado com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-049 — Age-uke — variação 3

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Iniciante
- **Tempo médio:** 12 min
- **Objetivo:** Desenvolver controle de distância.
- **Descrição:** Executar age-uke com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### KRT-050 — Soto-uke — variação 3

- **Categoria:** Karatê esportivo e técnico
- **Nível:** Base
- **Tempo médio:** 16 min
- **Objetivo:** Desenvolver disciplina motora.
- **Descrição:** Executar soto-uke com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


---

# 8. Parkour seguro e progressivo

| ID | Nome | Categoria | Nível | Tempo | Objetivo |
| --- | --- | --- | --- | --- | --- |
| PKR-001 | Aterrissagem baixa — variação 1 | Parkour seguro e progressivo | Iniciante | 12 min | Desenvolver coordenação. |
| PKR-002 | Rolamento em colchonete — variação 1 | Parkour seguro e progressivo | Base | 16 min | Desenvolver aterrissagem segura. |
| PKR-003 | Precisão curta no chão — variação 1 | Parkour seguro e progressivo | Intermediário | 20 min | Desenvolver equilíbrio. |
| PKR-004 | Equilíbrio em linha — variação 1 | Parkour seguro e progressivo | Avançado | 24 min | Desenvolver agilidade. |
| PKR-005 | Step vault baixo — variação 1 | Parkour seguro e progressivo | Iniciante | 28 min | Desenvolver controle corporal. |
| PKR-006 | Safety vault baixo — variação 1 | Parkour seguro e progressivo | Base | 32 min | Desenvolver coordenação. |
| PKR-007 | Passeio quadrupedal — variação 1 | Parkour seguro e progressivo | Intermediário | 36 min | Desenvolver aterrissagem segura. |
| PKR-008 | Subida em banco baixo — variação 1 | Parkour seguro e progressivo | Avançado | 8 min | Desenvolver equilíbrio. |
| PKR-009 | Descida controlada — variação 1 | Parkour seguro e progressivo | Iniciante | 12 min | Desenvolver agilidade. |
| PKR-010 | Salto de precisão com marca — variação 1 | Parkour seguro e progressivo | Base | 16 min | Desenvolver controle corporal. |
| PKR-011 | Cat balance baixo — variação 1 | Parkour seguro e progressivo | Intermediário | 20 min | Desenvolver coordenação. |
| PKR-012 | Tic-tac em parede baixa — variação 1 | Parkour seguro e progressivo | Avançado | 24 min | Desenvolver aterrissagem segura. |
| PKR-013 | Flow de obstáculos baixos — variação 1 | Parkour seguro e progressivo | Iniciante | 28 min | Desenvolver equilíbrio. |
| PKR-014 | Corrida com mudança de nível — variação 1 | Parkour seguro e progressivo | Base | 32 min | Desenvolver agilidade. |
| PKR-015 | Coordenação de braços e pernas — variação 1 | Parkour seguro e progressivo | Intermediário | 36 min | Desenvolver controle corporal. |
| PKR-016 | Aterrissagem baixa — variação 2 | Parkour seguro e progressivo | Avançado | 8 min | Desenvolver coordenação. |
| PKR-017 | Rolamento em colchonete — variação 2 | Parkour seguro e progressivo | Iniciante | 12 min | Desenvolver aterrissagem segura. |
| PKR-018 | Precisão curta no chão — variação 2 | Parkour seguro e progressivo | Base | 16 min | Desenvolver equilíbrio. |
| PKR-019 | Equilíbrio em linha — variação 2 | Parkour seguro e progressivo | Intermediário | 20 min | Desenvolver agilidade. |
| PKR-020 | Step vault baixo — variação 2 | Parkour seguro e progressivo | Avançado | 24 min | Desenvolver controle corporal. |
| PKR-021 | Safety vault baixo — variação 2 | Parkour seguro e progressivo | Iniciante | 28 min | Desenvolver coordenação. |
| PKR-022 | Passeio quadrupedal — variação 2 | Parkour seguro e progressivo | Base | 32 min | Desenvolver aterrissagem segura. |
| PKR-023 | Subida em banco baixo — variação 2 | Parkour seguro e progressivo | Intermediário | 36 min | Desenvolver equilíbrio. |
| PKR-024 | Descida controlada — variação 2 | Parkour seguro e progressivo | Avançado | 8 min | Desenvolver agilidade. |
| PKR-025 | Salto de precisão com marca — variação 2 | Parkour seguro e progressivo | Iniciante | 12 min | Desenvolver controle corporal. |
| PKR-026 | Cat balance baixo — variação 2 | Parkour seguro e progressivo | Base | 16 min | Desenvolver coordenação. |
| PKR-027 | Tic-tac em parede baixa — variação 2 | Parkour seguro e progressivo | Intermediário | 20 min | Desenvolver aterrissagem segura. |
| PKR-028 | Flow de obstáculos baixos — variação 2 | Parkour seguro e progressivo | Avançado | 24 min | Desenvolver equilíbrio. |
| PKR-029 | Corrida com mudança de nível — variação 2 | Parkour seguro e progressivo | Iniciante | 28 min | Desenvolver agilidade. |
| PKR-030 | Coordenação de braços e pernas — variação 2 | Parkour seguro e progressivo | Base | 32 min | Desenvolver controle corporal. |
| PKR-031 | Aterrissagem baixa — variação 3 | Parkour seguro e progressivo | Intermediário | 36 min | Desenvolver coordenação. |
| PKR-032 | Rolamento em colchonete — variação 3 | Parkour seguro e progressivo | Avançado | 8 min | Desenvolver aterrissagem segura. |
| PKR-033 | Precisão curta no chão — variação 3 | Parkour seguro e progressivo | Iniciante | 12 min | Desenvolver equilíbrio. |
| PKR-034 | Equilíbrio em linha — variação 3 | Parkour seguro e progressivo | Base | 16 min | Desenvolver agilidade. |
| PKR-035 | Step vault baixo — variação 3 | Parkour seguro e progressivo | Intermediário | 20 min | Desenvolver controle corporal. |

## Detalhamento


### PKR-001 — Aterrissagem baixa — variação 1

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Iniciante
- **Tempo médio:** 12 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar aterrissagem baixa com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-002 — Rolamento em colchonete — variação 1

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Base
- **Tempo médio:** 16 min
- **Objetivo:** Desenvolver aterrissagem segura.
- **Descrição:** Executar rolamento em colchonete com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-003 — Precisão curta no chão — variação 1

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Objetivo:** Desenvolver equilíbrio.
- **Descrição:** Executar precisão curta no chão com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-004 — Equilíbrio em linha — variação 1

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Avançado
- **Tempo médio:** 24 min
- **Objetivo:** Desenvolver agilidade.
- **Descrição:** Executar equilíbrio em linha com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-005 — Step vault baixo — variação 1

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Iniciante
- **Tempo médio:** 28 min
- **Objetivo:** Desenvolver controle corporal.
- **Descrição:** Executar step vault baixo com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-006 — Safety vault baixo — variação 1

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Base
- **Tempo médio:** 32 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar safety vault baixo com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-007 — Passeio quadrupedal — variação 1

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Intermediário
- **Tempo médio:** 36 min
- **Objetivo:** Desenvolver aterrissagem segura.
- **Descrição:** Executar passeio quadrupedal com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-008 — Subida em banco baixo — variação 1

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Avançado
- **Tempo médio:** 8 min
- **Objetivo:** Desenvolver equilíbrio.
- **Descrição:** Executar subida em banco baixo com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-009 — Descida controlada — variação 1

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Iniciante
- **Tempo médio:** 12 min
- **Objetivo:** Desenvolver agilidade.
- **Descrição:** Executar descida controlada com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-010 — Salto de precisão com marca — variação 1

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Base
- **Tempo médio:** 16 min
- **Objetivo:** Desenvolver controle corporal.
- **Descrição:** Executar salto de precisão com marca com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-011 — Cat balance baixo — variação 1

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar cat balance baixo com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-012 — Tic-tac em parede baixa — variação 1

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Avançado
- **Tempo médio:** 24 min
- **Objetivo:** Desenvolver aterrissagem segura.
- **Descrição:** Executar tic-tac em parede baixa com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-013 — Flow de obstáculos baixos — variação 1

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Iniciante
- **Tempo médio:** 28 min
- **Objetivo:** Desenvolver equilíbrio.
- **Descrição:** Executar flow de obstáculos baixos com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-014 — Corrida com mudança de nível — variação 1

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Base
- **Tempo médio:** 32 min
- **Objetivo:** Desenvolver agilidade.
- **Descrição:** Executar corrida com mudança de nível com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-015 — Coordenação de braços e pernas — variação 1

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Intermediário
- **Tempo médio:** 36 min
- **Objetivo:** Desenvolver controle corporal.
- **Descrição:** Executar coordenação de braços e pernas com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-016 — Aterrissagem baixa — variação 2

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Avançado
- **Tempo médio:** 8 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar aterrissagem baixa com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-017 — Rolamento em colchonete — variação 2

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Iniciante
- **Tempo médio:** 12 min
- **Objetivo:** Desenvolver aterrissagem segura.
- **Descrição:** Executar rolamento em colchonete com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-018 — Precisão curta no chão — variação 2

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Base
- **Tempo médio:** 16 min
- **Objetivo:** Desenvolver equilíbrio.
- **Descrição:** Executar precisão curta no chão com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-019 — Equilíbrio em linha — variação 2

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Objetivo:** Desenvolver agilidade.
- **Descrição:** Executar equilíbrio em linha com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-020 — Step vault baixo — variação 2

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Avançado
- **Tempo médio:** 24 min
- **Objetivo:** Desenvolver controle corporal.
- **Descrição:** Executar step vault baixo com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-021 — Safety vault baixo — variação 2

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Iniciante
- **Tempo médio:** 28 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar safety vault baixo com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-022 — Passeio quadrupedal — variação 2

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Base
- **Tempo médio:** 32 min
- **Objetivo:** Desenvolver aterrissagem segura.
- **Descrição:** Executar passeio quadrupedal com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-023 — Subida em banco baixo — variação 2

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Intermediário
- **Tempo médio:** 36 min
- **Objetivo:** Desenvolver equilíbrio.
- **Descrição:** Executar subida em banco baixo com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-024 — Descida controlada — variação 2

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Avançado
- **Tempo médio:** 8 min
- **Objetivo:** Desenvolver agilidade.
- **Descrição:** Executar descida controlada com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-025 — Salto de precisão com marca — variação 2

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Iniciante
- **Tempo médio:** 12 min
- **Objetivo:** Desenvolver controle corporal.
- **Descrição:** Executar salto de precisão com marca com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-026 — Cat balance baixo — variação 2

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Base
- **Tempo médio:** 16 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar cat balance baixo com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-027 — Tic-tac em parede baixa — variação 2

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Objetivo:** Desenvolver aterrissagem segura.
- **Descrição:** Executar tic-tac em parede baixa com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-028 — Flow de obstáculos baixos — variação 2

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Avançado
- **Tempo médio:** 24 min
- **Objetivo:** Desenvolver equilíbrio.
- **Descrição:** Executar flow de obstáculos baixos com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-029 — Corrida com mudança de nível — variação 2

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Iniciante
- **Tempo médio:** 28 min
- **Objetivo:** Desenvolver agilidade.
- **Descrição:** Executar corrida com mudança de nível com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-030 — Coordenação de braços e pernas — variação 2

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Base
- **Tempo médio:** 32 min
- **Objetivo:** Desenvolver controle corporal.
- **Descrição:** Executar coordenação de braços e pernas com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-031 — Aterrissagem baixa — variação 3

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Intermediário
- **Tempo médio:** 36 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar aterrissagem baixa com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-032 — Rolamento em colchonete — variação 3

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Avançado
- **Tempo médio:** 8 min
- **Objetivo:** Desenvolver aterrissagem segura.
- **Descrição:** Executar rolamento em colchonete com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-033 — Precisão curta no chão — variação 3

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Iniciante
- **Tempo médio:** 12 min
- **Objetivo:** Desenvolver equilíbrio.
- **Descrição:** Executar precisão curta no chão com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-034 — Equilíbrio em linha — variação 3

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Base
- **Tempo médio:** 16 min
- **Objetivo:** Desenvolver agilidade.
- **Descrição:** Executar equilíbrio em linha com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


### PKR-035 — Step vault baixo — variação 3

- **Categoria:** Parkour seguro e progressivo
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Objetivo:** Desenvolver controle corporal.
- **Descrição:** Executar step vault baixo com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Usar apenas obstáculos baixos e estáveis; evitar telhados, muros altos, vãos perigosos e superfícies molhadas; treinar com supervisão quando possível.


---

# 9. Vôlei

| ID | Nome | Categoria | Nível | Tempo | Objetivo |
| --- | --- | --- | --- | --- | --- |
| VOL-001 | Manchete na parede — variação 1 | Vôlei | Iniciante | 12 min | Desenvolver controle de bola. |
| VOL-002 | Toque na parede — variação 1 | Vôlei | Base | 16 min | Desenvolver deslocamento. |
| VOL-003 | Saque por baixo — variação 1 | Vôlei | Intermediário | 20 min | Desenvolver reação. |
| VOL-004 | Saque por cima técnico — variação 1 | Vôlei | Avançado | 24 min | Desenvolver precisão. |
| VOL-005 | Deslocamento lateral — variação 1 | Vôlei | Iniciante | 28 min | Desenvolver coordenação. |
| VOL-006 | Recepção com alvo — variação 1 | Vôlei | Base | 32 min | Desenvolver controle de bola. |
| VOL-007 | Levantamento com precisão — variação 1 | Vôlei | Intermediário | 36 min | Desenvolver deslocamento. |
| VOL-008 | Ataque sem salto — variação 1 | Vôlei | Avançado | 8 min | Desenvolver reação. |
| VOL-009 | Ataque com aproximação — variação 1 | Vôlei | Iniciante | 12 min | Desenvolver precisão. |
| VOL-010 | Bloqueio sombra — variação 1 | Vôlei | Base | 16 min | Desenvolver coordenação. |
| VOL-011 | Defesa baixa — variação 1 | Vôlei | Intermediário | 20 min | Desenvolver controle de bola. |
| VOL-012 | Cobertura de ataque — variação 1 | Vôlei | Avançado | 24 min | Desenvolver deslocamento. |
| VOL-013 | Passe em triângulo — variação 1 | Vôlei | Iniciante | 28 min | Desenvolver reação. |
| VOL-014 | Controle de bola individual — variação 1 | Vôlei | Base | 32 min | Desenvolver precisão. |
| VOL-015 | Reação a bola curta — variação 1 | Vôlei | Intermediário | 36 min | Desenvolver coordenação. |
| VOL-016 | Manchete na parede — variação 2 | Vôlei | Avançado | 8 min | Desenvolver controle de bola. |
| VOL-017 | Toque na parede — variação 2 | Vôlei | Iniciante | 12 min | Desenvolver deslocamento. |
| VOL-018 | Saque por baixo — variação 2 | Vôlei | Base | 16 min | Desenvolver reação. |
| VOL-019 | Saque por cima técnico — variação 2 | Vôlei | Intermediário | 20 min | Desenvolver precisão. |
| VOL-020 | Deslocamento lateral — variação 2 | Vôlei | Avançado | 24 min | Desenvolver coordenação. |
| VOL-021 | Recepção com alvo — variação 2 | Vôlei | Iniciante | 28 min | Desenvolver controle de bola. |
| VOL-022 | Levantamento com precisão — variação 2 | Vôlei | Base | 32 min | Desenvolver deslocamento. |
| VOL-023 | Ataque sem salto — variação 2 | Vôlei | Intermediário | 36 min | Desenvolver reação. |
| VOL-024 | Ataque com aproximação — variação 2 | Vôlei | Avançado | 8 min | Desenvolver precisão. |
| VOL-025 | Bloqueio sombra — variação 2 | Vôlei | Iniciante | 12 min | Desenvolver coordenação. |
| VOL-026 | Defesa baixa — variação 2 | Vôlei | Base | 16 min | Desenvolver controle de bola. |
| VOL-027 | Cobertura de ataque — variação 2 | Vôlei | Intermediário | 20 min | Desenvolver deslocamento. |
| VOL-028 | Passe em triângulo — variação 2 | Vôlei | Avançado | 24 min | Desenvolver reação. |
| VOL-029 | Controle de bola individual — variação 2 | Vôlei | Iniciante | 28 min | Desenvolver precisão. |
| VOL-030 | Reação a bola curta — variação 2 | Vôlei | Base | 32 min | Desenvolver coordenação. |
| VOL-031 | Manchete na parede — variação 3 | Vôlei | Intermediário | 36 min | Desenvolver controle de bola. |
| VOL-032 | Toque na parede — variação 3 | Vôlei | Avançado | 8 min | Desenvolver deslocamento. |
| VOL-033 | Saque por baixo — variação 3 | Vôlei | Iniciante | 12 min | Desenvolver reação. |
| VOL-034 | Saque por cima técnico — variação 3 | Vôlei | Base | 16 min | Desenvolver precisão. |
| VOL-035 | Deslocamento lateral — variação 3 | Vôlei | Intermediário | 20 min | Desenvolver coordenação. |
| VOL-036 | Recepção com alvo — variação 3 | Vôlei | Avançado | 24 min | Desenvolver controle de bola. |
| VOL-037 | Levantamento com precisão — variação 3 | Vôlei | Iniciante | 28 min | Desenvolver deslocamento. |
| VOL-038 | Ataque sem salto — variação 3 | Vôlei | Base | 32 min | Desenvolver reação. |
| VOL-039 | Ataque com aproximação — variação 3 | Vôlei | Intermediário | 36 min | Desenvolver precisão. |
| VOL-040 | Bloqueio sombra — variação 3 | Vôlei | Avançado | 8 min | Desenvolver coordenação. |

## Detalhamento


### VOL-001 — Manchete na parede — variação 1

- **Categoria:** Vôlei
- **Nível:** Iniciante
- **Tempo médio:** 12 min
- **Objetivo:** Desenvolver controle de bola.
- **Descrição:** Executar manchete na parede com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-002 — Toque na parede — variação 1

- **Categoria:** Vôlei
- **Nível:** Base
- **Tempo médio:** 16 min
- **Objetivo:** Desenvolver deslocamento.
- **Descrição:** Executar toque na parede com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-003 — Saque por baixo — variação 1

- **Categoria:** Vôlei
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Objetivo:** Desenvolver reação.
- **Descrição:** Executar saque por baixo com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-004 — Saque por cima técnico — variação 1

- **Categoria:** Vôlei
- **Nível:** Avançado
- **Tempo médio:** 24 min
- **Objetivo:** Desenvolver precisão.
- **Descrição:** Executar saque por cima técnico com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-005 — Deslocamento lateral — variação 1

- **Categoria:** Vôlei
- **Nível:** Iniciante
- **Tempo médio:** 28 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar deslocamento lateral com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-006 — Recepção com alvo — variação 1

- **Categoria:** Vôlei
- **Nível:** Base
- **Tempo médio:** 32 min
- **Objetivo:** Desenvolver controle de bola.
- **Descrição:** Executar recepção com alvo com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-007 — Levantamento com precisão — variação 1

- **Categoria:** Vôlei
- **Nível:** Intermediário
- **Tempo médio:** 36 min
- **Objetivo:** Desenvolver deslocamento.
- **Descrição:** Executar levantamento com precisão com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-008 — Ataque sem salto — variação 1

- **Categoria:** Vôlei
- **Nível:** Avançado
- **Tempo médio:** 8 min
- **Objetivo:** Desenvolver reação.
- **Descrição:** Executar ataque sem salto com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-009 — Ataque com aproximação — variação 1

- **Categoria:** Vôlei
- **Nível:** Iniciante
- **Tempo médio:** 12 min
- **Objetivo:** Desenvolver precisão.
- **Descrição:** Executar ataque com aproximação com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-010 — Bloqueio sombra — variação 1

- **Categoria:** Vôlei
- **Nível:** Base
- **Tempo médio:** 16 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar bloqueio sombra com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-011 — Defesa baixa — variação 1

- **Categoria:** Vôlei
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Objetivo:** Desenvolver controle de bola.
- **Descrição:** Executar defesa baixa com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-012 — Cobertura de ataque — variação 1

- **Categoria:** Vôlei
- **Nível:** Avançado
- **Tempo médio:** 24 min
- **Objetivo:** Desenvolver deslocamento.
- **Descrição:** Executar cobertura de ataque com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-013 — Passe em triângulo — variação 1

- **Categoria:** Vôlei
- **Nível:** Iniciante
- **Tempo médio:** 28 min
- **Objetivo:** Desenvolver reação.
- **Descrição:** Executar passe em triângulo com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-014 — Controle de bola individual — variação 1

- **Categoria:** Vôlei
- **Nível:** Base
- **Tempo médio:** 32 min
- **Objetivo:** Desenvolver precisão.
- **Descrição:** Executar controle de bola individual com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-015 — Reação a bola curta — variação 1

- **Categoria:** Vôlei
- **Nível:** Intermediário
- **Tempo médio:** 36 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar reação a bola curta com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-016 — Manchete na parede — variação 2

- **Categoria:** Vôlei
- **Nível:** Avançado
- **Tempo médio:** 8 min
- **Objetivo:** Desenvolver controle de bola.
- **Descrição:** Executar manchete na parede com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-017 — Toque na parede — variação 2

- **Categoria:** Vôlei
- **Nível:** Iniciante
- **Tempo médio:** 12 min
- **Objetivo:** Desenvolver deslocamento.
- **Descrição:** Executar toque na parede com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-018 — Saque por baixo — variação 2

- **Categoria:** Vôlei
- **Nível:** Base
- **Tempo médio:** 16 min
- **Objetivo:** Desenvolver reação.
- **Descrição:** Executar saque por baixo com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-019 — Saque por cima técnico — variação 2

- **Categoria:** Vôlei
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Objetivo:** Desenvolver precisão.
- **Descrição:** Executar saque por cima técnico com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-020 — Deslocamento lateral — variação 2

- **Categoria:** Vôlei
- **Nível:** Avançado
- **Tempo médio:** 24 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar deslocamento lateral com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-021 — Recepção com alvo — variação 2

- **Categoria:** Vôlei
- **Nível:** Iniciante
- **Tempo médio:** 28 min
- **Objetivo:** Desenvolver controle de bola.
- **Descrição:** Executar recepção com alvo com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-022 — Levantamento com precisão — variação 2

- **Categoria:** Vôlei
- **Nível:** Base
- **Tempo médio:** 32 min
- **Objetivo:** Desenvolver deslocamento.
- **Descrição:** Executar levantamento com precisão com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-023 — Ataque sem salto — variação 2

- **Categoria:** Vôlei
- **Nível:** Intermediário
- **Tempo médio:** 36 min
- **Objetivo:** Desenvolver reação.
- **Descrição:** Executar ataque sem salto com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-024 — Ataque com aproximação — variação 2

- **Categoria:** Vôlei
- **Nível:** Avançado
- **Tempo médio:** 8 min
- **Objetivo:** Desenvolver precisão.
- **Descrição:** Executar ataque com aproximação com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-025 — Bloqueio sombra — variação 2

- **Categoria:** Vôlei
- **Nível:** Iniciante
- **Tempo médio:** 12 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar bloqueio sombra com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-026 — Defesa baixa — variação 2

- **Categoria:** Vôlei
- **Nível:** Base
- **Tempo médio:** 16 min
- **Objetivo:** Desenvolver controle de bola.
- **Descrição:** Executar defesa baixa com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-027 — Cobertura de ataque — variação 2

- **Categoria:** Vôlei
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Objetivo:** Desenvolver deslocamento.
- **Descrição:** Executar cobertura de ataque com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-028 — Passe em triângulo — variação 2

- **Categoria:** Vôlei
- **Nível:** Avançado
- **Tempo médio:** 24 min
- **Objetivo:** Desenvolver reação.
- **Descrição:** Executar passe em triângulo com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-029 — Controle de bola individual — variação 2

- **Categoria:** Vôlei
- **Nível:** Iniciante
- **Tempo médio:** 28 min
- **Objetivo:** Desenvolver precisão.
- **Descrição:** Executar controle de bola individual com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-030 — Reação a bola curta — variação 2

- **Categoria:** Vôlei
- **Nível:** Base
- **Tempo médio:** 32 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar reação a bola curta com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-031 — Manchete na parede — variação 3

- **Categoria:** Vôlei
- **Nível:** Intermediário
- **Tempo médio:** 36 min
- **Objetivo:** Desenvolver controle de bola.
- **Descrição:** Executar manchete na parede com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-032 — Toque na parede — variação 3

- **Categoria:** Vôlei
- **Nível:** Avançado
- **Tempo médio:** 8 min
- **Objetivo:** Desenvolver deslocamento.
- **Descrição:** Executar toque na parede com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-033 — Saque por baixo — variação 3

- **Categoria:** Vôlei
- **Nível:** Iniciante
- **Tempo médio:** 12 min
- **Objetivo:** Desenvolver reação.
- **Descrição:** Executar saque por baixo com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-034 — Saque por cima técnico — variação 3

- **Categoria:** Vôlei
- **Nível:** Base
- **Tempo médio:** 16 min
- **Objetivo:** Desenvolver precisão.
- **Descrição:** Executar saque por cima técnico com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-035 — Deslocamento lateral — variação 3

- **Categoria:** Vôlei
- **Nível:** Intermediário
- **Tempo médio:** 20 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar deslocamento lateral com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-036 — Recepção com alvo — variação 3

- **Categoria:** Vôlei
- **Nível:** Avançado
- **Tempo médio:** 24 min
- **Objetivo:** Desenvolver controle de bola.
- **Descrição:** Executar recepção com alvo com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-037 — Levantamento com precisão — variação 3

- **Categoria:** Vôlei
- **Nível:** Iniciante
- **Tempo médio:** 28 min
- **Objetivo:** Desenvolver deslocamento.
- **Descrição:** Executar levantamento com precisão com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-038 — Ataque sem salto — variação 3

- **Categoria:** Vôlei
- **Nível:** Base
- **Tempo médio:** 32 min
- **Objetivo:** Desenvolver reação.
- **Descrição:** Executar ataque sem salto com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-039 — Ataque com aproximação — variação 3

- **Categoria:** Vôlei
- **Nível:** Intermediário
- **Tempo médio:** 36 min
- **Objetivo:** Desenvolver precisão.
- **Descrição:** Executar ataque com aproximação com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### VOL-040 — Bloqueio sombra — variação 3

- **Categoria:** Vôlei
- **Nível:** Avançado
- **Tempo médio:** 8 min
- **Objetivo:** Desenvolver coordenação.
- **Descrição:** Executar bloqueio sombra com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


---

# 10. Corrida e resistência

| ID | Nome | Categoria | Nível | Tempo | Objetivo |
| --- | --- | --- | --- | --- | --- |
| RUN-001 | Caminhada rápida — variação 1 | Corrida e resistência | Iniciante | 14 min | Desenvolver resistência. |
| RUN-002 | Trote leve — variação 1 | Corrida e resistência | Base | 18 min | Desenvolver ritmo. |
| RUN-003 | Intervalado 30-30 — variação 1 | Corrida e resistência | Intermediário | 22 min | Desenvolver capacidade cardiorrespiratória. |
| RUN-004 | Intervalado 1-1 — variação 1 | Corrida e resistência | Avançado | 26 min | Desenvolver mecânica de corrida. |
| RUN-005 | Corrida progressiva — variação 1 | Corrida e resistência | Iniciante | 30 min | Desenvolver recuperação ativa. |
| RUN-006 | Fartlek leve — variação 1 | Corrida e resistência | Base | 34 min | Desenvolver resistência. |
| RUN-007 | Subida curta controlada — variação 1 | Corrida e resistência | Intermediário | 38 min | Desenvolver ritmo. |
| RUN-008 | Técnica skipping — variação 1 | Corrida e resistência | Avançado | 10 min | Desenvolver capacidade cardiorrespiratória. |
| RUN-009 | Técnica dribbling — variação 1 | Corrida e resistência | Iniciante | 14 min | Desenvolver mecânica de corrida. |
| RUN-010 | Strides curtos — variação 1 | Corrida e resistência | Base | 18 min | Desenvolver recuperação ativa. |
| RUN-011 | Corrida regenerativa — variação 1 | Corrida e resistência | Intermediário | 22 min | Desenvolver resistência. |
| RUN-012 | Teste de ritmo confortável — variação 1 | Corrida e resistência | Avançado | 26 min | Desenvolver ritmo. |
| RUN-013 | Caminhada rápida — variação 2 | Corrida e resistência | Iniciante | 30 min | Desenvolver capacidade cardiorrespiratória. |
| RUN-014 | Trote leve — variação 2 | Corrida e resistência | Base | 34 min | Desenvolver mecânica de corrida. |
| RUN-015 | Intervalado 30-30 — variação 2 | Corrida e resistência | Intermediário | 38 min | Desenvolver recuperação ativa. |
| RUN-016 | Intervalado 1-1 — variação 2 | Corrida e resistência | Avançado | 10 min | Desenvolver resistência. |
| RUN-017 | Corrida progressiva — variação 2 | Corrida e resistência | Iniciante | 14 min | Desenvolver ritmo. |
| RUN-018 | Fartlek leve — variação 2 | Corrida e resistência | Base | 18 min | Desenvolver capacidade cardiorrespiratória. |
| RUN-019 | Subida curta controlada — variação 2 | Corrida e resistência | Intermediário | 22 min | Desenvolver mecânica de corrida. |
| RUN-020 | Técnica skipping — variação 2 | Corrida e resistência | Avançado | 26 min | Desenvolver recuperação ativa. |
| RUN-021 | Técnica dribbling — variação 2 | Corrida e resistência | Iniciante | 30 min | Desenvolver resistência. |
| RUN-022 | Strides curtos — variação 2 | Corrida e resistência | Base | 34 min | Desenvolver ritmo. |
| RUN-023 | Corrida regenerativa — variação 2 | Corrida e resistência | Intermediário | 38 min | Desenvolver capacidade cardiorrespiratória. |
| RUN-024 | Teste de ritmo confortável — variação 2 | Corrida e resistência | Avançado | 10 min | Desenvolver mecânica de corrida. |
| RUN-025 | Caminhada rápida — variação 3 | Corrida e resistência | Iniciante | 14 min | Desenvolver recuperação ativa. |
| RUN-026 | Trote leve — variação 3 | Corrida e resistência | Base | 18 min | Desenvolver resistência. |
| RUN-027 | Intervalado 30-30 — variação 3 | Corrida e resistência | Intermediário | 22 min | Desenvolver ritmo. |
| RUN-028 | Intervalado 1-1 — variação 3 | Corrida e resistência | Avançado | 26 min | Desenvolver capacidade cardiorrespiratória. |
| RUN-029 | Corrida progressiva — variação 3 | Corrida e resistência | Iniciante | 30 min | Desenvolver mecânica de corrida. |
| RUN-030 | Fartlek leve — variação 3 | Corrida e resistência | Base | 34 min | Desenvolver recuperação ativa. |
| RUN-031 | Subida curta controlada — variação 3 | Corrida e resistência | Intermediário | 38 min | Desenvolver resistência. |
| RUN-032 | Técnica skipping — variação 3 | Corrida e resistência | Avançado | 10 min | Desenvolver ritmo. |
| RUN-033 | Técnica dribbling — variação 3 | Corrida e resistência | Iniciante | 14 min | Desenvolver capacidade cardiorrespiratória. |
| RUN-034 | Strides curtos — variação 3 | Corrida e resistência | Base | 18 min | Desenvolver mecânica de corrida. |
| RUN-035 | Corrida regenerativa — variação 3 | Corrida e resistência | Intermediário | 22 min | Desenvolver recuperação ativa. |

## Detalhamento


### RUN-001 — Caminhada rápida — variação 1

- **Categoria:** Corrida e resistência
- **Nível:** Iniciante
- **Tempo médio:** 14 min
- **Objetivo:** Desenvolver resistência.
- **Descrição:** Executar caminhada rápida com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-002 — Trote leve — variação 1

- **Categoria:** Corrida e resistência
- **Nível:** Base
- **Tempo médio:** 18 min
- **Objetivo:** Desenvolver ritmo.
- **Descrição:** Executar trote leve com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-003 — Intervalado 30-30 — variação 1

- **Categoria:** Corrida e resistência
- **Nível:** Intermediário
- **Tempo médio:** 22 min
- **Objetivo:** Desenvolver capacidade cardiorrespiratória.
- **Descrição:** Executar intervalado 30-30 com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-004 — Intervalado 1-1 — variação 1

- **Categoria:** Corrida e resistência
- **Nível:** Avançado
- **Tempo médio:** 26 min
- **Objetivo:** Desenvolver mecânica de corrida.
- **Descrição:** Executar intervalado 1-1 com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-005 — Corrida progressiva — variação 1

- **Categoria:** Corrida e resistência
- **Nível:** Iniciante
- **Tempo médio:** 30 min
- **Objetivo:** Desenvolver recuperação ativa.
- **Descrição:** Executar corrida progressiva com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-006 — Fartlek leve — variação 1

- **Categoria:** Corrida e resistência
- **Nível:** Base
- **Tempo médio:** 34 min
- **Objetivo:** Desenvolver resistência.
- **Descrição:** Executar fartlek leve com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-007 — Subida curta controlada — variação 1

- **Categoria:** Corrida e resistência
- **Nível:** Intermediário
- **Tempo médio:** 38 min
- **Objetivo:** Desenvolver ritmo.
- **Descrição:** Executar subida curta controlada com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-008 — Técnica skipping — variação 1

- **Categoria:** Corrida e resistência
- **Nível:** Avançado
- **Tempo médio:** 10 min
- **Objetivo:** Desenvolver capacidade cardiorrespiratória.
- **Descrição:** Executar técnica skipping com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-009 — Técnica dribbling — variação 1

- **Categoria:** Corrida e resistência
- **Nível:** Iniciante
- **Tempo médio:** 14 min
- **Objetivo:** Desenvolver mecânica de corrida.
- **Descrição:** Executar técnica dribbling com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-010 — Strides curtos — variação 1

- **Categoria:** Corrida e resistência
- **Nível:** Base
- **Tempo médio:** 18 min
- **Objetivo:** Desenvolver recuperação ativa.
- **Descrição:** Executar strides curtos com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-011 — Corrida regenerativa — variação 1

- **Categoria:** Corrida e resistência
- **Nível:** Intermediário
- **Tempo médio:** 22 min
- **Objetivo:** Desenvolver resistência.
- **Descrição:** Executar corrida regenerativa com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-012 — Teste de ritmo confortável — variação 1

- **Categoria:** Corrida e resistência
- **Nível:** Avançado
- **Tempo médio:** 26 min
- **Objetivo:** Desenvolver ritmo.
- **Descrição:** Executar teste de ritmo confortável com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-013 — Caminhada rápida — variação 2

- **Categoria:** Corrida e resistência
- **Nível:** Iniciante
- **Tempo médio:** 30 min
- **Objetivo:** Desenvolver capacidade cardiorrespiratória.
- **Descrição:** Executar caminhada rápida com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-014 — Trote leve — variação 2

- **Categoria:** Corrida e resistência
- **Nível:** Base
- **Tempo médio:** 34 min
- **Objetivo:** Desenvolver mecânica de corrida.
- **Descrição:** Executar trote leve com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-015 — Intervalado 30-30 — variação 2

- **Categoria:** Corrida e resistência
- **Nível:** Intermediário
- **Tempo médio:** 38 min
- **Objetivo:** Desenvolver recuperação ativa.
- **Descrição:** Executar intervalado 30-30 com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-016 — Intervalado 1-1 — variação 2

- **Categoria:** Corrida e resistência
- **Nível:** Avançado
- **Tempo médio:** 10 min
- **Objetivo:** Desenvolver resistência.
- **Descrição:** Executar intervalado 1-1 com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-017 — Corrida progressiva — variação 2

- **Categoria:** Corrida e resistência
- **Nível:** Iniciante
- **Tempo médio:** 14 min
- **Objetivo:** Desenvolver ritmo.
- **Descrição:** Executar corrida progressiva com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-018 — Fartlek leve — variação 2

- **Categoria:** Corrida e resistência
- **Nível:** Base
- **Tempo médio:** 18 min
- **Objetivo:** Desenvolver capacidade cardiorrespiratória.
- **Descrição:** Executar fartlek leve com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-019 — Subida curta controlada — variação 2

- **Categoria:** Corrida e resistência
- **Nível:** Intermediário
- **Tempo médio:** 22 min
- **Objetivo:** Desenvolver mecânica de corrida.
- **Descrição:** Executar subida curta controlada com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-020 — Técnica skipping — variação 2

- **Categoria:** Corrida e resistência
- **Nível:** Avançado
- **Tempo médio:** 26 min
- **Objetivo:** Desenvolver recuperação ativa.
- **Descrição:** Executar técnica skipping com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-021 — Técnica dribbling — variação 2

- **Categoria:** Corrida e resistência
- **Nível:** Iniciante
- **Tempo médio:** 30 min
- **Objetivo:** Desenvolver resistência.
- **Descrição:** Executar técnica dribbling com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-022 — Strides curtos — variação 2

- **Categoria:** Corrida e resistência
- **Nível:** Base
- **Tempo médio:** 34 min
- **Objetivo:** Desenvolver ritmo.
- **Descrição:** Executar strides curtos com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-023 — Corrida regenerativa — variação 2

- **Categoria:** Corrida e resistência
- **Nível:** Intermediário
- **Tempo médio:** 38 min
- **Objetivo:** Desenvolver capacidade cardiorrespiratória.
- **Descrição:** Executar corrida regenerativa com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-024 — Teste de ritmo confortável — variação 2

- **Categoria:** Corrida e resistência
- **Nível:** Avançado
- **Tempo médio:** 10 min
- **Objetivo:** Desenvolver mecânica de corrida.
- **Descrição:** Executar teste de ritmo confortável com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-025 — Caminhada rápida — variação 3

- **Categoria:** Corrida e resistência
- **Nível:** Iniciante
- **Tempo médio:** 14 min
- **Objetivo:** Desenvolver recuperação ativa.
- **Descrição:** Executar caminhada rápida com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-026 — Trote leve — variação 3

- **Categoria:** Corrida e resistência
- **Nível:** Base
- **Tempo médio:** 18 min
- **Objetivo:** Desenvolver resistência.
- **Descrição:** Executar trote leve com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-027 — Intervalado 30-30 — variação 3

- **Categoria:** Corrida e resistência
- **Nível:** Intermediário
- **Tempo médio:** 22 min
- **Objetivo:** Desenvolver ritmo.
- **Descrição:** Executar intervalado 30-30 com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-028 — Intervalado 1-1 — variação 3

- **Categoria:** Corrida e resistência
- **Nível:** Avançado
- **Tempo médio:** 26 min
- **Objetivo:** Desenvolver capacidade cardiorrespiratória.
- **Descrição:** Executar intervalado 1-1 com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-029 — Corrida progressiva — variação 3

- **Categoria:** Corrida e resistência
- **Nível:** Iniciante
- **Tempo médio:** 30 min
- **Objetivo:** Desenvolver mecânica de corrida.
- **Descrição:** Executar corrida progressiva com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-030 — Fartlek leve — variação 3

- **Categoria:** Corrida e resistência
- **Nível:** Base
- **Tempo médio:** 34 min
- **Objetivo:** Desenvolver recuperação ativa.
- **Descrição:** Executar fartlek leve com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-031 — Subida curta controlada — variação 3

- **Categoria:** Corrida e resistência
- **Nível:** Intermediário
- **Tempo médio:** 38 min
- **Objetivo:** Desenvolver resistência.
- **Descrição:** Executar subida curta controlada com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-032 — Técnica skipping — variação 3

- **Categoria:** Corrida e resistência
- **Nível:** Avançado
- **Tempo médio:** 10 min
- **Objetivo:** Desenvolver ritmo.
- **Descrição:** Executar técnica skipping com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-033 — Técnica dribbling — variação 3

- **Categoria:** Corrida e resistência
- **Nível:** Iniciante
- **Tempo médio:** 14 min
- **Objetivo:** Desenvolver capacidade cardiorrespiratória.
- **Descrição:** Executar técnica dribbling com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-034 — Strides curtos — variação 3

- **Categoria:** Corrida e resistência
- **Nível:** Base
- **Tempo médio:** 18 min
- **Objetivo:** Desenvolver mecânica de corrida.
- **Descrição:** Executar strides curtos com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


### RUN-035 — Corrida regenerativa — variação 3

- **Categoria:** Corrida e resistência
- **Nível:** Intermediário
- **Tempo médio:** 22 min
- **Objetivo:** Desenvolver recuperação ativa.
- **Descrição:** Executar corrida regenerativa com foco em técnica limpa, controle corporal e progressão segura. Aumentar intensidade apenas quando o movimento estiver estável.
- **Variações:** mais lento para técnica, mais rápido para condicionamento, menos amplitude para adaptação, mais descanso para qualidade
- **Métricas:** séries concluídas, qualidade 1-5, fadiga 1-5, observações
- **Cuidados:** Interromper se houver dor; manter aquecimento e postura.


---

# 11. Hábitos e micro-hábitos


| ID | Hábito | Área | Gatilho | Ação | Métrica |
| --- | --- | --- | --- | --- | --- |
| HAB-001 | Beber água ao acordar | Hidratação | Após acordar | Registrar 250-500ml | ml/dia |
| HAB-002 | Planejar o dia | Organização | Depois do café | Escolher missão do dia e 3 prioridades | missão definida |
| HAB-003 | Revisão noturna rápida | Reflexão | Antes de dormir | Responder 3 perguntas do diário | registro diário |
| HAB-004 | Guardar dinheiro primeiro | Finanças | Ao receber | Separar uma porcentagem para reserva/meta | R$ guardado |
| HAB-005 | Estudo mínimo de 20 minutos | Estudos | Horário fixo | Fazer uma sessão curta com foco total | minutos estudados |
| HAB-006 | Alongar após treino | Corpo | Depois do treino | Alongar principais grupos usados | sessão concluída |
| HAB-007 | Sem redes antes de estudar | Foco | Antes de estudar | Iniciar modo foco antes da sessão | bloqueio/aviso ativo |
| HAB-008 | Registrar gastos do dia | Finanças | Ao gastar ou à noite | Inserir gastos rápidos | gastos registrados |
| HAB-009 | Organizar ambiente | Produtividade | Antes do foco | Limpar mesa e deixar apenas o necessário | ambiente pronto |
| HAB-010 | Sono com horário limite | Sono | À noite | Definir horário máximo para ir deitar | hora de dormir |

---

# 12. Categorias financeiras


| ID | Categoria | Natureza | Descrição | Recorrente? | Regra/alerta |
| --- | --- | --- | --- | --- | --- |
| FIN-CAT-001 | Alimentação | Saída | Lanches, mercado, refeições fora | Sim | Alerta se passar do limite semanal |
| FIN-CAT-002 | Transporte | Saída | Ônibus, combustível, carona, manutenção | Sim | Separar fixo e variável |
| FIN-CAT-003 | Estudos | Saída | Cursos, material, livros, provas | Sim | Considerar investimento pessoal |
| FIN-CAT-004 | Trabalho | Entrada/Saída | Recebimentos e custos ligados ao trabalho | Sim | Acompanhar lucro líquido |
| FIN-CAT-005 | Lazer | Saída | Cinema, jogos, rolês, delivery por diversão | Sim | Alerta de impulso |
| FIN-CAT-006 | Projetos | Saída | Domínios, hospedagem, assets, ferramentas | Sim | Vincular ao projeto |
| FIN-CAT-007 | Saúde | Saída | Remédios, consultas, exames | Sim | Prioridade alta |
| FIN-CAT-008 | Treino | Saída | Academia, equipamentos, roupas esportivas | Sim | Vincular a corpo/treino |
| FIN-CAT-009 | Família | Saída | Presentes e ajuda familiar | Não | Registrar sem culpa, mas com limite |
| FIN-CAT-010 | Reserva | Entrada/Saída | Dinheiro guardado para emergência | Sim | Meta prioritária |
| FIN-CAT-011 | Investimento | Saída | Aplicação/guarda planejada | Sim | Não recomendar ativo específico |
| FIN-CAT-012 | Assinaturas | Saída | Apps, streaming, ferramentas | Sim | Detectar recorrências esquecidas |


## 12.1 Templates financeiros

```json
{
  "registro_rapido_saida": {
    "fluxo": ["valor", "categoria", "salvar"],
    "campos_opcionais": ["descricao", "comprovante", "forma_pagamento", "projeto_vinculado"],
    "regra": "O registro deve ser possível em menos de 5 segundos."
  },
  "registro_entrada": {
    "fluxo": ["valor", "origem", "salvar"],
    "campos_opcionais": ["descricao", "recorrente", "data"],
    "regra": "Entrada recorrente pode gerar previsão mensal."
  },
  "fechamento_mensal": {
    "calcular": ["entradas", "saidas", "fixos", "variaveis", "sobra", "meta_guardar"],
    "alertas": [
      "categoria acima do limite",
      "sobra positiva para guardar",
      "gasto impulsivo repetido",
      "assinatura esquecida"
    ]
  }
}
```

---

# 13. Regras para a IA montar treinos

A IA deve escolher exercícios considerando:

1. Tempo disponível.
2. Treino anterior.
3. Intensidade recente.
4. Objetivo semanal.
5. Área mais negligenciada.
6. Necessidade de recuperação.
7. Equipamentos disponíveis.
8. Segurança do ambiente.

## Exemplos de montagem

### Treino de futebol de 30 minutos

```txt
5 min — Aquecimento com bola
10 min — Controle/condução
10 min — Passe ou finalização
5 min — Mobilidade e volta à calma
```

### Treino completo de 45 minutos

```txt
8 min — Aquecimento dinâmico
12 min — Técnica principal
10 min — Condicionamento ou agilidade
10 min — Jogo/tomada de decisão individual
5 min — Alongamento leve
```

### Treino leve de recuperação

```txt
5 min — Mobilidade
10 min — Técnica lenta
10 min — caminhada/trote leve
5 min — respiração e alongamento
```

---

# 14. Regras para a IA sugerir estudos

A IA deve escolher matérias considerando:

1. Horário disponível.
2. Matéria atrasada.
3. Prova próxima.
4. Dificuldade percebida.
5. Última revisão.
6. Nível de domínio.
7. Energia do usuário.

## Modelo de sugestão

```txt
Agora é horário de estudo.

Sugestão:
Geografia — Capitalismo x Socialismo

Motivo:
Você marcou esse tópico como prioridade alta e ainda não revisou esta semana.

Sessão:
25 minutos de estudo + 5 minutos de resumo ativo.
```

---

# 15. Regras para a IA sugerir finanças

A IA deve:

- Evitar recomendar investimentos específicos sem configuração.
- Incentivar reserva, organização e consciência.
- Identificar padrões de gasto.
- Sugerir economia em linguagem simples.
- Não gerar culpa excessiva.
- Diferenciar gasto necessário de gasto impulsivo.

## Exemplo de alerta financeiro

```txt
Você gastou bastante com alimentação fora de casa esta semana.
Sugestão: tente reduzir pequenos lanches nos próximos 3 dias e registrar tudo.
```

---

# 16. Resumo de cobertura

- Unidades de estudo: 116
- Treinos de futebol: 130
- Força: 45
- Mobilidade/alongamento: 35
- Karatê: 50
- Parkour seguro: 35
- Vôlei: 40
- Corrida/resistência: 35
- Hábitos: 10
- Categorias financeiras: 12
- Templates: 7

Este arquivo é uma base inicial robusta. A IA pode expandir, filtrar, indexar e converter cada item para JSON, SQLite, Supabase, Firebase ou outro banco usado pelo app.
