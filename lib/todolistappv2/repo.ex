defmodule Todolistappv2.Repo do
  use Ecto.Repo,
    otp_app: :todolistappv2,
    adapter: Ecto.Adapters.Postgres
end
