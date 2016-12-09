# _Hair Salon_

#### _This application books salon appointments for clients. It allows users to add stylists and clients. Each client will only belong to one stylist (one-to-many)._

#### By _**Caitlin Ashtari**,  12/09/2016_

## Setup/Installation Requirements

### Database Setup Instructions

* _CREATE DATABASE hair_salon;_
* _CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;_
* _\c hair_salon;_
* _CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);_
* _CREATE TABLE clients (id serial PRIMARY KEY, name varchar, appointment_time timestamp, stylist_id int);_
* _DROP DATABASE hair_salon_test;_
* _CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;_

### How to install locally:
* _Clone the repository._
* _Find the directory in terminal._
* _Run the command "bundle install" to install the required gems._
* _Run the command "ruby app.rb" to host the app on sinatra._
* _Access localhost:4567 in your web browser, and the app should appear._

## Technologies Used

_Ruby, Sinatra, Bootstrap, Materialize, PSQL, CSS, HTML5_

### License

Copyright (c) 2016 **_Caitlin Ashtari_**

This code is licensed under the MIT license.
