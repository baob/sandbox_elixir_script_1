defmodule Example do
  def main(args) do
    args |> parse_args |> process
  end

  def process([]) do
    IO.puts "No arguments given"
  end

  def process(options) do
    IO.puts "Github #{options[:github]}"
    IO.puts "Live   #{options[:live]}"
    IO.puts "Test   #{options[:test]}"
    IO.puts "About to process ..."

    Dotenv.load
    IO.puts "FRED: #{System.get_env(:FRED)}"
  end

  defp parse_args(args) do
    {options, _, _} = OptionParser.parse(args,
      switches: [github: :string,
                   live: :string,
                   test: :string]
    )
    options
  end
end
