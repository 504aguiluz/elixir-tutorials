defmodule Hangman do
  # Hangman API

  # we can actually delete ", as:Game " and the alias will default to the string following the last period. so it would still alias to "Game"
  alias Hangman.Impl.Game, as: Game
  alias Hangman.Type

  @opaque game :: Game.t

  @spec new_game() :: game
  # delegates fn call to a different module -> new_game() in game.ex
  defdelegate new_game, to: Game

  @spec make_move(game, String.t) :: { game, Type.tally }
  defdelegate make_move(game, guess), to: Game

end
