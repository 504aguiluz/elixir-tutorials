defmodule Hangman.Impl.Game do

  alias Hangman.Type

  # because defstruct creates a structure with the same name as module, we access the type of this module by using the "t" convention as Hangman.Impl.Game.t or in our API case, Game.t
  # here we're using typespecs to specify the acceptable types for our structure
  @type t :: %__MODULE__{
    turns_left: integer,
    game_state: Type.state,
    letters:    list(String.t),
    used:       MapSet.t(Strings.t),
  }

  # defstruct creates a structure that is the same name as the title. in this case -> Hangman.Impl.Game
  defstruct(
    turns_left: 7,
    game_state: :initializing,
    letters:    [],
    used:       MapSet.new()
  )

  #######################################################
  @spec new_game() :: t
  def new_game do
    new_game(Dictionary.random_word)
  end

  @spec new_game(String.t) :: t
  def new_game(word) do
    %__MODULE__{
      letters: word
      |> String.codepoints()
    }
  end
  #######################################################

  @spec make_move(t, String.t) :: { t, Type.tally }
  def make_move(game = %{ game_state: state }, _guess)
  when state in [:won, :lost] do
    game
    |> return_with_tally()
  end

  def make_move(game, guess) do
    accept_guess(game, guess, MapSet.member?(game.used, guess))
    |> return_with_tally()
  end

  #######################################################

  defp accept_guess(game, _guess, _already_used = true) do
    %{ game | game_state: :already_used }
  end

  defp accept_guess(game, guess, _already_used ) do
    %{ game | used: MapSet.put(game.used, guess) }
  end

  #######################################################
  # defp makes a fn private
  defp tally(game) do
    %{
      turns_left: game.turns_left,
      game_state: game.game_state,
      letters:    [],
      used:       game.used |> MapSet.to_list |> Enum.sort,
    }
  end

  defp return_with_tally(game) do
    {game, tally(game) }
  end

end
