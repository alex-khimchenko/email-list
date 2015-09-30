Customer = require('../models/customer');

validateEmail = (email) ->
  re = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
  return re.test email

exports.createCustomer = (req, res) ->
  customer = new Customer(
    email: req.body.email
    name: req.body.password
    barber: req.body.barber
  )
  return res.status(403).send({message: 'Wrong email value!'}) unless validateEmail req.body.email
  Customer.findOne { email: req.body.email }, (err, existingCustomer) ->
    return res.status(403).send({message: 'Customer with that email address already exists.'}) if existingCustomer
    customer.save (err) ->
      return res.status(500).send(err) if err
      res.status(200).send('OK')

exports.getCustomer = (req, res) ->
  Customer.findById req.query.id, (err, customer) ->
    return res.status(404).send({message: 'Customer with that id not found.'}) unless customer
    return res.status(500).send(err) if err
    res.status(200).send customer

exports.getCustomers = (req, res) ->
  Customer.find {}, (err, customers) ->
    return res.status(500).send(err) if err
    res.status(200).send customers


exports.updateCustomer = (req, res) ->
  Customer.findById req.body.id, (err, customer) ->
    console.log customer

    return res.status(404).send({message: "customer with that id not found!"}) unless customer
    return res.status(500).send(err) if err
    return res.status(403).send({message: 'Wrong email value!'}) if req.body.email and !validateEmail req.body.email

    customer.email = req.body.email if req.body.email
    customer.name = req.body.name if req.body.name
    customer.barber = req.body.barber if req.body.barber
    customer.save (err) ->
      return res.status(500).send(err) if err
      res.status(200).send('OK')

exports.removeCustomer = (req, res) ->
  Customer.remove { _id: req.body.id }, (err) ->
    return res.status(500).send(err) if err
    res.status(200).send('OK')
