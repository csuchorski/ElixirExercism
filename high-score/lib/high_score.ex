defmodule HighScore do
  @default_points 0

  def new() do
    %{}
  end

  def add_player(scores, name, score \\ @default_points) do
    Map.put_new(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    Map.update(scores, name, 0, fn points -> @default_points end)
  end

  def update_score(scores, name, score) do
    Map.update(scores, name, score, fn points -> points + score end)
  end

  def get_players(scores) do
    Map.keys(scores)
  end
end
