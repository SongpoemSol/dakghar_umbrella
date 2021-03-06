defmodule DakgharWeb.GraphQL.Schema.TopicSchema do
  @moduledoc """
  GraphQL Schema for Topic
  """
  use Absinthe.Schema.Notation
  alias DakgharWeb.GraphQL.Resolvers.TopicResolver
  alias DakgharWeb.GraphQL.Middleware.ChangesetErrors

  object :topic_queries do
    @desc "All the possible topics we know."
    field :list_topics, list_of(:topic_item) do
      resolve(&TopicResolver.list_topics/2)
    end
  end

  object :topic_mutations do
    @desc "add new topic"
    field :create_topic, :topic_item do
      arg(:input, non_null(:topic_input))
      resolve(&TopicResolver.create/2)
      middleware(ChangesetErrors)
    end
  end

  input_object :topic_input do
    field(:title, non_null(:string))
    field(:topic_code, non_null(:string))
    field(:description, non_null(:string))
    field(:difficulty, non_null(:integer))
  end

  object :topic_item do
    field(:title, :string)
    field(:topic_code, :string)
    field(:difficulty, :integer)
  end
end
