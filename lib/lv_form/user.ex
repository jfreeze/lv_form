defmodule LvForm.User do
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :name, :string
    field :password, :string, virtual: true
    field :password_hash, :string
    field :tos_agreement, :boolean
    # field :validated_on, :utc_datetime
    # field :validation_method, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs \\ %{}) do
    user
    |> cast(attrs, [:email, :name, :password, :tos_agreement])
    |> validate_required([:email, :name, :password, :tos_agreement])
    |> validate_length(:name, min: 3, max: 128)
    |> validate_length(:email, min: 6, max: 128)
    |> validate_length(:password, min: 3, max: 128)
    |> validate_acceptance(:tos_agreement)
    |> unique_constraint(:email)
    # |> validate_required([:password_hash])
    end


end

