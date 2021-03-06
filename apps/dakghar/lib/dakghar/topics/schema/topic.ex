defmodule Dakghar.Topics.Schema.Topic do
  use Dakghar.Schema

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "topics" do
    field(:topic_code, :string, null: false)
    field(:title, :string, null: false)
    field(:description, :string, null: false)
    field(:difficulty, :integer)

    timestamps(type: :utc_datetime)
  end

  @required_params ~w(topic_code title description difficulty)a
  @optional_params []
  @permitted_params @required_params ++ @optional_params

  def changeset(%__MODULE__{} = topic, params) do
    topic
    |> cast(params, @permitted_params)
    |> validate_required(@required_params)
    |> unique_constraint([:topic_code])
  end
end
