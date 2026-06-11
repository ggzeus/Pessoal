# Aplicativo de Controle Pessoal

O aplicativo será desenvolvido para uso pessoal de um único usuário. Seu objetivo principal é ajudar no auto-desenvolvimento, organização da rotina, controle de hábitos, evolução física, estudos, alimentação, finanças e projetos pessoais.

O app deve funcionar como um assistente pessoal prático, rápido e inteligente, ajudando o usuário a tomar decisões melhores no dia a dia sem tornar o processo cansativo.

---

# 1. Missão do Aplicativo

A missão do app é ajudar o usuário a evoluir em diferentes áreas da vida por meio de organização, acompanhamento e sugestões inteligentes.

O app deve auxiliar em:

* Rotina diária.
* Alimentação.
* Treinos.
* Estudos.
* Bons hábitos.
* Controle de uso de redes sociais.
* Finanças pessoais.
* Projetos pessoais.
* Reflexão e evolução semanal.
* Equilíbrio entre produtividade, descanso e lazer.

O aplicativo não deve ser apenas uma lista de tarefas, mas sim um sistema de desenvolvimento pessoal.

---

# 2. Princípio Principal: Praticidade

O app inteiro deve ser extremamente prático.

Se uma ação for demorada demais para registrar, o usuário pode ficar com preguiça de marcar. Por isso, o app deve priorizar:

* Poucos cliques.
* Registros rápidos.
* Sugestões automáticas.
* Botões de ação rápida.
* Repetição inteligente de dados.
* Favoritos.
* Templates.
* Histórico reutilizável.
* Entrada por texto rápido.
* Entrada por voz, futuramente.
* Leitura de imagens, futuramente.
* Notificações úteis, mas não irritantes.

## Regra geral

Toda função importante deve poder ser usada em poucos segundos.

Exemplo:

```txt
Adicionar gasto:
Valor → Categoria → Salvar
```

```txt
Adicionar alimento:
Selecionar produto salvo → Quantidade → Salvar
```

```txt
Concluir tarefa:
Toque único em "Concluir"
```

```txt
Iniciar treino:
Escolher tempo disponível → App monta treino → Iniciar
```

O app deve evitar formulários longos sempre que possível.

---

# 3. Rotina

## Objetivo

A área de rotina tem o intuito de ajudar o usuário a definir uma rotina fixa semanal e também permitir alterações específicas por dia, semana ou mês.

## Funcionamento básico

O usuário poderá criar uma rotina fixa para cada dia da semana.

Exemplo:

```txt
Segunda-feira
06:00 - Acordar
07:00 - Ir para escola
13:00 - Almoçar
15:00 - Estudar
18:00 - Treinar
23:00 - Dormir
```

## Alterações específicas

O app deve permitir alterar a rotina em diferentes níveis.

### Alteração em um único dia

Exemplo:

```txt
Na segunda-feira do dia 22/06, remover treino e adicionar consulta médica.
```

Essa alteração afeta apenas aquele dia.

### Alteração recorrente

Exemplo:

```txt
Alterar todas as segundas-feiras do mês de julho.
```

Essa alteração afeta apenas as segundas dentro do período selecionado.

### Alteração permanente

Exemplo:

```txt
A partir de agora, toda segunda-feira terá treino às 18:00.
```

Essa alteração modifica o modelo fixo da rotina.

## Tipos de eventos da rotina

* Escola.
* Trabalho.
* Estudo.
* Treino.
* Alimentação.
* Sono.
* Lazer.
* Projeto pessoal.
* Família.
* Compromisso.
* Descanso.
* Tarefa livre.

## Campos de um evento

```json
{
  "titulo": "Estudar programação",
  "tipo": "Estudo",
  "inicio": "15:00",
  "fim": "16:00",
  "repeticao": "Toda segunda-feira",
  "areaDaVida": ["Estudos", "Projetos"],
  "notificar": true,
  "descricao": "Estudar lógica e desenvolvimento do projeto pessoal."
}
```

## Recursos importantes

* Criar rotina fixa semanal.
* Editar somente um dia específico.
* Editar todas as ocorrências futuras.
* Editar apenas um mês específico.
* Adicionar tarefas variáveis por dia.
* Mostrar agenda diária.
* Mostrar semana completa.
* Notificar antes de cada atividade.
* Integrar rotina com treinos, estudos, finanças e hábitos.

---

# 4. Contador de Calorias e Controle Alimentar

## Objetivo

Ajudar o usuário a registrar o que comeu durante o dia, acompanhar calorias e observar nutrientes importantes, como açúcar, sal, proteínas e gorduras.

O foco não deve ser obsessão por calorias, mas sim consciência alimentar, energia e equilíbrio.

## Cadastro de alimentos/produtos

O usuário poderá criar alimentos personalizados para reutilizar depois.

Exemplo:

```txt
Produto: Halls
Calorias: 15 kcal
Açúcar: 3g
Tipo: Doce / Bala
```

Assim, ao consumir novamente, o usuário não precisa preencher tudo do zero. Basta selecionar o produto salvo.

## Campos de um alimento

```json
{
  "nome": "Halls",
  "calorias": 15,
  "acucar": 3,
  "sal": 0,
  "proteinas": 0,
  "gorduras": 0,
  "carboidratos": 4,
  "categoria": "Doce",
  "porcao": "1 unidade"
}
```

## Registro diário

O usuário poderá registrar alimentos de duas formas:

### Registro rápido

```txt
Selecionar alimento salvo → informar quantidade → salvar
```

### Registro personalizado

```txt
Nome → calorias → categoria → salvar
```

## Alertas inteligentes

O app poderá avisar quando o usuário estiver próximo de exceder algum limite.

Exemplos:

```txt
Seu consumo de açúcar está alto hoje. Tente equilibrar nas próximas refeições.
```

```txt
Você consumiu pouca proteína hoje, principalmente considerando seu treino.
```

```txt
Você está há muitas horas sem comer. Seu rendimento pode cair.
```

```txt
Você bebeu pouca água hoje. Isso pode afetar energia, foco e treino.
```

## Controle de água

O app também deve permitir registrar água consumida no dia.

Exemplo:

```txt
+250ml
+500ml
+1 copo
```

## Recursos importantes

* Cadastro de alimentos.
* Alimentos favoritos.
* Registro rápido.
* Histórico diário.
* Total de calorias do dia.
* Total de açúcar, sal, proteína e gorduras.
* Controle de água.
* Alertas simples.
* Relação entre alimentação, treino e energia.

## Cuidados

O app não deve incentivar restrição extrema, culpa alimentar ou metas agressivas.
O objetivo é ajudar o usuário a ter mais energia, saúde e equilíbrio.

---

# 5. Auxílio de Treino

## Objetivo

Montar treinos personalizados com base no tempo disponível, objetivos do usuário e histórico de treinos anteriores.

O usuário poderá marcar na rotina um horário como treino e definir apenas o tempo disponível. O app então monta a melhor sessão possível.

Exemplo:

```txt
Hoje tenho 45 minutos para treinar.
```

O app pode montar:

```txt
10 min - Aquecimento
20 min - Força
10 min - Karatê
5 min - Alongamento
```

## Tipos de treino

O usuário poderá escolher áreas de interesse, como:

* Ganho de força.
* Perda de peso.
* Resistência.
* Karatê.
* Parkour.
* Futebol.
* Vôlei.
* Mobilidade.
* Alongamento.
* Recuperação.

## Lógica de equilíbrio

O app deve evitar repetir treinos pesados do mesmo tipo em sequência.

Exemplo:

```txt
Se ontem foi treino pesado de pernas, hoje priorizar técnica, mobilidade ou parte superior.
```

O app deve considerar:

* Tempo disponível.
* Treino anterior.
* Próximo treino planejado.
* Nível de cansaço.
* Objetivo semanal.
* Áreas que precisam evoluir.
* Necessidade de descanso.

## Campos de um treino

```json
{
  "tipo": "Força + Karatê",
  "duracao": 45,
  "intensidade": "Média",
  "objetivo": "Equilíbrio entre força e técnica",
  "exercicios": [],
  "status": "Pendente"
}
```

---

# 6. Modo Imersivo de Treino

## Objetivo

Guiar o usuário durante o treino, exercício por exercício, com cronômetro, séries, descanso e instruções visuais.

## Funcionamento

Durante o treino, o app entra em uma tela imersiva com foco total na atividade.

Exemplo:

```txt
Exercício atual: Prancha
Duração: 1 minuto
Séries: 3
Descanso: 45 segundos
```

O app deve:

* Iniciar cronômetro.
* Contar tempo do exercício.
* Contar descanso.
* Avisar próxima série.
* Informar quando concluir.
* Mostrar instruções.
* Registrar desempenho.

## Exercícios por tempo

Exemplo:

```txt
Prancha - 1 minuto
Alongamento - 40 segundos
Corrida parada - 2 minutos
```

## Exercícios por repetição

Exemplo:

```txt
Flexão - 12 repetições
Agachamento - 15 repetições
Abdominal - 20 repetições
```

O usuário pode marcar manualmente quando terminar a série.

## Corridas

Para corridas, o app deve futuramente se conectar a plataformas de saúde, como HealthKit ou Health Connect, para analisar:

* Distância percorrida.
* Tempo total.
* Velocidade média.
* Ritmo.
* Quedas de desempenho.
* Evolução entre corridas.
* Dicas para melhorar.

## Técnicas de karatê, parkour e esportes

Para técnicas, o app pode usar vídeo, animação ou boneco demonstrativo.

Exemplo:

```txt
Chute de chapa
- Mostrar boneco executando o movimento.
- Dar zoom no pé.
- Destacar a parte correta de contato.
- Mostrar erros comuns.
- Explicar como corrigir.
```

## Recursos futuros

* Vídeos demonstrativos.
* Boneco 2D/3D.
* Animações.
* Zoom em partes do corpo.
* Reconhecimento por câmera.
* Correção de postura.
* Feedback automático.

---

# 7. Incentivo a Bons Hábitos

## Objetivo

Ajudar o usuário a reduzir hábitos ruins e aumentar hábitos positivos.

## Controle de redes sociais

O app poderá verificar ou auxiliar o controle de tempo em redes sociais como:

* TikTok.
* Instagram.
* X/Twitter.
* Facebook.
* Outros apps definidos pelo usuário.

O YouTube deve ser tratado de forma diferente, pois pode ser usado para estudo, arte, lazer ou aprendizado.

## Avisos de uso excessivo

Exemplos:

```txt
Você está há 25 minutos no Instagram. Quer voltar para sua missão do dia?
```

```txt
Seu horário de estudo começou. Evite redes sociais agora.
```

```txt
Você já usou TikTok por muito tempo hoje. Que tal trocar por leitura, treino ou descanso?
```

## Limite de tela

O app pode ter níveis de bloqueio ou controle.

### Nível 1 - Aviso leve

Apenas notifica o usuário.

### Nível 2 - Alerta de rotina

Avisa que aquele horário deveria ser usado para outra atividade.

### Nível 3 - Bloqueio durante foco

Durante estudo ou treino, o app bloqueia ou dificulta acesso aos apps definidos.

### Nível 4 - Liberação por missão

O usuário libera tempo de rede social ao concluir atividades importantes.

Exemplo:

```txt
Conclua 30 minutos de estudo para liberar 15 minutos de Instagram.
```

---

# 8. Recomendações de Arte e Lazer de Qualidade

## Objetivo

Incentivar o usuário a usar o tempo livre com mais qualidade, em vez de ficar preso em rolagem infinita.

O app pode recomendar:

* Livros.
* Mangás.
* Filmes.
* Séries.
* Documentários.
* Músicas.
* Jogos.
* Conteúdos educativos.

## Funcionamento

O app pode sugerir algo de acordo com:

* Humor do usuário.
* Tempo livre disponível.
* Objetivo do dia.
* Preferências pessoais.
* Plataformas disponíveis.
* Conteúdos em alta.

## Exemplo

```txt
Você tem 40 minutos livres.
Sugestão: ler um capítulo de um mangá ou assistir um episódio curto de uma série.
```

```txt
Hoje seu dia foi pesado. Talvez seja melhor escolher um lazer leve em vez de redes sociais.
```

---

# 9. Planejador de Estudos

## Objetivo

Quando chegar o horário de estudos na rotina, o app deve indicar uma matéria e uma unidade específica para o usuário estudar.

## Funcionamento

O usuário poderá cadastrar:

* Matérias.
* Tópicos.
* Unidades.
* Dificuldade.
* Prioridade.
* Data de prova.
* Última revisão.
* Nível de domínio.

## Exemplo

```json
{
  "materia": "Geografia",
  "topico": "Capitalismo x Socialismo",
  "dificuldade": "Média",
  "prioridade": "Alta",
  "ultimaRevisao": "2026-06-09",
  "nivelDominio": 60
}
```

## Sugestão automática

Quando chegar o horário de estudo:

```txt
Agora é horário de estudo.

Sugestão:
Geografia — Capitalismo x Socialismo

Motivo:
Esse tópico está com prioridade alta e ainda não foi revisado esta semana.
```

## Tipos de estudo

* Estudo novo.
* Revisão.
* Exercícios.
* Resumo.
* Simulado.
* Leitura.
* Projeto prático.

---

# 10. Controle Financeiro

## Objetivo

Ajudar o usuário a controlar entradas, saídas, gastos fixos, gastos variáveis, comprovantes e sobras mensais.

A ideia é que o app funcione como um contador financeiro pessoal simples, rápido e inteligente.

O usuário deve conseguir ver:

* Quanto entrou no mês.
* Quanto saiu no mês.
* Quanto sobrou.
* Quanto já está comprometido com gastos fixos.
* Quais categorias mais gastaram.
* Gráficos de gastos.
* Alertas sobre excesso em certas áreas.
* Sugestões para guardar ou investir dinheiro quando houver sobra.

## Registro de entradas

O usuário poderá registrar dinheiro recebido.

Exemplos:

```txt
Salário
Freelancer
Presente
Venda
Pix recebido
Trabalho extra
```

## Campos de entrada

```json
{
  "valor": 500,
  "categoria": "Trabalho",
  "descricao": "Pagamento semanal",
  "data": "2026-06-09",
  "recorrente": false
}
```

## Registro de saídas

O usuário poderá registrar gastos de forma rápida.

Exemplo de fluxo ideal:

```txt
Valor → Categoria → Salvar
```

Exemplo:

```txt
R$ 18,00 → Lanche → Salvar
```

## Categorias de gastos

* Alimentação.
* Transporte.
* Escola.
* Trabalho.
* Lazer.
* Roupas.
* Jogos.
* Assinaturas.
* Família.
* Saúde.
* Treino.
* Projetos.
* Emergência.
* Outros.

## Campos de saída

```json
{
  "valor": 18,
  "categoria": "Alimentação",
  "descricao": "Lanche",
  "data": "2026-06-09",
  "formaPagamento": "Pix",
  "comprovante": null,
  "fixo": false
}
```

## Gastos fixos

O app deve permitir cadastrar gastos que se repetem todo mês.

Exemplos:

```txt
Assinatura
Internet
Curso
Academia
Transporte
Mensalidade
Conta recorrente
```

## Campos de gasto fixo

```json
{
  "nome": "Academia",
  "valor": 80,
  "categoria": "Treino",
  "diaVencimento": 10,
  "recorrencia": "Mensal",
  "ativo": true
}
```

## Gasto rápido

O app deve ter uma tela extremamente simples para adicionar gastos rapidamente.

Exemplo:

```txt
[ R$ 0,00 ]

Categorias rápidas:
Alimentação | Transporte | Lazer | Projeto | Outros

Botão:
Salvar
```

Também pode ter botões inteligentes:

```txt
+ R$ 5
+ R$ 10
+ R$ 20
+ R$ 50
```

## Comprovantes

O usuário poderá adicionar imagem de comprovantes.

Formas possíveis:

* Tirar foto.
* Enviar imagem da galeria.
* Anexar print de Pix.
* Anexar recibo.

## Futuramente

O app poderá ler a imagem do comprovante e tentar identificar automaticamente:

* Valor.
* Data.
* Estabelecimento.
* Categoria provável.
* Forma de pagamento.

## Gráficos financeiros

O app deve exibir gráficos como:

* Gastos por categoria.
* Evolução de gastos no mês.
* Entradas x saídas.
* Gastos fixos x gastos variáveis.
* Sobra mensal.
* Comparação com meses anteriores.

## Exemplo de resumo mensal

```txt
Resumo de Junho

Entradas: R$ 1.200,00
Saídas: R$ 760,00
Gastos fixos: R$ 300,00
Gastos variáveis: R$ 460,00
Sobra atual: R$ 440,00

Categoria com maior gasto:
Alimentação — R$ 230,00
```

## Alertas inteligentes

O app pode alertar sobre excesso de gastos.

Exemplos:

```txt
Você gastou bastante com alimentação fora de casa esta semana.
Talvez valha reduzir nos próximos dias.
```

```txt
Seu gasto com lazer já passou do limite definido para o mês.
```

```txt
Você ainda tem uma boa sobra este mês. Considere guardar uma parte.
```

```txt
Antes de comprar isso, veja se ainda cabe na sua meta financeira do mês.
```

## Metas financeiras

O usuário poderá definir metas como:

```txt
Guardar R$ 200 no mês.
Juntar R$ 1.000 para um notebook.
Separar dinheiro para projeto pessoal.
Reduzir gastos com lanche.
```

## Campos de meta

```json
{
  "nome": "Guardar para notebook",
  "valorObjetivo": 1000,
  "valorAtual": 250,
  "prazo": "2026-12-31",
  "categoria": "Tecnologia"
}
```

## Sugestões de economia

O app pode sugerir pequenas ações.

Exemplos:

```txt
Se você reduzir R$ 10 por semana em lanches, guarda R$ 40 no mês.
```

```txt
Você teve sobra no mês. Uma opção é separar parte para reserva e parte para seus projetos.
```

```txt
Seu gasto fixo está baixo em relação ao que entrou. Bom momento para guardar dinheiro.
```

## Cuidados

O app não deve recomendar investimentos específicos sem configuração clara do usuário.

O foco inicial deve ser:

* Gastar com consciência.
* Evitar desperdício.
* Guardar dinheiro.
* Planejar compras.
* Criar reserva.
* Controlar impulsos.

---

# 11. Sistema de Áreas da Vida

## Objetivo

Dividir a vida do usuário em áreas principais para medir equilíbrio e evolução.

## Áreas sugeridas

* Corpo.
* Mente.
* Estudos.
* Trabalho.
* Fé / Propósito.
* Família.
* Projetos.
* Lazer.
* Sono.
* Alimentação.
* Finanças.

## Funcionamento

Cada tarefa, hábito, treino, estudo, gasto ou projeto pode ser vinculado a uma área.

Exemplo:

```txt
Treino de força → Corpo
Estudar programação → Estudos / Projetos
Guardar dinheiro → Finanças
Ler livro → Mente / Lazer
Dormir cedo → Sono
```

## Pontuação por área

O app pode calcular uma pontuação diária e semanal.

Exemplo:

```txt
Corpo: 80%
Estudos: 60%
Sono: 40%
Finanças: 70%
Lazer: 30%
```

## Alertas

```txt
Você evoluiu bem em Corpo e Projetos, mas negligenciou Sono nos últimos dias.
```

```txt
Sua área de Finanças está boa esta semana, você registrou seus gastos e manteve sobra.
```

---

# 12. Missão do Dia

## Objetivo

Criar uma missão principal diária para guiar o usuário.

Em vez de mostrar apenas várias tarefas soltas, o app define um foco principal.

## Exemplo

```txt
Missão de hoje:
Estudar programação por 1 hora, treinar 45 minutos e dormir antes das 23h30.
```

## Tipos de missão

* Missão de estudo.
* Missão de treino.
* Missão financeira.
* Missão de foco.
* Missão de descanso.
* Missão de projeto.
* Missão de organização.
* Missão familiar.
* Missão espiritual/reflexiva.

## Missão financeira

Exemplo:

```txt
Missão financeira de hoje:
Não gastar com lanche fora e registrar todos os gastos do dia.
```

## Regras

* A missão deve considerar a rotina.
* A missão deve ser possível dentro do dia.
* A missão deve evitar excesso.
* O usuário pode aceitar, editar ou recusar.
* A missão gera XP ao ser concluída.

---

# 13. Sistema de XP, Níveis e Progresso

## Objetivo

Transformar ações reais do usuário em progresso visual, criando motivação e sensação de evolução.

## Exemplos de XP

```txt
Estudar 30 minutos: +10 XP
Treinar 45 minutos: +20 XP
Beber água suficiente: +10 XP
Dormir no horário: +15 XP
Concluir missão do dia: +30 XP
Registrar gastos do dia: +10 XP
Guardar dinheiro no mês: +25 XP
Fazer revisão semanal: +25 XP
```

## Níveis sugeridos

```txt
Nível 1 - Iniciante
Nível 5 - Organizado
Nível 10 - Disciplinado
Nível 20 - Focado
Nível 35 - Imparável
Nível 50 - Mestre da Rotina
Nível 75 - Alta Performance
Nível 100 - Lenda Pessoal
```

## Conquistas sugeridas

```txt
Primeira Missão Concluída
7 Dias de Consistência
Primeiro Treino Completo
Primeira Semana Organizada
Projeto em Movimento
Mente Forte
Sono em Dia
Finanças Controladas
Primeira Meta Financeira
Rotina Blindada
```

## Cuidados

O app não deve punir demais falhas.
O foco deve ser progresso, não culpa.

---

# 14. Diário de Evolução

## Objetivo

Permitir que o usuário registre pensamentos, aprendizados, dificuldades e vitórias do dia.

## Perguntas diárias

```txt
Como foi meu dia?
O que eu fiz bem hoje?
O que eu poderia ter feito melhor?
Qual foi minha maior distração?
Qual foi minha maior vitória?
O que quero melhorar amanhã?
Como foi minha energia?
Como foi meu humor?
Gastei dinheiro de forma consciente hoje?
```

## Dados registrados

* Humor.
* Energia.
* Produtividade.
* Sono.
* Alimentação.
* Treino.
* Estudos.
* Finanças.
* Vitória do dia.
* Erro do dia.
* Aprendizado do dia.
* Observações livres.

## Exemplo

```txt
Hoje eu estudei programação por 1 hora e treinei mesmo cansado.
Gastei mais do que queria com lanche, mas registrei tudo.
Amanhã quero evitar gasto desnecessário e dormir mais cedo.
```

## Futuro

O app pode identificar padrões.

Exemplo:

```txt
Você costuma gastar mais quando dorme pouco.
```

```txt
Você treina melhor nos dias em que se alimenta antes do treino.
```

---

# 15. Sistema de Projetos Pessoais

## Objetivo

Organizar projetos pessoais dentro do app.

## Exemplos de projetos

* Jogo Arkadya.
* Site Ashby.
* Canal Arco Final.
* Anticheat.
* Estudos de Cyber Segurança.
* Projeto pessoal de treino.
* Projeto financeiro.

## Estrutura de projeto

```json
{
  "nome": "Jogo Arkadya",
  "descricao": "Jogo 2D offline sobre Reo, um garoto que ganha poderes de telecinese após acidente com plasma.",
  "status": "Em andamento",
  "prioridade": "Alta",
  "progresso": 15,
  "proximaTarefa": "Criar sistema de movimentação do personagem",
  "area": "Projetos",
  "tempoInvestido": 0
}
```

## Funcionalidades

* Criar projetos.
* Criar tarefas dentro de projetos.
* Definir próxima ação.
* Medir progresso.
* Registrar tempo investido.
* Vincular projeto à missão do dia.
* Definir prioridade.
* Guardar ideias rápidas.

## Exemplo de alerta

```txt
Você não mexe no projeto "Jogo Arkadya" há 5 dias.
Quer separar 30 minutos hoje para avançar?
```

---

# 16. Conselheiro de Rotina

## Objetivo

Analisar a rotina do usuário e sugerir ajustes quando houver excesso, conflito ou desequilíbrio.

## O app deve verificar

* Conflito de horário.
* Excesso de tarefas.
* Pouco descanso.
* Treino pesado em sequência.
* Estudo pesado após dia cansativo.
* Falta de sono.
* Falta de refeições.
* Gastos excessivos.
* Área da vida negligenciada.

## Exemplos

```txt
Você marcou treino pesado após um dia cheio de escola e trabalho.
Sugestão: fazer um treino técnico de 45 minutos ou alongamento.
```

```txt
Você colocou estudo pesado às 23h30, mas precisa acordar cedo amanhã.
Sugestão: fazer uma revisão leve de 20 minutos.
```

```txt
Você gastou bastante hoje e ainda tem compromisso no fim de semana.
Sugestão: evitar gastos pequenos nos próximos dias.
```

---

# 17. Revisão Semanal

## Objetivo

Criar um momento semanal para analisar evolução, falhas, padrões e próximos passos.

## Dados analisados

* Missões concluídas.
* Tarefas concluídas.
* Treinos feitos.
* Estudos realizados.
* Projetos avançados.
* Uso de redes sociais.
* Alimentação.
* Sono.
* Humor.
* Energia.
* Gastos da semana.
* Dinheiro guardado.
* Áreas da vida mais fortes.
* Áreas da vida mais fracas.

## Exemplo de relatório

```txt
Resumo da Semana

Você concluiu 5 de 7 missões diárias.
Treinou 4 vezes.
Estudou 3 vezes.
Avançou em 2 projetos.
Registrou gastos em 6 de 7 dias.
Gastou mais com alimentação fora de casa.
Seu melhor ponto foi treino.
Seu pior ponto foi sono.

Sugestão:
Dormir mais cedo e reduzir gastos pequenos durante a semana.
```

## Recursos

* Nota da semana.
* Gráfico de consistência.
* Pontos fortes.
* Pontos fracos.
* Sugestões.
* Comparação com semanas anteriores.
* Planejamento da próxima semana.

---

# 18. Banco de Inspiração

## Objetivo

Guardar referências que motivam o usuário.

## Tipos de inspiração

* Frases.
* Cenas.
* Personagens.
* Músicas.
* Livros.
* Mangás.
* Filmes.
* Séries.
* Vídeos.
* Imagens.
* Ideias pessoais.

## Categorias

* Disciplina.
* Coragem.
* Fé.
* Família.
* Foco.
* Treino.
* Estudos.
* Projetos.
* Superação.
* Descanso.
* Finanças.

## Exemplo

```json
{
  "titulo": "Disciplina acima da motivação",
  "tipo": "Frase",
  "categoria": "Disciplina",
  "conteudo": "Você não precisa estar motivado, precisa cumprir o que decidiu.",
  "tags": ["treino", "foco", "rotina"]
}
```

## Uso inteligente

O app pode mostrar inspirações de acordo com o momento.

Exemplo:

```txt
Você está prestes a treinar.
Inspiração: disciplina vence motivação.
```

```txt
Você está pensando em gastar por impulso.
Inspiração: dinheiro guardado também é liberdade.
```

---

# 19. Integração Entre os Módulos

## Objetivo

Fazer com que os módulos conversem entre si.

O app não deve ter várias funções isoladas. Ele deve entender o contexto geral da vida do usuário.

## Fluxo diário ideal

```txt
1. O app lê a rotina do dia.
2. Verifica tempo livre.
3. Analisa áreas da vida negligenciadas.
4. Verifica treinos anteriores.
5. Verifica estudos pendentes.
6. Verifica gastos recentes.
7. Sugere uma missão do dia.
8. Durante o treino, ativa o modo imersivo.
9. No horário de estudo, sugere uma matéria.
10. Durante foco, reduz distrações.
11. Ao registrar comida, atualiza energia e alimentação.
12. Ao registrar gasto, atualiza finanças.
13. No fim do dia, pede reflexão no diário.
14. Atualiza XP, níveis e áreas da vida.
15. No domingo, gera revisão semanal.
```

## Relações entre módulos

```txt
Rotina → Missão do Dia
Missão do Dia → XP
Treino → Corpo / Energia / XP
Calorias → Energia / Alimentação
Estudos → Mente / Estudos / XP
Projetos → Missão / Progresso
Finanças → Consciência / Metas / XP
Diário → Humor / Energia / Padrões
Tempo de Tela → Foco / Hábitos
Revisão Semanal → Próxima Semana
```

---

# 20. Interface e Experiência do Usuário

## Objetivo

Criar uma interface bonita, rápida e fácil de usar.

O app deve passar a sensação de:

* Controle.
* Evolução.
* Clareza.
* Foco.
* Motivação.
* Modernidade.
* Praticidade.

## Tela inicial ideal

A tela inicial deve mostrar o essencial do dia.

Exemplo:

```txt
Bom dia, Leo.

Missão de hoje:
Estudar 1h, treinar 45min e registrar gastos.

Próxima atividade:
07:00 - Escola

Resumo rápido:
XP: 230/500
Energia: Média
Finanças do mês: R$ 320 sobrando
Treino de hoje: Pendente
Estudo: Pendente
```

## Ações rápidas na tela inicial

* Adicionar gasto.
* Adicionar alimento.
* Iniciar treino.
* Concluir tarefa.
* Registrar água.
* Abrir missão do dia.
* Registrar humor.
* Adicionar ideia de projeto.

## Regra dos 3 segundos

As ações mais comuns devem poder ser iniciadas em até 3 segundos.

---

# 21. Privacidade

## Objetivo

Como o app lida com dados pessoais, ele deve priorizar privacidade.

Dados sensíveis do app:

* Rotina.
* Alimentação.
* Saúde.
* Treino.
* Finanças.
* Humor.
* Diário.
* Projetos.
* Uso de apps.
* Comprovantes.

## Regras

* Guardar dados localmente sempre que possível.
* Permitir backup opcional.
* Não compartilhar dados sem autorização.
* Permitir apagar dados.
* Proteger diário e finanças com senha/biometria.
* Separar permissões por funcionalidade.

---

# 22. Ordem Recomendada de Implementação

## Fase 1 — Base do app

* Rotina.
* Missão do Dia.
* Tarefas rápidas.
* Áreas da Vida.
* XP e níveis.
* Diário simples.

## Fase 2 — Controle pessoal

* Contador de calorias.
* Controle de água.
* Controle financeiro.
* Gastos fixos.
* Gráficos simples.
* Projetos pessoais.

## Fase 3 — Treino e estudos

* Auxílio de treino.
* Modo imersivo básico.
* Biblioteca de exercícios.
* Planejador de estudos.
* Sugestões por rotina.

## Fase 4 — Inteligência

* Conselheiro de rotina.
* Revisão semanal.
* Sugestões automáticas.
* Alertas inteligentes.
* Integração entre módulos.

## Fase 5 — Recursos avançados

* HealthKit / Health Connect.
* Monitoramento de tempo de tela.
* Bloqueio de apps.
* Leitura de comprovantes por imagem.
* Animações de treino.
* Recomendações de arte e lazer.
* IA para sugestões mais personalizadas.

---

# 23. MVP Inicial Recomendado

A primeira versão do app deve ser simples, mas útil.

## MVP obrigatório

* Criar rotina semanal.
* Criar alterações por dia.
* Criar missão do dia.
* Registrar tarefas concluídas.
* Ganhar XP.
* Registrar alimentos.
* Registrar água.
* Registrar gastos.
* Cadastrar gastos fixos.
* Ver resumo financeiro mensal.
* Criar projetos.
* Registrar diário do dia.

## MVP não obrigatório no início

* Bloqueio real de apps.
* Integração com Health.
* Leitura automática de comprovantes.
* IA avançada.
* Animações de treino.
* Recomendações em tempo real.
* Reconhecimento por câmera.

---

# 24. Resumo Final

O aplicativo será um sistema de controle pessoal e auto-desenvolvimento.

Ele deve ajudar o usuário a:

* Organizar a rotina.
* Comer melhor.
* Treinar melhor.
* Estudar melhor.
* Gastar melhor.
* Descansar melhor.
* Evoluir em projetos.
* Reduzir distrações.
* Refletir sobre o próprio progresso.
* Criar consistência.

A prioridade do app deve ser praticidade.
Se for difícil de registrar, o usuário não vai usar.
Por isso, cada módulo deve ser rápido, direto e inteligente.

O app ideal não deve apenas armazenar informações.
Ele deve ajudar o usuário a tomar decisões melhores todos os dias.
