class Marker
  new: (@x,@y,@sprite)=>
    self.sprite\setFilter 'nearest', 'nearest'

class Players
  new: =>
    @markers = {
      Marker 5, 5, love.graphics.newImage('images/p1.png')
      Marker 30, 5, love.graphics.newImage('images/p2.png')
    }

    @turn = math.random(2)

{ :Players, :Marker }
