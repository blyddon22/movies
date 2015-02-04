`import Ember from 'ember';`
`import Ajax from '../mixins/ajax';`

IndexRoute = Ember.Route.extend(Ajax,
  model: ->
    Ember.RSVP.all([
      @_ajax
        type: 'GET'
        url: 'http://api.rottentomatoes.com/api/public/v1.0/lists/dvds/new_releases.json?apikey=&limit=20'
        dataType: 'jsonp'
        done: (data) ->
          data
        fail: (data) ->
          console.log "It does not do well to dwell on failure"
    ]).then (results) ->
      movies: results[0]['movies']
)

`export default IndexRoute;`
