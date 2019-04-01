defmodule LvFormWeb.LiveView.RegistrationLive.New do
  use Phoenix.LiveView
  alias LvFormWeb.RegistrationView

  def render(assigns) do
    RegistrationView.render("new.html", assigns)
  end

  def mount(_session, socket) do
    { :ok,
      assign(socket, %{
        error_message: "",
        name: "",
        email: "",
        password: "",
        tos_agreement: "false",
        disabled: true,
        changeset: LvForm.User.changeset(%LvForm.User{})
      })
    }
  end


  def handle_event("validate", %{"user" => params}, socket) do
    IO.inspect params

    changeset =
    %LvForm.User{}
    |> LvForm.User.changeset(params)
    |> Map.put(:action, :insert)  # comment out this line

    tos_agreement = Map.get(params, "tos_agreement")
    {
      :noreply, assign(socket,
        changeset: changeset,
        name: Map.get(params, "name"),
        email: Map.get(params, "email"),
        password: Map.get(params, "password"),
        tos_agreement: tos_agreement,
        error_message: "",
        disabled: false
      )
    }
  end

  def handle_event("register", %{"user" => registration_params}, socket) do
      {:stop,
        socket
        |> put_flash(:info, "User Registered")
        |> redirect(to: "/")}
  end

end
