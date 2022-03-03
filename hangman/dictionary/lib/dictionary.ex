defmodule Dictionary do

  @word_list "assets/words.txt"
    |> File.read!()
    |> String.split(~r/\n/, trim: true)

  def random_word do
    @word_list
    |> Enum.random()
  end

  def swap({ a, b }) do
    { b, a }
  end

  def same({ a, a }) do
    true
  end

  def same({ a, b }) do
    false
  end

end
