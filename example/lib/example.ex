defmodule Example do
  use Application

  #@x 5 # constant variable
  # Using the module attribute in the main function

  def start(_type, _args) do
    Example.main
    # A supervisor is a process that supervises other processes (child processes)
    # It monitors the child processes and restarts them if they crash.
    # The :one_for_one strategy means that the supervisor only restarts the child process that crashed.
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    # :hello an alertnative to a string "hello" --> Atom (constant variable)
    #IO.puts(:hello)

    # name = "John"
    # status = Enum.random([:gold, :silver, :bronze]) # Enum.random/1 returns a random element from a list

    # case status do
    #   :gold -> IO.puts("Congratulations, #{name}! You won the gold medal!")
    #   :silver -> IO.puts("Congratulations, #{name}! You won the silver medal!")
    #   :bronze -> IO.puts("Congratulations, #{name}! You won the bronze medal!")
    # end



  end
end
