class Cylinder
  new: (@x,@y) =>
  sprite: love.graphics.newImage('images/cylinder.png')

love.load = () ->
  export cylinder = Cylinder 10, 85

love.draw = () ->
  love.graphics.scale 4, 4
  cylinder.sprite\setFilter 'nearest', 'nearest'
  love.graphics.draw cylinder.sprite, cylinder.x, cylinder.y

love.update = (dt) ->

