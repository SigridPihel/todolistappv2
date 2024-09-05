defmodule Todolistappv2.Note do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notes" do
    field :note, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(note, attrs) do
    note
    |> cast(attrs, [:note])
    |> validate_required([:note])
    |> validate_length(:note, min: 3)
    |> validate_length(:note, max: 40)
  end
end
