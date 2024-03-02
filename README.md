# README

# EN
## Used technologies
- Ruby version 3.2.2.
- Rails 7.0.5.
- PostgreSQL.
- Elasticsearch.
- Bootstrap.
- Many other gems.
  
## Configuration
  - Necessary file .env in root path of project such as below.
     - Can you find a copy as `.example.env` in the project root path.
    ```ruby
      DB_USERNAME=postgres
      DB_PASS=postgres
      ELASTICSEARCH_URL=elasticsearch

      ACCOUNT_SID='YOUR SID TO TWILIO'
      AUTH_TOKEN='YOUR TOKEN TO TWILIO'
      TWILIO_FROM='YOUR NUMBER TWILIO'
      FROM_EMAIL='YOUR EMAIL TO SEND'
    ```
  - RUN `bundle install`
  - RUN `docker-compose build`

* Database creation
  - RUN `docker-compose run web rails db:create db:migrate`

* How to run the test suite
  - RUN `docker-compose run web rspec`

* Deployment instructions
  - Then steps above, should RUN `docker-compose up` or RUN `docker-compose up -d`
  - Then can you access localhost:3000 in your prefered browser.

* This app using Elasticsearch for searchs.

## Important
  To send SMS messages, you need to configure .env with all the Twilio data.




# PT-BR
* Ruby versão 3.2.2

* Configuração
   - Arquivo necessário .env no caminho raiz do projeto conforme abaixo.
      - Você pode encontrar uma cópia como `.example.env` no caminho raiz do projeto.
     ```ruby
       DB_USERNAME=postgres
       DB_PASS=postgres
       ELASTICSEARCH_URL=elasticsearch

       ACCOUNT_SID='SEU SID PARA TWILIO'
       AUTH_TOKEN='SEU TOKEN PARA TWILIO'
       TWILIO_FROM='SEU NÚMERO TWILIO'
       FROM_EMAIL='SEU E-MAIL PARA ENVIAR'
     ```
   - EXECUTAR `bundle install`
   - EXECUTAR `docker-compose build`

* Criação de banco de dados
   - EXECUTAR `docker-compose run web rails db:create db:migrate`

* Como executar o conjunto de testes
   - EXECUTAR `docker-compose run web rspec`

* Instruções de implantação
   - Em seguida, as etapas acima devem EXECUTAR `docker-compose up` ou EXECUTAR `docker-compose up -d`
   - Então você pode acessar localhost:3000 no seu navegador preferido.

* Este aplicativo usa Elasticsearch para pesquisas.

## Importante
   Para enviar mensagens SMS, você precisa configurar .env com todos os dados do Twilio.
