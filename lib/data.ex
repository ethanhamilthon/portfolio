defmodule Portfolio.Data do
  def projects do
    [
      %{
        title: "Portfolio",
        desc: "Personal website showcasing projects and articles",
        date: "April 2025",
        type: "active",
        links: [
          %{
            type: "Link",
            href: "https://yerd.me"
          }
        ],
        emoji: "👀"
      },
      %{
        title: "Hey",
        desc: "Terminal-based AI assistant",
        date: "April 2025",
        type: "finished",
        emoji: "👋",
        links: [
          %{
            type: "Github",
            href: "https://github.com/ethanhamilthon/hey"
          }
        ]
      },
      %{
        title: "Notez",
        desc: "Minimalistic note-taking app",
        date: "March 2025",
        type: "finished",
        emoji: "📝",
        links: [
          %{
            type: "Github",
            href: "https://github.com/ethanhamilthon/notez"
          },
          %{
            type: "Link",
            href: "https://n.yerd.me"
          }
        ]
      },
      %{
        title: "Sozdik",
        desc: "Local-first AI-powered vocabulary learning app",
        date: "March 2025",
        type: "finished",
        emoji: "💬",
        links: [
          %{
            type: "Github",
            href: "https://github.com/ethanhamilthon/sozdik"
          },
          %{
            type: "Link",
            href: "https://w.yerd.me"
          }
        ]
      },
      %{
        title: "Ehto",
        desc: "Lightweight state sharing for React in under 40 lines",
        date: "August 2024",
        type: "finished",
        links: [
          %{
            type: "Github",
            href: "https://github.com/ethanhamilthon/ehto"
          },
          %{
            type: "NPM",
            href: "https://www.npmjs.com/package/ehto"
          }
        ]
      },
      %{
        title: "Leverans",
        desc: "Simple CI/CD tool for deploying apps to your own VPS",
        date: "August 2024 - October 2024",
        type: "finished",
        links: [
          %{
            type: "Github",
            href: "https://github.com/ethanhamilthon/leverans"
          },
          %{
            type: "Link",
            href: "https://leverans.dev"
          }
        ]
      },
      %{
        title: "GoHTMX Template",
        desc: "Starter template for building web apps with Go and HTMX",
        date: "July 2024",
        type: "finished",
        links: [
          %{
            type: "Github",
            href: "https://github.com/ethanhamilthon/gohtmx_boiler"
          }
        ]
      },
      %{
        title: "Paar",
        desc: "Basic key-value storage system written in Go",
        date: "June 2024",
        type: "finished",
        links: [
          %{
            type: "Github",
            href: "https://github.com/ethanhamilthon/paar"
          }
        ]
      },
      %{
        title: "Vocabraze",
        desc: "AI-powered flashcard generation app",
        date: "March 2024 - June 2024",
        type: "shutdown",
        emoji: "🔤",
        links: [
          %{
            type: "Github",
            href: "https://github.com/ethanhamilthon/swfront"
          }
        ]
      }
    ]
    |> Enum.map(fn m -> Map.put_new(m, :emoji, "") end)
  end

  def articles do
    [
      %{
        title: "How I Learned Rust in Two Hours",
        desc: "Some thoughts on how to effectively learn the Rust language",
        date: "May 6, 2025",
        link: "/articles/learn-rust"
      }
    ]
  end

  def read_article(:rust) do
    File.read!("rust.md") |> MDEx.parse_document!() |> parse_document()
  end

  def read_article(_) do
    raise "not implemented"
  end

  def parse_document(%MDEx.Document{nodes: nodes}) do
    nodes |> Enum.map(fn v -> parse_document(v) end) |> Enum.join("")
  end

  def parse_document(%MDEx.Heading{nodes: nodes, level: level}) do
    style =
      case level do
        1 -> "text-5xl font-bold mb-12"
        _ -> "text-3xl font-bold mb-4 mt-6"
      end

    "<h#{level} class=\"#{style}\">#{nodes |> Enum.map(fn v -> parse_document(v) end) |> Enum.join("")}</h#{level}>"
  end

  def parse_document(%MDEx.Paragraph{nodes: nodes}) do
    style = "text-zinc-300 text-lg"

    "<span class=\"#{style}\">#{nodes |> Enum.map(fn v -> parse_document(v) end) |> Enum.join("")}</span>"
  end

  def parse_document(%MDEx.Text{literal: l}), do: l

  def parse_document(%MDEx.Code{literal: l}),
    do: "<span class=\"px-2 py-1 bg-zinc-700 rounded-lg text-white\">#{l}</span>"

  def parse_document(%MDEx.ThematicBreak{}), do: ""

  def parse_document(_) do
    raise "not implemented"
  end
end
