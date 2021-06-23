const express = require('express')
const Order = require('../models/order')
const router = express.Router()

router.get('/', async (req, res, next) => {
  try {
    const orders = await Order.listOrdersForUser()
    res.json({ orders })
  } catch(err) {
    next(err)
  }
})

router.post('/', async(req, res, next)=> {
  try {
    const createOrder = await Order.createOrder()
    res.json({ createOrder })
  } catch(err) {
    next(err)
  }
})

module.exports = router