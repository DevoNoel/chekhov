class Cylinder
  new: (@x,@y) =>
    self.sprite\setFilter 'nearest', 'nearest'

  sprite: love.graphics.newImage('images/cylinder.png')

class Round
  new: (@x,@y) =>
    self.sprite\setFilter 'nearest', 'nearest'

  sprite: love.graphics.newImage('images/round.png')

class Chambers
  new: =>
    @rounds = {
      Round 23, 88
      Round 15, 93
      Round 15, 103
      Round 23, 108
      Round 31, 103
      Round 31, 93
    }

    @loaded = love.math.random(6)

class PlayerMarker
  new: (@x,@y,@sprite)=>
    self.sprite\setFilter 'nearest', 'nearest'

love.load = () ->
  export cylinder = Cylinder 10, 85
  export chambers = Chambers!

  export player1 = PlayerMarker 5, 5, love.graphics.newImage('images/p1.png')
  export player2 = PlayerMarker 30, 5, love.graphics.newImage('images/p2.png')

love.draw = () ->
  love.graphics.scale 4, 4
  love.graphics.draw player1.sprite, player1.x, player1.y
  love.graphics.draw player2.sprite, player2.x, player2.y
  love.graphics.draw cylinder.sprite, cylinder.x, cylinder.y
  for i, v in ipairs chambers.rounds
    love.graphics.draw v.sprite, v.x, v.y

love.update = (dt) ->

love.keypressed = (key) ->
  if key == 'space'
    if chambers.loaded == #chambers.rounds
      print 'BOOM'
    table.remove(chambers.rounds, 1)

  elseif key == 'r'
    export chambers = Chambers!

