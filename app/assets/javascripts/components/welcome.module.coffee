# @cjsx React.DOM


CloudRelay = require('cloud_relay')


# Exports
#
module.exports = CloudRelay.createClass

  displayName: 'Welcome'


  statics:
    queryParams:
      unicorns_count: 10

    queries:

      welcome: ->
        """
          Viewer {}
        """

      unicorns: ->
        """
          Unicorns {}
        """


  render: ->
    <div>
      Welcome from component!
    </div>
