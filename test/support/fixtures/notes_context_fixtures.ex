defmodule Todolistappv2.NotesContextFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Todolistappv2.NotesContext` context.
  """

  @doc """
  Generate a note.
  """
  def note_fixture(attrs \\ %{}) do
    {:ok, note} =
      attrs
      |> Enum.into(%{
        note: "some note"
      })
      |> Todolistappv2.NotesContext.create_note()

    note
  end
end
