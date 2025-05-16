defmodule Portfolio.Views.Icons do
  import Temple

  def emoji(assigns) do
    temple do
      div class: "w-12 h-12 rounded-sm bg-zinc-700 flex flex-col items-center justify-center" do
        span class: "text-3xl #{@class}", do: @emoji
      end
    end
  end

  def right_arrow(assigns) do
    temple do
      svg defer: true,
          width: "15",
          height: "15",
          viewBox: "0 0 15 15",
          fill: "none",
          id: "right-arrow",
          xmlns: "http://www.w3.org/2000/svg",
          class: "#{@class}" do
        path d:
               "M8.14645 3.14645C8.34171 2.95118 8.65829 2.95118 8.85355 3.14645L12.8536 7.14645C13.0488 7.34171 13.0488 7.65829 12.8536 7.85355L8.85355 11.8536C8.65829 12.0488 8.34171 12.0488 8.14645 11.8536C7.95118 11.6583 7.95118 11.3417 8.14645 11.1464L11.2929 8H2.5C2.22386 8 2 7.77614 2 7.5C2 7.22386 2.22386 7 2.5 7H11.2929L8.14645 3.85355C7.95118 3.65829 7.95118 3.34171 8.14645 3.14645Z",
             fill: "currentColor",
             fill_rule: "evenodd",
             clip_rule: "evenodd"
      end
    end
  end

  def email(assigns) do
    temple do
      svg width: "15",
          height: "15",
          viewBox: "0 0 15 15",
          fill: "none",
          xmlns: "http://www.w3.org/2000/svg",
          class: "#{@class}" do
        path d:
               "M1 2C0.447715 2 0 2.44772 0 3V12C0 12.5523 0.447715 13 1 13H14C14.5523 13 15 12.5523 15 12V3C15 2.44772 14.5523 2 14 2H1ZM1 3L14 3V3.92494C13.9174 3.92486 13.8338 3.94751 13.7589 3.99505L7.5 7.96703L1.24112 3.99505C1.16621 3.94751 1.0826 3.92486 1 3.92494V3ZM1 4.90797V12H14V4.90797L7.74112 8.87995C7.59394 8.97335 7.40606 8.97335 7.25888 8.87995L1 4.90797Z",
             fill: "currentColor",
             fill_rule: "evenodd",
             clip_rule: "evenodd"
      end
    end
  end

  def telegram(assigns) do
    temple do
      svg width: "15",
          height: "15",
          viewBox: "0 0 15 15",
          fill: "none",
          xmlns: "http://www.w3.org/2000/svg",
          class: "#{@class}" do
        path d:
               "M1.20308 1.04312C1.00481 0.954998 0.772341 1.0048 0.627577 1.16641C0.482813 1.32802 0.458794 1.56455 0.568117 1.75196L3.92115 7.50002L0.568117 13.2481C0.458794 13.4355 0.482813 13.672 0.627577 13.8336C0.772341 13.9952 1.00481 14.045 1.20308 13.9569L14.7031 7.95693C14.8836 7.87668 15 7.69762 15 7.50002C15 7.30243 14.8836 7.12337 14.7031 7.04312L1.20308 1.04312ZM4.84553 7.10002L2.21234 2.586L13.2689 7.50002L2.21234 12.414L4.84552 7.90002H9C9.22092 7.90002 9.4 7.72094 9.4 7.50002C9.4 7.27911 9.22092 7.10002 9 7.10002H4.84553Z",
             fill: "currentColor",
             fill_rule: "evenodd",
             clip_rule: "evenodd"
      end
    end
  end

  def avatar(assigns) do
    assigns = assigns |> Map.put_new(:class, "")

    temple do
      div class:
            "w-8 h-8 rounded-full bg-zinc-600 flex flex-col items-center justify-center " <>
              @class,
          do: @letter
    end
  end

  def emoji_avatar(assigns) do
    assigns = assigns |> Map.put_new(:class, "")

    temple do
      div class:
            "w-8 h-8 rounded-full bg-zinc-600 flex flex-col items-center justify-center " <>
              @class,
          do: @letter
    end
  end

  def arrow_open(assigns) do
    temple do
      svg class: @class,
          width: "15",
          height: "15",
          viewbox: "0 0 15 15",
          fill: "none",
          xmlns: "http://www.w3.org/2000/svg" do
        path d:
               "M3 2C2.44772 2 2 2.44772 2 3V12C2 12.5523 2.44772 13 3 13H12C12.5523 13 13 12.5523 13 12V8.5C13 8.22386 12.7761 8 12.5 8C12.2239 8 12 8.22386 12 8.5V12H3V3L6.5 3C6.77614 3 7 2.77614 7 2.5C7 2.22386 6.77614 2 6.5 2H3ZM12.8536 2.14645C12.9015 2.19439 12.9377 2.24964 12.9621 2.30861C12.9861 2.36669 12.9996 2.4303 13 2.497L13 2.5V2.50049V5.5C13 5.77614 12.7761 6 12.5 6C12.2239 6 12 5.77614 12 5.5V3.70711L6.85355 8.85355C6.65829 9.04882 6.34171 9.04882 6.14645 8.85355C5.95118 8.65829 5.95118 8.34171 6.14645 8.14645L11.2929 3H9.5C9.22386 3 9 2.77614 9 2.5C9 2.22386 9.22386 2 9.5 2H12.4999H12.5C12.5678 2 12.6324 2.01349 12.6914 2.03794C12.7504 2.06234 12.8056 2.09851 12.8536 2.14645Z",
             fill: "currentColor",
             fill_rule: "evenodd",
             clip_rule: "evenodd" do
        end
      end
    end
  end
end
