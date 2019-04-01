defmodule LvForm.Repo do
  use Ecto.Repo,
    otp_app: :lv_form,
    adapter: Ecto.Adapters.Postgres
end
