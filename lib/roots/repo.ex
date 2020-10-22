defmodule Roots.Repo do
  use Ecto.Repo,
    otp_app: :roots,
    adapter: Ecto.Adapters.Postgres
end
