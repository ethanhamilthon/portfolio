defmodule Portfolio.Views.Blog do
  alias Portfolio.Data
  alias Portfolio.Views.Icons
  import Temple
  use Temple.Component

  def list do
    temple do
      div class: "w-full flex flex-col gap-8" do
        for b <- Data.articles() do
          c &item/1, title: b.title, desc: b.desc, date: b.date, link: b.link
        end
      end
    end
  end

  def item(assigns) do
    temple do
      a href: @link,
        class:
          "w-full flex flex-col gap-6 p-4 rounded-xl transition duration-300 hover:bg-zinc-800 cursor-pointer" do
        div class: "flex gap-3 items-center" do
          div class: "w-[2px] h-6 bg-zinc-400"
          span class: "text-zinc-400 text-[12px]", do: @date
        end

        h3 do: @title

        span class: "text-[12px] w-4/5 text-zinc-500", do: @desc

        div class: "text-emerald-500 flex items-center gap-3" do
          span do: "read more"
          c &Icons.right_arrow/1, class: ""
        end
      end
    end
  end
end
