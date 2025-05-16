defmodule Portfolio.Templating do
  def eval(path, assigns) do
    EEx.eval_file(path,
      assigns: assigns ++ [use: fn a, b -> a |> H.component_path() |> eval(assigns ++ b) end]
    )
  end

  def with_layout(page, assigns \\ []) do
    H.layout_path()
    |> eval(assigns ++ [page: page])
  end
end
