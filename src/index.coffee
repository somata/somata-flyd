somata = require 'somata'
flyd = require 'flyd'

class Client extends somata.Client
    subscribe: (service_name, type, args...) ->
        s$ = flyd.stream()
        super service_name, type, args..., (err, event) -> s$ event
        return s$

module.exports = {Client}
