window.Graph =
  data: {}
  init: (selector) ->
    @selector = selector

    
  render: ->
    graph = new Rickshaw.Graph
      element: document.querySelector(@selector)
      width: 235
      height: 85
      renderer: 'line'
      series: [ {
        data: [ { x: 0, y: 40 }, { x: 1, y: 49 }, { x: 2, y: 38 }, { x: 3, y: 30 }, { x: 4, y: 32 } ],
        color: '#4682b4'
      } ]
    graph.render
    