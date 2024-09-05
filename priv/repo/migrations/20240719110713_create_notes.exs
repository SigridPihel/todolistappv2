defmodule Todolistappv2.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :note, :string

      timestamps(type: :utc_datetime)
    end
  end
end
