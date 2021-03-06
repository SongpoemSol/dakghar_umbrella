defmodule Dakghar.Topics.Model.Topic do
  import Ecto.Query
  alias Dakghar.Repo
  alias Dakghar.Topics.Schema.Topic

  def list_all() do
    Repo.all(Topic)
  end

  def create(params) when is_map(params) do
    %Topic{}
    |> Topic.changeset(params)
    |> Repo.insert()
  end
end
