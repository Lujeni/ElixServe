defmodule App.MixProject do
  use Mix.Project

  def project do
    [
      app: :elixserve,
      version: "1.0.0",
      elixir: "~> 1.17",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: [main_module: CLI]
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      mod: {Server, []}
    ]
  end

  defp deps do
    []
  end
end
