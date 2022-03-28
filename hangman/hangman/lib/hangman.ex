defmodule Hangman do
  # Hangman API

  # we can actually delete ", as:Game " and the alias will default to the string following the last period. so it would still alias to "Game"
  alias Hangman.Impl.Game, as: Game
  @type   state :: :initializing | :won | :list | :good_guess | :bad_guess | :already_used
  @opaque game :: Game.t
  @type   tally :: %{
    turns_left: integer,
    game_state: state,
    letters: list(String.t),
    used: list(String.t),
  }

  @spec new_game() :: game
  # delegates fn call to a different module -> new_game() in game.ex
  defdelegate new_game, to: Game

  @spec make_move(game, String.t) :: { game, tally }
  def make_move(_game, _guess) do
  end

end
