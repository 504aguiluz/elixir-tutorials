defmodule Hangman.Impl.Game do

  # because defstruct creates a structure with the same name as module, we access the type of this module by using the "t" convention as Hangman.Impl.Game.t or in our API case, Game.t
  # here we're using typespecs to specify the acceptable types for our structure
  @type t :: %Hangman.Impl.Game{
    turns_left: integer,
    game_state: Hangman.state,
    letters: list(String.t),
    used: MapSet.t(Strings.t),
  }

  # defstruct creates a structure that is the same name as the title. in this case -> Hangman.Impl.Game
  defstruct(
    turns_left: 7,
    game_state: :initializing,
    letters: [],
    used: MapSet.new()
  )

  def new_game do
    %Hangman.Impl.Game{
      letters: Dictionary.random_word
      |> String.codepoints()
    }
  end


end
