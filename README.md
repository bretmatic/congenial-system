# Setup to Run

To run this app you will need to do the following:

* Run bundler
`bundle install`

* Create and migrate database
`rails db:create`
`rails db:migrate`

* Run server using Foreman
`foreman start -f Procfile.dev`


--

- Write new tweets
`http://localhost:5000/api/posts.json`
required params: message

- Reply to existing tweets
`http://localhost:5000/api/posts.json`
required params: message, response_to

