somata = require './'
flyd = require 'flyd'

client = new somata.Client

motion$ = client.on('maia:smartthings', 'motion')
gotMotion = (m) -> console.log '[m]', m
flyd.on gotMotion, motion$
