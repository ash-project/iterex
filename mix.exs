# SPDX-FileCopyrightText: 2024 Alembic Pty Ltd
# SPDX-FileCopyrightText: 2024 iterex contributors <https://github.com/ash-project/iterex/graphs/contributors>
#
# SPDX-License-Identifier: MIT

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
      licenses: ["MIT"],
      files: ~w[lib .formatter.exs mix.exs README* LICENSE* CHANGELOG*],
      maintainers: [
        "James Harton <james@harton.nz>",
        "Zach Daniel <zach@zachdaniel.dev>"
      ],
      links: %{
        "GitHub" => "https://github.com/ash-project/iterex",
        "Changelog" => "https://github.com/ash-project/iterex/blob/main/CHANGELOG.md",
        "Discord" => "https://discord.gg/HTHRaaVPUc",
        "Website" => "https://ash-hq.org",
        "Forum" => "https://elixirforum.com/c/elixir-framework-forums/ash-framework-forum",
        "REUSE Compliance" => "https://api.reuse.software/info/github.com/ash-project/iterex",
        "Sponsor" => "https://github.com/sponsors/jimsynz"
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
