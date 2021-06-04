defmodule Mix.Tasks.Compile.Gleam do
  use Mix.Task.Compiler

  def run(_args) do
    gleam_path = Application.get_env(:mix_gleam, :gleam_path, "gleam")

    case Mix.shell().cmd(gleam_path <> " build .") do
      0 -> {:ok, []}
      status -> exit(status)
    end
  end
end
