defmodule Availabit.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Availabit.Events.Event

  schema "users" do
    field :avatar, :string
    field :email, :string
    field :name, :string
    has_many :events, Event

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email, :avatar])
    |> validate_required([:name, :email, :avatar])
    |> unique_constraint(:email)
  end
end
