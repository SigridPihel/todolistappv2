defmodule Todolistappv2.NoteTest do
  use Todolistappv2.DataCase, async: true
  alias Todolistappv2.Note

  test "note must be at least two characters long" do
    changeset = Note.changeset(%Note{}, %{note: "I"})
    assert %{note: ["should be at least 3 character(s)"]} = errors_on(changeset)
  end

  test "note must be at most fourty characters long" do
    changeset =
      Note.changeset(%Note{}, %{note: "more than 40 characters long note and it is too long"})

    assert %{note: ["should be at most 40 character(s)"]} = errors_on(changeset)
  end
end
