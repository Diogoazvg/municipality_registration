# README

* Ruby version 3.2.2


* Configuration
  - Necessary file .env in root path of project with as below.
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
  On register of phone number should be DD+NUMBER the +55 for Brazil, It's already included and may cause an error if it doesn't follow this pattern due to Twilio invalidation, this has not been handled.
