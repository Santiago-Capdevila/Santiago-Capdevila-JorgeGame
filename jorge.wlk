object juego {
  method iniciar() {
    game.addVisual(boca)
    game.addVisualCharacter(jorge)
    game.schedule(5000, {jorge.position(game.origin())})
    game.onTick(1000, "moverse", {jorge.position(jorge.position().down(2))})
    // keyboard.space().onPressDo({boca.gana()})
    keyboard.enter().onPressDo({jorge.saludar()})
    game.onCollideDo(jorge, {quien => boca.gana()})
  }
}

object jorge {
  var alegria = 10
  var lugar = game.at(0, 6)

  method festejar() {
    alegria = alegria + 1
  }

  method saludar() {
    game.say(self, "Tengo " + alegria + " de alegría")
  }

  method alegria() {
    return alegria
  }

  method position() {
    return lugar
  }

  method image() = if (alegria >= 15) "mario.jpg" else "jorge.jpg"

  method position(nueva) {
    boca.gana()
    lugar = nueva
  }
}

object boca {
  method gana() {
    jorge.festejar()
  }

  method position() {
    game.center()
  }

  method image() {
    return "boca.jpg"
  }
}
