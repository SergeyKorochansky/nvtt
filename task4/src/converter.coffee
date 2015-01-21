"use strict"

words = [
  ['', 'один', 'два', 'три', 'четыре', 'пять', 'шесть', 'семь', 'восемь', 'девять', 'десять', 'одиннадцать', 'двенадцать', 'тринадцать', 'четырнадцать', 'пятнадцать', 'шестнадцать', 'семнадцать', 'восемнадцать', 'девятнадцать']
  ['', '', 'двадцать', 'тридцать', 'сорок', 'пятьдесят', 'шестьдесят', 'семьдесят', 'восемьдесят', 'девяносто']
  ['', 'сто', 'двести', 'триста', 'четыреста', 'пятьсот', 'шестьсот', 'семьсот', 'восемьсот', 'девятьсот']
]

plural = (count, options) ->
  return false if options.length isnt 3

  count = Math.abs(count) % 100
  rest  = count % 10

  return options[2] if count > 10 and count < 20
  return options[1] if rest > 1 and rest < 5
  return options[0] if rest is 1

  options[2]

parseNumber = (number, count) ->
  numeral = ''

  if number.length is 3
    first  = number.substr 0, 1
    number = number.substr 1, 3

    numeral = "#{words[2][first]} "

  if number < 20
    numeral += "#{words[0][parseInt(number, 10)]} "
  else
    first  = number.substr 0, 1
    second = number.substr 1, 2

    numeral += "#{words[1][first]} #{words[0][second]} "

  if count is 1
    if numeral isnt '  '
      numeral += plural number, ['тысяча ', 'тысячи ', 'тысяч ']

      numeral = numeral.replace('один ', 'одна ')
      .replace('два ', 'две ')

  numeral

convertNumber = (number) ->
  return false if not number or typeof number not in ['number', 'string']

  integer = parseInt number, 10
  if typeof number is 'string'
    number = integer
    return false if isNaN integer

  return false if integer <= 0

  number = number.toString()

  numeral = ''
  length = number.length - 1
  parts = ''
  count = 0

  while length >= 0
    digit = number.substr length, 1
    parts = digit + parts

    if (parts.length is 3 or length is 0) and not isNaN parseInt(parts, 10)
      numeral = parseNumber(parts, count) + numeral

      parts = ''
      count++

    length--

  numeral = numeral.replace /\s+/g, ' '
  numeral.trim()

global = if module? then exports else window
global.convertNumber = convertNumber