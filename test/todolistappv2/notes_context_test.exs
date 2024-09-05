defmodule Todolistappv2.NotesContextTest do
  use Todolistappv2.DataCase

  alias Todolistappv2.NotesContext

  describe "notes" do
    alias Todolistappv2.Note

    import Todolistappv2.NotesContextFixtures

    @invalid_attrs %{note: nil}

    test "list_notes/0 returns all notes" do
      note = note_fixture()
      assert NotesContext.list_notes() == [note]
    end

    test "get_note!/1 returns the note with given id" do
      note = note_fixture()
      assert NotesContext.get_note!(note.id) == note
    end

    test "create_note/1 with valid data creates a note" do
      valid_attrs = %{note: "some note"}

      assert {:ok, %Note{} = note} = NotesContext.create_note(valid_attrs)
      assert note.note == "some note"
    end

    test "create_note/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = NotesContext.create_note(@invalid_attrs)
    end

    test "update_note/2 with valid data updates the note" do
      note = note_fixture()
      update_attrs = %{note: "some updated note"}

      assert {:ok, %Note{} = note} = NotesContext.update_note(note, update_attrs)
      assert note.note == "some updated note"
    end

    test "update_note/2 with invalid data returns error changeset" do
      note = note_fixture()
      assert {:error, %Ecto.Changeset{}} = NotesContext.update_note(note, @invalid_attrs)
      assert note == NotesContext.get_note!(note.id)
    end

    test "delete_note/1 deletes the note" do
      note = note_fixture()
      assert {:ok, %Note{}} = NotesContext.delete_note(note)
      assert_raise Ecto.NoResultsError, fn -> NotesContext.get_note!(note.id) end
    end

    test "change_note/1 returns a note changeset" do
      note = note_fixture()
      assert %Ecto.Changeset{} = NotesContext.change_note(note)
    end
  end
end
