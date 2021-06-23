const express = require('express')
const Store = require('../models/store')

const router = express.Router()

router.get('/', async(req, res, next) => {
  try {
    const storeProducts = await Store.listProducts()
    res.json({ products: storeProducts })
  } catch(err) {
    next(err)
  }
})

module.exports = router