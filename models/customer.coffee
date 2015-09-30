mongoose = require('mongoose')
customerSchema = new (mongoose.Schema)(
  email:
    type: String
    unique: true
    lowercase: true
  name:
    type: String
  barber:
    type: String
)
module.exports = mongoose.model('Customer', customerSchema)