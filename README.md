== README

* Ruby version - 2.2.2
* Rails version - 4.2.5.2
* Database - Postgresql

#### Heroku:

##### Admin:
  https://glacial-castle-74419.herokuapp.com/admin

##### Documentation:
  https://glacial-castle-74419.herokuapp.com/apipie

##### ACCESS_TOKEN
  You can create here:

  https://glacial-castle-74419.herokuapp.com/admin/api_key
=>  or use it "...?access_token=4c3c2902dff96b872084c55dd3bfcc34"

  For example list of all companies:

  https://glacial-castle-74419.herokuapp.com/api/v1/companies?access_token=4c3c2902dff96b872084c55dd3bfcc34

#### How to run local:
```sh
  $ git clone git@github.com:davygora/companies.git
  Update username & password in /config/database.yml
  $ rake db:setup
  $ rake db:migrate
  $ rails s

  Run tests:
  $ rspec spec
```

#### How to use local Web-verison:
```sh
  http://localhost:3000/admin
```
#### How to use API:

##### Basic Authentication:
  use access_token

##### Content Type :
   application/json

##### Body:
   You can pass json data in Body
   
   sample json body:

  {"company":
    {
      "name":"Name",
      "location":"Ukraine",
      "employees":[]
    }
  }

##### API Requests:

###### Companies:
```sh
=> Listing Companies
   url: /api/v1/companies
   method: GET
   body : not needed

=> Retrieving Company detail
  url: /api/v1/companies/:id
  method: GET
  body : not needed

=> Creating Company
   url: /api/v1/companies
   method: POST
   Body : It can be json

=> Updating Company
  url: /api/v1/companies/:id
  method: PUT
  Body : It can be json
  
=> Deleting Company
  url: /api/v1/companies/:id
  method: DELETE
  body : not needed
```

###### Employess
```sh
=> Listing all employees of company
   url: /api/v1/companies/:company_id/employees
   method: GET
   body : not needed

=> Retrieving employee by id
  url: /api/v1/companies/:company_id/employees/:id
  method: GET
  body : not needed

=> Creating employee for company
   url: /api/v1/companies/:company_id/employees
   method: POST
   Body : It can be json

=> Updating employee of company
  url: /api/v1/companies/:company_id/employees/:id
  method: PUT
  Body : It can be json
  
=> Deleting employee of the company
  url: /api/v1/companies/:company_id/employees/:id
  method: DELETE
  body : not needed
```