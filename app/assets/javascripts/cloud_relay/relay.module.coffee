# Mixin
#
mixin =


  getQuery: (name) ->
    unless @constructor.queries[name]
      throw new Error("CloudRelay::getQuery: query '#{name}' not found for '#{@constructor.displayName}'")

    @constructor.queries[name]()


  setQueryParams: (nextQueryParams) ->
    @queryParams = Immutable.Map(@queryParams).mergeDeep(nextQueryParams).toJS()


  componentWillMount: ->
    @render__withoutCloudRelayMixin = @render
    @render = @render__withCloudRelayMixin

    @queryParams = @constructor.queryParams


  componentWillUnmount: ->


  render__withCloudRelayMixin: ->
    @render__withoutCloudRelayMixin()


# Exports
#
module.exports =
  createClass: (descriptor) ->

    if descriptor.statics and descriptor.statics.queries
      Immutable.Seq(descriptor.statics.queries).forEach (query, name) ->
        descriptor.statics.queries[name] = query

    (descriptor.mixins ||= []).push(mixin)
    React.createClass(descriptor)
