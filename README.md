# **Programação Móvel - API Fake**

Projeto de apoio às aulas da disciplina de Programação Móvel. Este repositório mantém uma API fake criada a partir do serviço `my-json-server` para que possamos testar as requisições HTTP realizadas pelos aplicativos desenvolvidos em sala.
</br>


## **Baixando a versão mais atual do projeto**

1. Abra o terminal e acesse a pasta do projeto ou abra o terminal da própria IDE (VSCode ou Android Studio)
2. Execute o comando: `git pull origin main`
   </br>

## **Criando sua própria API Fake**

1. Crie um repositório público no GitHub (pode ser um fork deste projeto ou um repositório novo).
2. Adicione um arquivo JSON (`db.json`) na raiz do repositório com os dados que deseja servir.
3. Acesse `https://my-json-server.typicode.com/<seu-usuario>/<seu-repositorio>` para consultar a API fake gerada automaticamente.
4. Para testar endpoints específicos, adicione o nome do recurso, por exemplo: `https://my-json-server.typicode.com/<seu-usuario>/<seu-repositorio>/properties`.
5. Sempre que editar o arquivo JSON e fizer um novo `commit` em `main`, os dados serão atualizados na API fake após alguns segundos.

Dica: mantenha a estrutura dos dados simples (apenas objetos e arrays) e evite valores calculados ou funções, pois o serviço expõe apenas o conteúdo estático do arquivo JSON.
</br>

## **Consumindo a API fake**

- A API pública está disponível em: `https://my-json-server.typicode.com/tarsisms/fake-api`
- Os principais recursos são:
    - `GET /properties` — lista os imóveis cadastrados
    - `GET /users` — retorna os usuários de teste (apenas para fins de autenticação mockada)
