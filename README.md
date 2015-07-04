# somata-flyd
Wrap Somata service events in a Flyd stream

## Usage

```coffee
somata = require 'somata-flyd'
flyd = require 'flyd'

client = new somata.Client
motion$ = client.on('maia:smartthings', 'motion')

gotMotion = (e) -> console.log '[motion event]', e
flyd.on gotMotion, motion$
```
