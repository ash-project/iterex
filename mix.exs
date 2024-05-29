defmodule Iter.MixProject do
  use Mix.Project

  def project do
    [
      app: :iterex,
      version: "0.1.0",
      elixir: "~> 1.16",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package()
    ]
  end

  def package do
    [
      name: :iterex,
      maintainers: ["James Harton <james@harton.nz>", "Zach Daniel <zach@zachdaniel.dev>"]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    opts = [only: [:dev, :test], runtime: false]

    [
      {:credo, "~> 1.7", opts},
      {:dialyxir, "~> 1.3", opts},
      {:doctor, "~> 0.21", opts},
      {:earmark, ">= 0.0.0", opts},
      {:ex_check, "~> 0.16", opts},
      {:ex_doc, ">= 0.0.0", opts},
      {:faker, "~> 0.18", opts},
      {:git_ops, "~> 2.6", opts},
      {:mix_audit, "~> 2.1", opts}
    ]
  end
end
