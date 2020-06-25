# Description

This is an platform for sellers and buyers to sell and buy products online.

# Setup
  You need to install the folloing versions of softwares
  * Ruby - 2.7.0
  * Mysql - 8.0.2
  After this you need to follow the below commands in the terminal to setup the application

  ```
  * Switch into the project directory
  $ bundle install
  * Check into database.yml file and change your mysql password accordinly and then run
  $ rake db:create
  $ rake db:migrate
  * To test run the following command from project directory 
  $ rails test
  * Now your application is ready run
  $ rails s
  open your browser and type localhost:3000
  ```

* You can sign up into the application via
  click on sign in -> sign up

  if you logged in as and seller you will se store link into the dropdown menu, from there you can create products.
