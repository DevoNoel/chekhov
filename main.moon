love.load = () ->
  export cylinder = {
    sprite: love.graphics.newImage('images/cylinder.png')
    x: 0
    y: 0
  }

love.draw = () ->
  love.graphics.scale 5, 5
  love.graphics.draw cylinder.sprite, cylinder.x, cylinder.y

love.update = (dt) ->

