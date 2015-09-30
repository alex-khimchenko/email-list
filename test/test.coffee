chai = require('chai')
should = chai.should()
Customer = require('../models/customer')

config = require('../config.coffee')
mongoose = require('mongoose')

mongoose.connect config.db

describe 'Customer Model', ->

  it 'should work', (done) ->
    done()


  it 'should create a new customer', (done) ->
    customer = new Customer(
      email: 'test@gmail.com'
      name: 'test'
      barber: 'sam'
    )
    customer.save (err) ->
      return done(err) if err
      done()

  it 'should not create a customer with not unique email', (done) ->
    customer = new Customer(
      email: 'test@gmail.com'
      password: 'password'
      barber: 'sam'
    )
    customer.save (err) ->
      err.code.should.equal 11000 if err
      done()

  it 'should find customer by email', (done) ->
    Customer.findOne { email: 'test@gmail.com' }, (err, customer) ->
      return done(err) if err
      customer.email.should.equal 'test@gmail.com'
      done()


  it 'should find customer by id', (done) ->
    Customer.findOne { email: 'test@gmail.com' }, (err, customer) ->
      id = customer._id
      Customer.findById id, (err, customer) ->
        return done(err) if err
        customer._id.toString().should.equal id.toString()
        done()

  it 'should list customers', (done) ->
    Customer.find {}, (err, customers) ->
        return done(err) if err
        customers.length.should.not.equal 0
        done()

  it 'should delete a customer', (done) ->
    Customer.remove { email: 'test@gmail.com' }, (err) ->
      return done(err) if err
      done()
