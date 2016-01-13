class Cylinder
  new: (@x,@y) =>
    self.sprite\setFilter 'nearest', 'nearest'

  sprite: love.graphics.newImage('images/cylinder.png')

class Round
  new: (@x,@y) =>
    self.sprite\setFilter 'nearest', 'nearest'

  sprite: love.graphics.newImage('images/round.png')

love.load = () ->
  export cylinder = Cylinder 10, 85
  export rounds = {
    Round 23, 88
    Round 15, 93
    Round 15, 103
    Round 23, 108
    Round 31, 103
    Round 31, 93
  }

love.draw = () ->
  love.graphics.scale 4, 4
  love.graphics.draw cylinder.sprite, cylinder.x, cylinder.y
  for i, v in ipairs rounds
    love.graphics.draw v.sprite, v.x, v.y

love.update = (dt) ->

love.keypressed = (key) ->
  if key == 'space'
    table.remove(rounds, 1)
