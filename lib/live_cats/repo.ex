defmodule LiveCats.Repo do
  use Ecto.Repo,
    otp_app: :live_cats,
    adapter: Ecto.Adapters.Postgres
end
