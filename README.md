# Sweater Weather

Sweater Weather is designed as a fictional back end to:

 - Take a location and return a json response of the forecasted weather
 - To create users
 - To log in users
 - Take two locations and return a response containing the estimated travel time, and projected weather at the location. (Requires an api key)

The learning goals for this project were to:

 - Expose an API that aggregates data from multiple external APIs
 - Expose an API that requires an authentication token
 - Expose an API for CRUD functionality
 - Determine completion criteria based on the needs of other developers
 - Test both API consumption and exposure, making use of at least one mocking tool (VCR and Webmock, in this case).

## Description

Sweater Weather is a back end for a fictional front end who has requested specific end points in the api. Sweater Weather maintains the database, stores users, and handles and reformats external api hits into a format that the front end has requested.

## Getting Started

### Dependencies

Rails version for this project: Rails 5.2.8.1
Ruby version for this project: Ruby 2.7.4

Gems used:
- In the development, test block please add/ensure thefollow gems are listed:


  ``gem 'rspec-rails'``
  
  ``gem 'simplecov'``
  
  ``gem 'shoulda-matchers'``
    
    
- At the top level, please uncomment bcrypt and add/ensure inclusion of:


  ``gem 'faraday'``
  
  ``gem 'figaro'``
  
  ``gem 'json'``
    
    
- In a test block, please add/ensure inclusion of:


  ``gem 'vcr'
    gem 'webmock'``
    
After adding all the gems listed above please be sure to run:

``
$ bundle install
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

Lastly, you will need api keys from [Mapquest](https://developer.mapquest.com/documentation/) and [OpenWeather](https://openweathermap.org/api)
In your config folder, an application.yml was created by installing figaro above. You will want to add your keys like so

``
GEO_API_KEY: 'your map quest goes here'
``


``
OW_API_KEY: 'your open weather key goes here'
``

### Installing

In order to use or work on this repo, please clone down the repo from github and follow the gem install instructions above. 



### Executing program

 In order to make happy path api hits on Postman please
 
 * Run ``rails s`` in your terminal.
 * Open Postman
 * Run one of the following
   - ``GET http://localhost:3000/api/v1/forecast?location=denver,co``
      + denver,co in this example can be replace with any location of a similar format. This will return a hash containing the current weather, the projected weather for the next eight hours, and the projected weather for the next five days.
   - ``POST http://localhost:3000/api/v1/users``
     + Please note that you'll need to send "email", "password", and "password_confirmation" in the body of the postman request as a raw json hash. If this sucessfully creates a user, it will return the users email and their new api_key. It will not return the password in any capacity.
   - ``POST http://localhost:3000/api/v1/sessions``
     + Please note that you'll need to send "email" and "password" in the body of the postman request as a raw json hash. This will also return the email and api key, as long as the user exists, and the password is correct.
   - ``POST http://localhost:3000/api/v1/road_trip``
     + Please note that you'll need to send an "origin" location and a "destination" in the body of the postman request as a raw json hash. This will return a hash containing travel time and projected weather upon arrival.


## Help

I highly recommend creating fixture files for some of the tests. The OpenWeather api is excluded from VCR in this repo due to some of the problems it was causing, and due to this some of my tests are run with fixture files. These will be available when cloning down the repo, but you can make your own should you wish.


## Authors

Sai Hall  
[SaiHall](https://www.linkedin.com/in/sai-hall-503710237/)
