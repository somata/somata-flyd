somata = require './'
flyd = require 'flyd'
#filter = require 'flyd-filter'

client = new somata.Client

inc$ = client.on('random-events', 'inc')
hello$ = client.on('random-events', 'hello')

taglog = (t) -> (v) -> console.log "[#{t}]", v
double = (v) -> v * 2

inc$.map(double).map(taglog('v*2'))
inc$.map(taglog('v'))

combined$ = flyd.stream ([inc$, hello$]), ->
    hello: hello$()
    inc: inc$()

frank$ = flyd.stream [hello$], (self) ->
    if hello$() == 'Hi Frank' then self hello$.val
    return

combined$.map(taglog('combined'))
frank$.map(taglog('frank'))
