# *Application Programming Interface*

##  Desafio Proposto
### Sistema de Controle e Análise de Abastecimento das Viaturas do IPEM – Regional de São José dos Campos.

Atualmente, o controle de abastecimento das viaturas da Regional de São José dos Campos é realizado de forma manual. Os condutores registram as informações — como quilometragem, quantidade de combustível, valor abastecido e identificação do condutor — em pranchetas físicas mantidas dentro de cada veículo.
Após o preenchimento, o Diretor da unidade precisa reunir todas as anotações, conferi-las individualmente e consolidar os dados para controle interno e posterior inserção no sistema SGI. Esse fluxo manual compromete a eficiência da gestão, tornando difícil realizar análises comparativas entre as viaturas, acompanhar o consumo médio de combustível ou identificar rapidamente possíveis inconsistências nos registros.

##  Objetivo

Desenvolver um sistema web que permita o registro digital dos abastecimentos pelos condutores, a validação gerencial das informações e a geração de relatórios analíticos. A solução deve organizar os dados de forma estruturada, agilizar o processo de conferência e facilitar a consolidação mensal, promovendo maior transparência e eficiência no controle da frota.

##  Backlog do produto





##  Cronograma das Sprints
| Sprint | Período | Entregas Principais |
|--------|---------|---------------------|
| Sprint 1 | 16/03-05/04 | •  |
| Sprint 2 | 13/04-03/05 | •  |
| Sprint 3 | 11/05-31/05 | •  |


## Tecnologias utlizadas 

### Backend
![IntelliJ Community](https://img.shields.io/badge/IntelliJ_Community-2E7D32?style=for-the-badge&logo=intellij-idea&logoColor=white)
![Java](https://img.shields.io/badge/Java-%23ED8B00.svg?style=for-the-badge&logo=openjdk&logoColor=white&labelColor=2C2C2C)
![Maven](https://img.shields.io/badge/Apache_Maven-C71A36?style=for-the-badge&logo=apache-maven&logoColor=white&labelColor=2C2C2C)

## Frontend
![Figma](https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white&labelColor=2C2C2C)
![Canva](https://img.shields.io/badge/Canva-00C4CC?style=for-the-badge&logo=canva&logoColor=white&labelColor=2C2C2C)


## Ferramentas e gestão
![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)
![GitHub Projects](https://img.shields.io/badge/GitHub_Projects-181717?style=for-the-badge&logo=github&logoColor=white)
![GitHub Desktop](https://img.shields.io/badge/GitHub_Desktop-6f42c1?style=for-the-badge&logo=github&logoColor=white)
![Google Drive](https://img.shields.io/badge/Google%20Drive-4285F4?style=for-the-badge&logo=google-drive&logoColor=white)


### Gerenciamento de Projeto
*Ferramenta escolhida para gestão das Stories e Tarefas:*
- **Plataforma**: GitHub Projects
- **Link do Board**: GitHub Projects
- **Estrutura dos Cards**:
  - Histórias de Usuário (formato: "Como - quero - para ")
  - Tarefas divididas em sub-tarefas
  - Assignees definidos por tarefa
  - Labels para categorização
  - Checkpoints de progresso

## Estrutura de Rastreabilidade
| Sprint | Story | Tarefas Relacionadas |
|--------|-------|----------------------|
| Sprint 1 | US-01: *Descrição* | • TASK-001: • TASK-002:  |
| Sprint 2 | US-02: *Descrição* | • TASK-003: • TASK-004:  |
| Sprint 3 | US-03: *Descrição* | • TASK-005: • TASK-006:  |

## Estrutura de commmit 
| `<tipo>`  | Descrição | Exemplo |
|-----------|-----------|---------|
|  `<feat>` | Adição de um recurso, uma "freature" (funcionalidade). | feat(AB-123, AB-56): Implementação dos repositories usados nas operações com as tabelas de variações climáticas. |
|  `<fix>`  | Correção de bug. | fix(#45): Correção do componente de seleção de município. |         
| `<docs>` | Atualização de documentação. | docs(#45): Inclusão de diagrama de modelo de BD para a aplicação. |
| `<style>` | Mudança de formatação, sem afetar o código. | style(AB-123, AB-56): Ajuste de nomes para variáveis para o padrão camelCase. |
| `<refactor>` | Refatoração do código, sem alterar a funcionalidade. | refactor(AC-34): Padronização de nomes designados a atributos. |
| `<test>` | Adiciona ou modifica testes. | test(AD-09): Adição de teste de controle de tabela. |
| `<chore>` | Atualizações menores que não impactam diretamente a funcionalidade do código. | chore(auth): atualiza versão do Spring Boot para 2.7.0 |
> **Nota:** Substitua `(rank)` pelo identificador da tarefa (ex: `AB-123`, `#45`, `US-01`). Se não houver código, use um escopo descritivo como `(auth)`.


##  Estrutura de Branches
| Branch       | Duração | Propósito                                          | Origem       | Integração                          |
|--------------|---------|----------------------------------------------------|--------------|-------------------------------------|
| `main`       | Longa   | Versão estável e pronta para produção              | -            | Recebe merge de `frontend`/`backend`|
| `backend`    | Longa   | Desenvolvimento contínuo do backend                | `main`       | Recebe PRs de branches de feature   |
| `frontend`   | Longa   | Desenvolvimento contínuo do frontend               | `main`       | Recebe PRs de branches de feature   |
| `<tipo>`  | Curta   | Feature, correção ou refatoração específica        | `frontend`/`backend` | Abre PR para a branch de origem |


## Padrão de Nomenclatura de Branches
| Tipo       | Formato                           | Exemplo                          |
|------------|-----------------------------------|----------------------------------|
| Feature    | `feat Rank <descrição-curta>`     | `feat Rank tela-login`           |
| Correção   | `fix Rank <descrição-curta>`      | `fix Rank validação-email`       |
| Refatoração| `refactor Rank <descrição-curta>` | `refactor Rank modulariza-servicos` |


## Padrão de Títulos de Pull Requests (Conventional Commits simplificado)

| Tipo      | Escopo     | Descrição                                      | Exemplo de título do PR                          |
|-----------|------------|------------------------------------------------|--------------------------------------------------|
| `feat`    | `(rank)`   | Nova funcionalidade                            | `feat(rank): adiciona tela de dashboard`         |
| `fix`     | `(rank)`   | Correção de bug                                | `fix(rank): corrige erro ao salvar usuário`      |
| `docs`    | `(rank)`   | Mudanças na documentação                       | `docs(rank): atualiza README com instruções`     |
| `style`   | `(rank)`   | Alterações de formatação (espaços, indentação) | `style(rank): ajusta indentação do CSS`          |
| `refactor`| `(rank)`   | Refatoração sem mudar comportamento            | `refactor(rank): simplifica lógica de autenticação` |
| `test`    | `(rank)`   | Adição ou modificação de testes                | `test(rank): adiciona testes para o serviço de login` |
| `chore`   | `(rank)`   | Tarefas de manutenção (dependências, configs)  | `chore(rank): atualiza versão do React para 18.2` |

> **Nota:** Substitua `(rank)` pelo identificador da tarefa (ex: `AB-123`, `#45`, `US-01`). Se não houver código, use um escopo descritivo como `(auth)`.


## Equipe

| Foto | Nome | Função | GitHub | Linkedln |
|------|------|--------|--------|----------|
| <img src="https://github.com/user-attachments/assets/8ce7839a-0106-4864-9a8b-4a0f94c6e6fd" width="80px"> | Manuela Brito Migri | Scrum Master | [![GitHub](https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/ManuelaBrito) | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/manuela-brito-532a93219) |
| <img src="https://github.com/user-attachments/assets/b0640630-5480-4088-93fb-0f6021a2b20e" width="80px"> | Ana Letícia França | Product Owner | [![GitHub](https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/ana-franca-01)| [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)] |
| <img src="https://github.com/user-attachments/assets/b30a5634-a2c4-41de-ae57-478f9692318f" width="80px"> | Jhonatan Rossi | Desenvolvedor | [![GitHub](https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/JhowRossii) | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)] |
| <img src="https://github.com/user-attachments/assets/c107ecac-2e3f-46bd-a2fd-8f0ae7dbdde4" width="80px"> | Elder Henrique Silva | Desenvolvedor | [![GitHub](https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/3usder) | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/elder-henrique-23149bb9) |
| <img src="https://github.com/user-attachments/assets/7b87ea49-d593-4960-8a04-2388b5d63f8d" width="80px"> | João Pedro Menegasso | Desenvolvedor | [![GitHub](https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/menegasso0) | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/joaopedromenegasso/) |
| <img src="https://github.com/user-attachments/assets/91a8fb2c-151a-49cc-9666-1b613eebe3eb" width="80px"> | Pedro Henrique Quirino | Desenvolvedor | [![GitHub](https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/pedroquirino) | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/phpquirino/) |
| <img src="https://github.com/user-attachments/assets/e876e5d6-a2da-4408-af4c-a4ffe00c5152" width="80px"> | Giovanna Marques Rodrigues | Desenvolvedora | [![GitHub](https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Markeis24) | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/giovanna-marques-221998397) |
| <img src= "https://github.com/user-attachments/assets/0fa7866a-2f80-4a1b-a4d7-522381557605" width="80px"> | Guilherme Valim | Desenvolvedor | [![GitHub](https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/guivalim)| [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/guilherme-valim-bb3870375/) |

