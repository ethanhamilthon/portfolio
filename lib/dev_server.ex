defmodule Portfolio.DevServer do
  use Plug.Router
  alias Portfolio.Views.Projects
  alias Portfolio.Templating
  alias Portfolio.Views.Icons
  alias Portfolio.Views.Blog

  plug(Plug.Logger)

  plug(Plug.Static,
    at: "/",
    from: "priv/static",
    only: ~w(css js images favicon.ico)
  )

  plug(:match)
  plug(:dispatch)

  get "/" do
    page(conn, "index.html", "Home",
      eye: Icons.emoji(%{class: "text-3xl", emoji: "👀"}) |> Enum.join(""),
      right_arrow: Icons.right_arrow(%{class: "text-white"}) |> Enum.join(""),
      email_icon: Icons.email(%{class: "text-white"}) |> Enum.join(""),
      telegram: Icons.telegram(%{class: "text-white"}) |> Enum.join(""),
      blogs: Blog.list() |> Enum.join(""),
      active_projects: Projects.active_projects() |> Enum.join("")
    )
  end

  get "/now" do
    page(conn, "now.html", "Now")
  end

  get "/projects" do
    page(conn, "projects.html", "Projects",
      data: Portfolio.Data.projects(),
      projects: Projects.list() |> Enum.join("")
    )
  end

  get "/articles" do
    page(conn, "articles.html", "Articles", data: Portfolio.Data.articles())
  end

  get "/articles/learn-rust" do
    page(conn, "articles/learn-rust.html", "How I Learned Rust in Two Hours",
      content: Portfolio.Data.read_article(:rust)
    )
  end

  match _ do
    send_resp(conn, 404, "Not found path")
  end

  def render_page(name, title, assign \\ []) do
    name
    |> H.page_path()
    |> Templating.eval(assign)
    |> Templating.with_layout(page_title: title)
  end

  def page(conn, name, title, assign \\ []) do
    conn
    |> put_resp_content_type("text/html")
    |> send_resp(
      200,
      render_page(name, title, assign)
    )
  end
end
