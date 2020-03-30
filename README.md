# Essentials.io
This repo contains the codebase for Essentails.io app. 
This app provides a simple way to connect consumers &amp; service providers.

# For Frontend Flutter App
Open Android Studio:

* Check out project from Version Control using git repository url.
* Close prompt and Open an existing Android Studio Project by navigating to essential.io-flutter.

# For Backend Ruby API

Things you need want to cover:

* Ruby version: 2.6.3
* Rails version: Rails 5
* Postgresql

* Configuration
Navigate in to the essentails.io-api directory
````
cd essentails.io-api
````
Run
````
bundle install
````

* Database creation : 
Run
````
rake db:create 
rake db:migrate 
````
OR
````
rails db:create
rails db:migrate
````

* Deployment instructions
Run
````
rails s
````
On browser, if you visit localhost:3000 you should see a rails success banner.

Developers: Pranav waikar, Sameer mongule, Kajal mohite
