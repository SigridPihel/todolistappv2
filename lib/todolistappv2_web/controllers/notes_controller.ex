defmodule Todolistappv2Web.NotesController do
  use Todolistappv2Web, :controller

  alias Todolistappv2.NotesContext
  alias Todolistappv2.Note

  def index(conn, _params) do
    notes = NotesContext.list_notes()
    render(conn, :index, notes: notes)
  end

  def new(conn, _params) do
    changeset = NotesContext.change_note(%Note{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"note" => note_params}) do
    case NotesContext.create_note(note_params) do
      {:ok, note} ->
        conn
        |> put_flash(:info, "Note created successfully.")
        |> redirect(to: ~p"/notes/#{note}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    note = NotesContext.get_note!(id)
    render(conn, :show, note: note)
  end

  def edit(conn, %{"id" => id}) do
    note = NotesContext.get_note!(id)
    changeset = NotesContext.change_note(note)
    render(conn, :edit, note: note, changeset: changeset)
  end

  def update(conn, %{"id" => id, "note" => note_params}) do
    note = NotesContext.get_note!(id)

    case NotesContext.update_note(note, note_params) do
      {:ok, note} ->
        conn
        |> put_flash(:info, "Note updated successfully.")
        |> redirect(to: ~p"/notes/#{note}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, note: note, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    note = NotesContext.get_note!(id)
    {:ok, _note} = NotesContext.delete_note(note)

    conn
    |> put_flash(:info, "Note deleted successfully.")
    |> redirect(to: ~p"/notes")
  end
end
