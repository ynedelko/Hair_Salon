# _Hair Salon_

##### This is an app for hair salon owners.

#### By _**Yelena Nedelko**_

## Description

_Users can:_

* _View, add, update and delete stylists._
* _View, add, update and delete clients._
* _Add clients to a stylist._

## Technology Used
* _Ruby_
* _Sinatra_
* _RSpec_
* _Capybara_
* _Postgres_

## Database Setup/ Installation

_IN PSQL:_<br>
_CREATE DATABASE hair_salon;_<br>
_\c hair_salon;_<br>
_CREATE TABLE stylists (id serial PRIMARY KEY, name varchar);_<br>
_CREATE TABLE clients (id serial PRIMARY KEY, name varchar, stylist_id int);_<br>
_CREATE DATABASE hair_salon_test WITH TEMPLATE hair_salon;_<br>

_Webserver testing:_
* _Install required gems_
* _$ bundle install_
* _$ ruby app.rb_
* _Navigate to localhost:4567_

### Legal

Copyright (c) 2015 **_Yelena Nedelko_**

This software is licensed under the MIT license.

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in
all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
THE SOFTWARE.
