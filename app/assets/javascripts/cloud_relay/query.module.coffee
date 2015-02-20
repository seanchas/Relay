# PEG Rule
#
parser = PEG.buildParser '''

  start =
    endpoints


  endpoints =
    left:endpoint ',' right:endpoints {
      Object.keys(right).forEach(function(key){ left[key] = right[key] })
      return left
    } / endpoint


  endpoint =
    space? name:name condition:condition? space? children:children? space? {
      result          = {}
      result[name]    = {}

      if (condition) result[name].condition = condition

      if (children) result[name].children = children

      return result
    }


  children =
    '{' space? endpoints:endpoints? space? '}' {
      return endpoints
    }


  condition =
    ':' name:name {
      return name
    }


  name =
    first:[a-zA-Z_]+ rest:[a-zA-Z0-9_]* {
      return first.join('') + rest.join('')
    }


  space =
    [ \\n\\t\\r]+

'''


# Query
#
class Query


# Exports
#
module.exports = Query
