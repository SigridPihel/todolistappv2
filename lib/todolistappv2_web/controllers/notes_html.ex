defmodule Todolistappv2Web.NotesHTML do
  use Todolistappv2Web, :html

  embed_templates "notes_html/*"

  @doc """
  Renders a note form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def notes_form(assigns)
end
