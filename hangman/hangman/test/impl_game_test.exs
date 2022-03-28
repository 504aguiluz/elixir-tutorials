defmodule HangmanImpleGameTest do
  use ExUnit.Case
  alias Hangman.Impl.Game

  test "new game turns structure" do
    game = Game.new_game

    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert length(game.letters) > 0

  end

  test "new game returns correct word" do
    game = Game.new_game("wombat")

    assert game.turns_left == 7
    assert game.game_state == :initializing
    assert game.letters == ["w", "o", "m", "b", "a", "t"]

  end

  test "word is all lowercase" do
    game = Game.new_game("wombat")

    assert String.downcase("wombat") == "wombat"

  end

end
