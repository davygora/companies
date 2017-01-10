== README

* Ruby version - 2.2.2
* Rails version - 4.2.5.2
* Database - Postgresql

#### How to run local:
```sh
  $ git clone 
  Update username & password in /config/database.yml
  $ rake db:setup
  $ rake db:migrate
  $ rails s
  Run tests:
  $ rspec spec
```

#### How to use Web-verison:
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
=> listing Companies
   url: http://localhost:3000/api/v1/companies
   method: GET
   body : not needed

=> Retrieving Company detail
  url: http://localhost:3000/api/v1/companies/:id
  method: GET
  body : not needed

=> Creating Company
   url: http://localhost:3000/api/v1/companies
   method: POST
   Body : It can be json

=> Updating Company
  url: http://localhost:3000/api/v1/companies/:id
  method: PUT
  Body : It can be json
  
=> Deleting Company
  url: http://localhost:3000/api/v1/companies/:id
  method: DELETE
  body : not needed
```

###### Employess
```sh
=> listing all employees of company
   url: http://localhost:3000/api/v1/companies/:company_id/employees
   method: GET
   body : not needed

=> Retrieving employee by id
  url: http://localhost:3000/api/v1/companies/:company_id/employees/:id
  method: GET
  body : not needed

=> Creating employee for company
   url: http://localhost:3000/api/v1/companies/:company_id/employees
   method: POST
   Body : It can be json

=> Updating employee of company
  url: http://localhost:3000/api/v1/companies/:company_id/employees/:id
  method: PUT
  Body : It can be json
  
=> Deleting employee of the company
  url: http://localhost:3000/api/v1/companies/:company_id/employees/:id
  method: DELETE
  body : not needed
```