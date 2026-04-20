# *Application Programming Interface*
# _IPEM CONTROL_ 

##  Desafio Proposto
### Sistema de Controle e Análise de Abastecimento das Viaturas do IPEM – Regional de São José dos Campos.
Atualmente, o controle de abastecimento das viaturas da Regional de São José dos Campos é realizado de forma manual. Os condutores registram as informações — como quilometragem, quantidade de combustível, valor abastecido e identificação do condutor — em pranchetas físicas mantidas dentro de cada veículo.
Após o preenchimento, o Diretor da unidade precisa reunir todas as anotações, conferi-las individualmente e consolidar os dados para controle interno e posterior inserção no sistema SGI. Esse fluxo manual compromete a eficiência da gestão, tornando difícil realizar análises comparativas entre as viaturas, acompanhar o consumo médio de combustível ou identificar rapidamente possíveis inconsistências nos registros.

##  Objetivo
Desenvolver um sistema web que permita o registro digital dos abastecimentos pelos condutores, a validação gerencial das informações e a geração de relatórios analíticos. A solução deve organizar os dados de forma estruturada, agilizar o processo de conferência e facilitar a consolidação mensal, promovendo maior transparência e eficiência no controle da frota.

##  Backlog do produto

| Código | Prioridade | User Story | Estimativa | Sprint | Status |
|--------|------------|------------|------------|--------|--------|
| #U01 | alta | Como usuário quero proteger meus dados, para garantir a integridade do sistema IPEM. | 2 | 1 | ✓ |
| #T01 | alta | Como técnico, quero registrar a saída da viatura, para fins de análise e gerenciamento. | 2 | 1 | ✓ |
| #T02 | alta | Como técnico, quero registrar o retorno da viatura, para gerenciamento de kilometragem. | 2 | 1 | ✓ |
| #T03 | alta | Como técnico, quero registrar abastecimentos, para manter controle preciso do consumo. | 2 | 1 | ♻️ |
| #A01 | média | Como administrador, quero cadastrar viaturas, para controle da frota. | 2 | 1 | ✓ |
| #A02 | média | Como administrador, quero cadastrar técnicos, para identificação nos registros. | 2 | 1 | ✓ |
| #A03 | média | Como administrador, quero visualizar qual técnico está utilizando cada viatura no dia, para manter controle operacional diário. | 3 | 1 | ✓ |
| #A04 | alta | Como administrador, quero visualizar o histórico completo de abastecimentos, para acompanhar padrões de consumo. | 3 | 2 |
| #A05 | alta | Como administrador, quero gerar relatório mensal de uso por viatura, para consolidação e envio ao SGI. | 5 | 2 |
| #A06 | alta | Como administrador, quero gerar relatório diário por técnico, antes da consolidação mensal, para validar registros e confiabilidade de dados. | 5 | 2 |
| #A07 | média | Como administrador, quero visualizar dashboard com gráficos comparativos entre viaturas, para facilitar análise estratégica. | 5 | 2 |
| #T04 | baixa | Como técnico, quero consultar o histórico completo de utilização da viatura. | 5 | 2 |
| #A08 | baixa | Como administrador, quero receber alerta automático quando a viatura atingir quilometragem pré-definida, para planejamento de manutenção. | 3 | 3 |
| #A09 | média | Como administrador, quero exportar relatórios em formato compatível com o SGI (CSV ou Excel), para facilitar a integração. | 5 | 3 |
| #A10 | baixa | Como administrador, quero poder compactar a aplicação e utilizá-la em forma de app, para facilitação do uso. | 5 | 3 |

##  Cronograma das Sprints
| Sprint | Período | Link documentação | Vídeo Youtube |
|--------|---------|-------------------|---------------|
| Sprint 1 | 16/03 - 05/04 | [![Docs 1ª Sprint](https://img.shields.io/badge/Docs-1ª_Sprint-blue?logo=github)](https://github.com/SquadTech-API/API-3/tree/ac7b23c342edacca8dcc3b31f1fa43d2b994d45e/docs%201%C2%BA%20Sprint) | [![YouTube](https://img.shields.io/badge/1º_Sprint_ADM-red?style=for-the-badge&logo=youtube)](https://www.youtube.com/watch?v=H91QZQpGf2M) [![YouTube](https://img.shields.io/badge/1º_Sprint_Téc-red?style=for-the-badge&logo=youtube)](https://www.youtube.com/watch?v=yK_N4FqFcNA)   |   
| Sprint 2 | 13/04 - 03/05 |   |
| Sprint 3 | 11/05 - 31/05 |   |
| Feira de Soluções |  11/06 |    |



## Tecnologias utlizadas - Backend
<div align="center" style="display: flex; flex-wrap: wrap; justify-content: center; gap: 10px;">
  <img src="https://img.shields.io/badge/IntelliJ_IDEA-000000?style=for-the-badge&logo=intellij-idea&logoColor=white&labelColor=2C2C2C" alt="IntelliJ IDEA" />
  <img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=openjdk&logoColor=white&labelColor=2C2C2C" alt="Java" />
  <img src="https://img.shields.io/badge/Apache_Maven-C71A36?style=for-the-badge&logo=apache-maven&logoColor=white&labelColor=2C2C2C" alt="Maven" />
  <img src="https://img.shields.io/badge/Postman-FF6C37?style=for-the-badge&logo=postman&logoColor=white&labelColor=2C2C2C" alt="Postman" />
</div>

## Tecnologias utlizadas - Frontend
<div align="center" style="display: flex; flex-wrap: wrap; justify-content: center; gap: 10px;">
  <img src="https://img.shields.io/badge/Figma-F24E1E?style=for-the-badge&logo=figma&logoColor=white&labelColor=2C2C2C" alt="Figma" />
  <img src="https://img.shields.io/badge/Icons8-FF6F00?style=for-the-badge&logo=icons8&logoColor=white&labelColor=2C2C2C" alt="Icons8" />
  <img src="https://img.shields.io/badge/Canva-00C4CC?style=for-the-badge&logo=canva&logoColor=white&labelColor=2C2C2C" alt="Canva" />
  <img src="https://img.shields.io/badge/VS%20Code-007ACC?style=for-the-badge&logo=visualstudiocode&logoColor=white&labelColor=2C2C2C" alt="VS Code" />
</div>

## Tecnologias utlizadas - Ferramentas e Gestão
<div align="center" style="display: flex; flex-wrap: wrap; justify-content: center; gap: 10px;">
  <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white&labelColor=2C2C2C" alt="GitHub" />
  <img src="https://img.shields.io/badge/GitHub_Projects-181717?style=for-the-badge&logo=github&logoColor=white&labelColor=2C2C2C" alt="GitHub Projects" />
  <img src="https://img.shields.io/badge/GitHub_Desktop-8250DF?style=for-the-badge&logo=github&logoColor=white&labelColor=2C2C2C" alt="GitHub Desktop" />
  <img src="https://img.shields.io/badge/Google_Drive-34A853?style=for-the-badge&logo=google-drive&logoColor=white&labelColor=2C2C2C" alt="Google Drive" />
  <img src="https://img.shields.io/badge/Microsoft_Excel-217346?style=for-the-badge&logo=microsoft-excel&logoColor=white&labelColor=2C2C2C" alt="Excel" />
  <img src="https://img.shields.io/badge/Discord-5865F2?style=for-the-badge&logo=discord&logoColor=white&labelColor=2C2C2C" alt="Discord" />
  <img src="https://img.shields.io/badge/Slack-4A154B?style=for-the-badge&logo=slack&logoColor=white&labelColor=2C2C2C" alt="Slack" />
</div>

## Como executar, usar e testar o projeto
- A realizar

## Link para a pasta de documentação
<div align="center" style="display: flex; flex-wrap: wrap; justify-content: center; gap: 10px;">
  <a href="https://github.com/SquadTech-API/API-3/blob/ac7b23c342edacca8dcc3b31f1fa43d2b994d45e/docs/DOR%20.pdf"><img src="https://img.shields.io/badge/DoR-Definition_of_Ready-0052CC?style=for-the-badge&logo=adobeacrobatreader&logoColor=white" alt="DoR" /></a>
  <a href="https://github.com/SquadTech-API/API-3/blob/ac7b23c342edacca8dcc3b31f1fa43d2b994d45e/docs/DOD.pdf"><img src="https://img.shields.io/badge/DoD-Definition_of_Done-2E8B57?style=for-the-badge&logo=adobeacrobatreader&logoColor=white" alt="DoD" /></a>
  <a href="https://github.com/SquadTech-API/API-3/blob/ac7b23c342edacca8dcc3b31f1fa43d2b994d45e/docs/Estrat%C3%A9gia%20de%20Branche%20e%20Pull%20Request.pdf"><img src="https://img.shields.io/badge/Estrat%C3%A9gia_de_Branch-Git_Flow-6A0DAD?style=for-the-badge&logo=git&logoColor=white" alt="Estratégia de Branch" /></a>
  <a href="https://github.com/SquadTech-API/API-3/blob/ac7b23c342edacca8dcc3b31f1fa43d2b994d45e/docs/Padroniza%C3%A7%C3%A3o%20de%20commit.pdf.pdf"><img src="https://img.shields.io/badge/Padr%C3%A3o_de_Commit-Conventional_Commits-FF6F00?style=for-the-badge&logo=git&logoColor=white" alt="Padrão de Commit" /></a>
  <a href="#"><img src="https://img.shields.io/badge/Manual_do_Usu%C3%A1rio-Em_breve-808080?style=for-the-badge&logo=readthedocs&logoColor=white" alt="Manual do Usuário (em breve)" /></a>
  <a href="#"><img src="https://img.shields.io/badge/Manual_de_Instala%C3%A7%C3%A3o-Em_breve-808080?style=for-the-badge&logo=readthedocs&logoColor=white" alt="Manual de Instalação (em breve)" /></a>
</div>


## Equipe

| Foto | Nome | Função | GitHub | Linkedln |
|------|------|--------|--------|----------|
| <img src="https://github.com/user-attachments/assets/8ce7839a-0106-4864-9a8b-4a0f94c6e6fd" width="80px"> | Manuela Brito Migri | Scrum Master | [![GitHub](https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/ManuelaBrito) | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/manuela-brito-532a93219) |
| <img src="https://github.com/user-attachments/assets/b0640630-5480-4088-93fb-0f6021a2b20e" width="80px"> | Ana Letícia França | Product Owner | [![GitHub](https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/ana-franca-01)| [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/ana-leticia-fran%C3%A7a-558387314) |
| <img src="https://github.com/user-attachments/assets/b30a5634-a2c4-41de-ae57-478f9692318f" width="80px"> | Jhonatan Rossi | Desenvolvedor | [![GitHub](https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/JhowRossii) | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/jhonatan-miranda-a25813377) |
| <img src="https://github.com/user-attachments/assets/c107ecac-2e3f-46bd-a2fd-8f0ae7dbdde4" width="80px"> | Elder Henrique Silva | Desenvolvedor | [![GitHub](https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/3usder) | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/elder-henrique-23149bb9) |
| <img src="https://github.com/user-attachments/assets/7b87ea49-d593-4960-8a04-2388b5d63f8d" width="80px"> | João Pedro Menegasso | Desenvolvedor | [![GitHub](https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/menegasso0) | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/joaopedromenegasso/) |
| <img src="https://github.com/user-attachments/assets/91a8fb2c-151a-49cc-9666-1b613eebe3eb" width="80px"> | Pedro Henrique Quirino | Desenvolvedor | [![GitHub](https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/pedroquirino) | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/phpquirino/) |
| <img src="https://github.com/user-attachments/assets/e876e5d6-a2da-4408-af4c-a4ffe00c5152" width="80px"> | Giovanna Marques Rodrigues | Desenvolvedora | [![GitHub](https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Markeis24) | [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/giovanna-marques-221998397) |
| <img src= "https://github.com/user-attachments/assets/0fa7866a-2f80-4a1b-a4d7-522381557605" width="80px"> | Guilherme Valim | Desenvolvedor | [![GitHub](https://img.shields.io/badge/GitHub-000000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/guivalim)| [![LinkedIn](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/guilherme-valim-bb3870375/) |

