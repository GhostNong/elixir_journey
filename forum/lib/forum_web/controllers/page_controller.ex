# EEx template engine used for rendering HTML [Elixir]
# EEx Docs: https://hexdocs.pm/eex/1.12.3/EEx.html

defmodule ForumWeb.PageController do
  use ForumWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def users(conn, _params) do
    # The users page is often custom made,
    # so skip the default app layout.
    users = [
      %{id: 1, name: "Alice", email: "alice@gmail.com"},
      %{id: 2, name: "John", email: "john@gmail.com"},
      %{id: 3, name: "Alex", email: "alex@gmail.com"}
    ]


    json(conn, %{users: users})
    # render(conn, :users, users: users ,layout: false)
  end
end
