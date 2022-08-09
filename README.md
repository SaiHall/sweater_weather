# Sweater Weather

Sweater Weather is designed as a fictional back end to:

 - Take a location and return a json response of the forecasted weather
 - To create users
 - To log in users
 - Take two locations and return a response containing the estimated travel time, and projected weather at the location. (Requires an api key)

## Description

Sweater Weather is a back end for a fictional front end who has requested specific end points in the api. Sweater Weather maintains the database, stores users, and handles and reformats external api hits into a format that the front end has requested.

## Getting Started

### Dependencies
Gems used:
- In the development, test block please add:


  ``gem 'rspec-rails'
    gem 'simplecov'
    gem 'shoulda-matchers'``
    
    
- At the top level, please uncomment bcrypt and add:


  ``gem 'faraday'
    gem 'figaro'
    gem 'json'``
    
    
- In a test block, please add:


  ``gem 'vcr'
    gem 'webmock'``
    
After adding all the gems listed above please be sure to run:

``
$ bundle install
``
``
$ bundle exec rspec:install
``
``
$ bundle exec figaro install
``
``
$ rails generate rspec:install
``

You will also need to run:
``
$ rails db:{drop,create,migrate}
``

### Installing

In order to use or work on this repo, please clone down the repo from github and follow the gem install instructions above. 



### Executing program

 In order to make sample api hits on Postman please
 
 * Run ``rails s`` in your terminal.
 * Open Postman
 * Run one of the following
   - ``GET http://localhost:3000/api/v1/forecast?location=denver,co``
   - ``POST http://localhost:3000/api/v1/users``
   - ``POST http://localhost:3000/api/v1/sessions``
     + Please note that you'll need to send "email", "password", and "password_confirmation" in the body of the postman request as a raw json hash
   - ``POST http://localhost:3000/api/v1/road_trip``
     + Please note that you'll need to send "email", "password", and "password_confirmation" in the body of the postman request as a raw json hash


## Help

I highly recommend creating fixture files for some of the tests. The OpenWeather api is excluded from VCR in this repo due to some of the problems it was causing, and due to this some of my tests are run with fixture files. These will be available when cloning down the repo, but you can make your own should you wish.


## Authors

Sai Hall  
ex. [@SaiHall](https://www.linkedin.com/in/sai-hall-503710237/)
