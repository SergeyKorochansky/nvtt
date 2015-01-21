construct = (convertNumber) ->
  text = convertNumber()
  text.should.be.false

  text = convertNumber undefined
  text.should.be.false

  text = convertNumber false
  text.should.be.false

  text = convertNumber 0
  text.should.be.false

  text = convertNumber "0"
  text.should.be.false

  text = convertNumber "0.00"
  text.should.be.false

  text = convertNumber "0,00"
  text.should.be.false

  text = convertNumber "test"
  text.should.be.false

  text = convertNumber []
  text.should.be.false

  text = convertNumber [10]
  text.should.be.false

  text = convertNumber {}
  text.should.be.false

  text = convertNumber test: 10
  text.should.be.false

numbers = (convertNumber) ->
  text = convertNumber 12
  text.should.equal 'двенадцать'

  text = convertNumber 52
  text.should.equal 'пятьдесят два'

  text = convertNumber 100
  text.should.equal 'сто'

  text = convertNumber 112
  text.should.equal 'сто двенадцать'

  text = convertNumber 152
  text.should.equal 'сто пятьдесят два'

  text = convertNumber 512
  text.should.equal 'пятьсот двенадцать'

  text = convertNumber 552
  text.should.equal 'пятьсот пятьдесят два'

  text = convertNumber 999
  text.should.equal 'девятьсот девяносто девять'

thousands = (convertNumber) ->
  text = convertNumber 1000
  text.should.equal 'одна тысяча'

  text = convertNumber 2000
  text.should.equal 'две тысячи'

  text = convertNumber 5000
  text.should.equal 'пять тысяч'

  text = convertNumber 1052
  text.should.equal 'одна тысяча пятьдесят два'

  text = convertNumber 52151
  text.should.equal 'пятьдесят две тысячи сто пятьдесят один'

  text = convertNumber 341000
  text.should.equal 'триста сорок одна тысяча'

  text = convertNumber 123456
  text.should.equal 'сто двадцать три тысячи четыреста пятьдесят шесть'

  text = convertNumber 999001
  text.should.equal 'девятьсот девяносто девять тысяч один'

negative = (convertNumber) ->
  text = convertNumber -100
  text.should.be.false

  text = convertNumber -0.01
  text.should.be.false

  text = convertNumber "-100"
  text.should.be.false

  text = convertNumber "-0.01"
  text.should.be.false

describe 'convertNumber in CoffeeScript', ->

  {convertNumber} = require '../src/converter.coffee'

  it 'construct', -> construct convertNumber

  it 'numbers', -> numbers convertNumber
  it 'thousands', -> thousands convertNumber

  it 'negative', -> negative convertNumber

describe 'convertNumber in JavaScript', ->

  path = if process.env.COVERAGE then '../lib-cov' else '../lib'
  {convertNumber} = require "#{path}/converter.js"

  it 'construct', -> construct convertNumber

  it 'numbers', -> numbers convertNumber
  it 'thousands', -> thousands convertNumber

  it 'negative', -> negative convertNumber

describe 'convertNumber in minify JavaScript', ->

  {convertNumber} = require '../lib/converter.min.js'

  it 'construct', -> construct convertNumber

  it 'numbers', -> numbers convertNumber
  it 'thousands', -> thousands convertNumber

  it 'negative', -> negative convertNumber