defmodule H do
  def priv_path do
    "./priv"
  end

  def template_path(name) do
    Path.join(priv_path(), "templates")
    |> Path.join(name)
  end

  def component_path(name) do
    Path.join(priv_path(), "templates/component")
    |> Path.join(name)
  end

  def page_path(name) do
    Path.join(priv_path(), "templates/pages")
    |> Path.join(name)
  end

  def layout_path() do
    Path.join(priv_path(), "templates/layout.html")
  end
end
