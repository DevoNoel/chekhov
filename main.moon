love.load = () ->
  export cylinder = {
    sprite: love.graphics.newImage('images/cylinder.png')
    x:10
    y:85
  }

love.draw = () ->
  love.graphics.scale 4, 4
  cylinder.sprite\setFilter 'nearest', 'nearest'
  love.graphics.draw cylinder.sprite, cylinder.x, cylinder.y

love.update = (dt) ->

