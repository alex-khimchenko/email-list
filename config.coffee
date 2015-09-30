module.exports =
  db: process.env.MONGODB or process.env.MONGOLAB_URI or 'mongodb://localhost:27017/email-list'