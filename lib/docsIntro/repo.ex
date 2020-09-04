defmodule DocsIntro.Repo do
  use Ecto.Repo,
    otp_app: :docsIntro,
    adapter: Ecto.Adapters.Postgres
end
