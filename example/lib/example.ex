defmodule Membership do
  defstruct [:type, :price]
end

defmodule User do
  defstruct [:name, :membership]
end

defmodule Example do

  use Application

  #@x 5 # constant variable
  # Using the module attribute in the main function

  def start(_type, _args) do
    # Example.main()
    Example.guessing_game()
    # A supervisor is a process that supervises other processes (child processes)
    # It monitors the child processes and restarts them if they crash.
    # The :one_for_one strategy means that the supervisor only restarts the child process that crashed.
    Supervisor.start_link([], strategy: :one_for_one)
  end

  def main do
    # :hello an alertnative to a string "hello" --> Atom (constant variable)
    # IO.puts(:hello)

    # name = "John"
    # status = Enum.random([:gold, :silver, :bronze]) # Enum.random/1 returns a random element from a list

    # case status do
    #   :gold -> IO.puts("Congratulations, #{name}! You won the gold medal!")
    #   :silver -> IO.puts("Congratulations, #{name}! You won the silver medal!")
    #   :bronze -> IO.puts("Congratulations, #{name}! You won the bronze medal!")
    # end

    # FLOATING POINT NUMBERS

    #:io.format("~.20f\n", [0.1]) # 20 values after and formatted as a float

    # COMPOUNDS TYPES
    # 1. Time

    IO.puts("--------- Time ---------")
    time = Time.new!(16,30,0,0)
    date = Date.new!(2025, 1, 1)
    # IO.inspect(time)
    # IO.inspect(date)
    date_time = DateTime.new!(date, time, "Etc/UTC")
    IO.inspect(date_time)
    IO.puts(date_time.year)
    # 3. Tuples --> storing multiple values in a single variable

      IO.puts("--------- Tuples & Maps & Structs ---------")

      # memberships  = {:bronze, :silver}
      # memberships = Tuple.insert_at(memberships, tuple_size(memberships), :gold) # Tuple.insert_at/3 appends a value to a tuple
      # IO.inspect(memberships)

      # prices = {5, 10, 15}
      # avg = Tuple.sum(prices) / tuple_size(prices)


      # IO.puts("Average price from #{elem(memberships, 0)} #{elem(memberships, 1)} #{elem(memberships, 2)} is #{avg}")

      # Creating a map for memberships
      _memberships = %{
        gold: :gold,
        silver: :silver,
        bronze: :bronze,
        none: :none
      }

      _prices = %{
        gold: 25,
        silver: 20,
        bronze: 15,
        none: 0
      }

      gold_membership = %Membership{type: :gold, price: 25}
      silver_membership = %Membership{type: :silver, price: 20}
      bronze_membership = %Membership{type: :bronze, price: 15}
      none_membership = %Membership{type: :none, price: 0}

      users = [
        %User{name: "John", membership: gold_membership},
        %User{name: "Jane", membership: silver_membership},
        %User{name: "Bob", membership: bronze_membership},
        %User{name: "Alice", membership: none_membership}
      ]

      Enum.each(users, fn %User{name: name, membership: membership} ->
        IO.puts("#{name} has a #{membership.type} membership paying #{membership.price} dollars")
      end)

    # How long for new year

    IO.puts("--------- How long for new year ---------")

    created_time = DateTime.new!(Date.new!(2026,1,1), Time.new!(0,0,0,0), "Etc/UTC")
    time_till = DateTime.diff(created_time, DateTime.utc_now(), :second)

    days = div(time_till, 86400)
    hours = div(rem(time_till, 86400), 3600)
    minutes = div(rem(time_till, 3600), 60)
    seconds = rem(time_till, 60)
    IO.puts("Time till new year: #{days} days, #{hours} hours, #{minutes} minutes, #{seconds} seconds")


  end

  def guessing_game do
    IO.puts("--------- Guessing Game ---------")
    random_number = :rand.uniform(10) # Generates a random number between 1 and 10
    IO.puts("Random number: #{random_number}")
    IO.puts("Guess a number between 1 and 10")

    guess = IO.gets("Enter your guess: ")
    guess = String.trim(guess) |> Integer.parse() |> elem(0) # Parse the input to an integer

    # while loop
    play_guessing_game(guess, random_number)
  end

  defp play_guessing_game(guess, random_number) when guess == random_number do
    IO.puts("Congratulations! You guessed the correct number!")
  end

  defp play_guessing_game(_guess, random_number) do
      IO.puts("Wrong guess! Try again.")
      new_guess = IO.gets("Enter your guess: ")
      new_guess = String.trim(new_guess) |> Integer.parse() |> elem(0) # Parse the input to an integer
      play_guessing_game(new_guess, random_number)
  end
end
