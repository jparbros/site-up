SiteUp.GraphView = Ember.View.extend 
  attributeBindings: ['renderer', 'siteName','graph','data']
  renderer: 'line'
  data: {}
  siteName: 'Site'
  graph: {}

  dataDidChange: (->
    $(@$().get(0)).html('')
    graph = new Rickshaw.Graph
      element: this.$().get(0)
      renderer: @renderer
      series: [
        data: @data
        color: '#4682b4'
        name: @siteName
      ]
    
    
    graph.render()
    
    hoverDetail = new Rickshaw.Graph.HoverDetail
      graph: graph
      yFormatter: (y) -> 
        y + " ms"
        
    time = new Rickshaw.Fixtures.Time();

    xAxis = new Rickshaw.Graph.Axis.Time
      graph: graph,
      timeUnit: time.unit('hour')
    xAxis.render();
    
    yAxis = new Rickshaw.Graph.Axis.Y
        graph: graph
        timeUnit: time.unit('milisecond')
    yAxis.render();
  ).observes('data')
  
    
    