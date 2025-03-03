defmodule Iter.MixProject do
  use Mix.Project

  @moduledoc """
  Lazy, external iterators for Elixir.
  """
  @version "0.1.3"

  def project do
    [
      app: :iterex,
      version: @version,
      description: @moduledoc,
      elixir: "~> 1.15",
      consolidate_protocols: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      package: package(),
      docs: docs(),
      source_url: "https://github.com/ash-project/iterex",
      homepage_url: "https://github.com/ash-project/iterex"
    ]
  end

  def package do
    [
      name: :iterex,
      licenses: ["MIT"],
      files: ~w[lib .formatter.exs mix.exs README* LICENSE* CHANGELOG*],
      maintainers: [
        "James Harton <james@harton.nz>",
        "Zach Daniel <zach@zachdaniel.dev>"
      ],
      links: %{
        GitHub: "https://github.com/ash-project/iterex",
        Discord: "https://discord.gg/HTHRaaVPUc",
        Sponsor: "https://github.com/sponsors/jimsynz"
      }
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp docs do
    [
      main: "readme",
      formatters: ["html"],
      extras: ["README.md"],
      logo: "logos/iterex-logo-small.png",
      before_closing_head_tag: fn type ->
        if type == :html do
          """
          <script>
            if (location.hostname === "hexdocs.pm") {
              var script = document.createElement("script");
              script.src = "https://plausible.io/js/script.js";
              script.setAttribute("defer", "defer")
              script.setAttribute("data-domain", "ashhexdocs")
              document.head.appendChild(script);
            }
          </script>
          """
        end
      end
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:splode, "~> 0.2"},
      {:credo, "~> 1.7", only: [:dev, :test], runtime: false},
      {:dialyxir, "~> 1.3", only: [:dev, :test], runtime: false},
      {:doctor, "~> 0.21", only: [:dev, :test], runtime: false},
      {:earmark, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:ex_check, "~> 0.16", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: [:dev, :test], runtime: false},
      {:faker, "~> 0.18", only: [:dev, :test], runtime: false},
      {:git_ops, "~> 2.6", only: [:dev, :test], runtime: false},
      {:igniter, "~> 0.5", only: [:dev, :test], runtime: false},
      {:mix_audit, "~> 2.1", only: [:dev, :test], runtime: false}
    ]
  end
end
