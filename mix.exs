defmodule Portfolio.MixProject do
  use Mix.Project

  def project do
    [
      app: :portfolio,
      version: "0.1.0",
      elixir: "~> 1.18",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      compilers: [:temple] ++ Mix.compilers()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      mod: {Portfolio.Application, []},
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:yaml_elixir, "~> 2.8"},
      {:plug_cowboy, "~> 2.6"},
      {:exsync, "~> 0.4", only: :dev},
      {:temple, "~> 0.11.0"},
      {:mdex, "~> 0.6"}
    ]
  end
end
