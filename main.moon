import State from require "state"
import Players from require "players"

class Cylinder
  new: (@x,@y) =>
    self.sprite\setFilter 'nearest', 'nearest'

  sprite: love.graphics.newImage 'images/cylinder.png'

class Round
  new: (@x,@y) =>
    self.sprite\setFilter 'nearest', 'nearest'

  sprite: love.graphics.newImage 'images/round.png'

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

    @loaded = math.random 6

love.load = () ->
  export state = State!
  export cylinder = Cylinder 10, 85
  export chambers = Chambers!
  export players = Players!

  export bangFont = love.graphics.newFont "fonts/PressStart2P-Regular.ttf", 10

love.draw = () ->
  love.graphics.scale 4, 4

  if state.finished
    bangFont\setFilter 'nearest', 'nearest'
    love.graphics.setFont bangFont
    love.graphics.print "BANG!", 100, 50

  love.graphics.draw activePlayer().sprite, activePlayer().x, activePlayer().y
  love.graphics.draw cylinder.sprite, cylinder.x, cylinder.y

  for i, v in ipairs chambers.rounds
    love.graphics.draw v.sprite, v.x, v.y

love.update = (dt) ->

love.keypressed = (key) ->
  if (not state.finished) and key == 'space'
    if chambers.loaded == #chambers.rounds
      state.finished = true
    else
      players.turn = (players.turn % 2) + 1

    table.remove chambers.rounds, 1

  elseif key == 'r'
    state.finished = false
    export chambers = Chambers!
    players.turn = math.random 2

export activePlayer = ->
  players.markers[players.turn]
