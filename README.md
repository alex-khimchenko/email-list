# email-list
Test application for barbershop to store and modify customers list

##Installation
* clone this repo `git clone git@github.com:alex-khimchenko/email-list.git`
* install node packages `npm install`

##Running application and tests
* launch server `node server.js`
* run tests `mocha --compilers coffee:coffee-script/register`

## Methods
### GET: `/customer`
* in: `id`
* out: customer fields "_id", "email", "name", "barber" or error object
get customer by id

### GET: `/customers`
* in: -
* out: array of customers with fields "_id", "email", "name", "barber" or error object
get all customers


### POST: `/createCustomer`
* in: customer fields "email", "name", "barber"
* out: "OK" or error object
create new customer field

### POST: `/updateCustomer`
* in: customer fields "id", "email", "name", "barber"
* out: "OK" or error object
update customer details

### GET: `/removeCustomer`
* in: `id`
* out: "OK" or error object
remove customer from list
