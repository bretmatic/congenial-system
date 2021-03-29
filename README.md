# Setup to Run

To run this app you will need to do the following:  

* Run bundler  
`bundle install`  

* Create and migrate database  
`rails db:create`  
`rails db:migrate`  

* Create test user 
`rails db:seed`  

* Run server using Foreman  
`foreman start -f Procfile.dev`  


--

*** REQUIRED ***
- Authentication: will return Bearer Token  
**POST** http://localhost:5000/api/users/login  
required params: username, password  

- Write new tweets  
**POST** `http://localhost:5000/api/posts.json`  
required params: message  

- Reply to existing tweets  
**POST** `http://localhost:5000/api/posts.json`  
required params: message, response_to  

- Query all tweets in system  
**GET**`http://localhost:5000/api/posts.json`  

- Query all tweets by publisher (currently does not accept group of publishers)  
**GET** `http://localhost:5000/api/users/:user_id/posts.json`  

- Query all tweets in a window of time  
**GET** `http://localhost:5000/api/users/:user_id/posts.json`  
required params: start_date, end_date  
expected param format: `2025-06-03 16:57:45.608000 -04:00`  

- Query tweet and all responses  
**GET** `http://localhost:5000/api/posts/:post_id/expanded.json`  
**TODO:** JSON response structure should be better.  Currently this is using two queries and then dropping data into response. Would be better to use a serializer 