Template.registerHelper 'Config', ->
	Config

Template.registerHelper 'Schemas', ->
	Schemas

Template.registerHelper 'Utils', ->
  Utils

Template.registerHelper 'socialMedia', ->
  _.map Config.socialMedia, (obj)->
    obj

Template.registerHelper 'currentRoute', ->
  if Router and Router.current and Router.current()
    Router.current()

Template.registerHelper 'isRouteReady', ->
  Router and Router.current and Router.current()