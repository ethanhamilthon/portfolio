defmodule Portfolio.Views.Projects do
  alias Portfolio.Data
  alias Portfolio.Views.Icons
  import Temple
  use Temple.Component

  def list do
    temple do
      c &wrapper/1, title: "Active projects", selector: "active", items: Data.projects()
      c &wrapper/1, title: "Finished projects", selector: "finished", items: Data.projects()
      c &wrapper/1, title: "Shut Down Projects", selector: "shutdown", items: Data.projects()
    end
  end

  def wrapper(assigns) do
    temple do
      div class: "w-full flex flex-col gap-6" do
        h3 class: "font-semibold text-xl", do: @title

        div class: "flex flex-wrap gap-4 items-start" do
          for i <- @items do
            if i.type == @selector do
              c &card/1,
                title: i.title,
                desc: i.desc,
                link: "Github",
                date: i.date,
                emoji: i.emoji,
                links: i.links
            end
          end
        end
      end
    end
  end

  def card(assigns) do
    temple do
      div class:
            "flex-1 min-w-96 max-w-[400px] p-4 rounded-xl flex flex-col gap-4  hover:bg-zinc-800 duration-300 cursor-pointer" do
        div class: "flex gap-3 items-center" do
          case assigns.emoji do
            "" ->
              c &Icons.avatar/1, letter: assigns.title |> String.first() |> String.upcase()

            emoji ->
              c &Icons.emoji_avatar/1, letter: emoji
          end

          span class: "font-semibold", do: assigns.title
        end

        span class: "text-zinc-400 text-[12px] w-3/5", do: assigns.desc

        div class: "flex items-center gap-4" do
          for l <- @links do
            div class: "text-zinc-300 hover:text-emerald-500 flex gap-2 items-center" do
              a target: "_blank", href: l.href, class: "text-[12px]", do: l.type

              c &Icons.arrow_open/1, class: "text-zinc-600"
            end
          end
        end

        span class: "text-zinc-500 text-[12px]", do: assigns.date
      end
    end
  end

  def active_projects() do
    temple do
      div class: "w-full flex flex-col bg-zinc-800/50 rounded-xl p-4 gap-6 border border-zinc-700" do
        div class: "flex items-center gap-3" do
          span do: "Active Projects"
        end

        div class: "w-full flex flex-col" do
          for i <- Data.projects() do
            if i.type == "active" do
              div class: "w-full flex items-center gap-3 p-2" do
                case i.emoji do
                  "" ->
                    c &Icons.avatar/1,
                      class: "w-12 h-12 text-2xl",
                      letter: i.title |> String.first() |> String.upcase()

                  emoji ->
                    c &Icons.emoji_avatar/1, class: "w-12 h-12 text-2xl", letter: emoji
                end

                div class: "flex flex-col" do
                  span do: i.title

                  span class: "text-zinc-500", do: if(String.length(i.desc) > 40) do
                    String.slice(i.desc, 0, 37) <> "..."
                  else
                    text
                  end
                end
              end
            end
          end
        end

        a href: "/projects",
          class:
            "bg-zinc-800 flex items-center justify-center w-full py-2 rounded-sm gap-2 hover:bg-zinc-700 transition duration-200 cursor-pointer" do
          span do: "All projects"
          c &Icons.right_arrow/1, class: "text-white"
        end
      end
    end
  end
end
