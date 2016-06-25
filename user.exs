defmodule User do
  @moduledoc """
  Defines the user struct and functions to handle users
  """

  defstruct name: nil, email: nil

  @doc """
  Get the first name of a user.

  ## Parameters

  - `user` - A User struct.

  ## Examples

      user = %User{name: "Jim Bob"}
      User.first_name(user)
      # => "Jim"
  """
  def first_name(user) do
    user.name
    |> get_names
    |> List.first
  end

  @doc """
  Get the last name of a user

  ## Parameters

  - `user` - A user struct.
  - `user` - A user struct.
  - `user` - A user struct.

  ## Examples

  ```
  user = %User{name: "Jim Bob"}
  User.last_name(user)
  # => "Bob"
  ```
  """
  def last_name(user) do
    user.name
    |> get_names
    |> List.last
  end

  @doc """
  Get the email domain of a user

  ## Parameters
  - `user` - A user struct

  ## Examples

      user = %User{email: "jobs@apple.com"}
      User.email_domain(user)
      # => "apple.com"
  """
  def email_domain(user) do
    user.email
    |> String.split("@")
    |> List.last
  end

  defp get_names(nil), do: []
  defp get_names(full_name) do
    String.split(full_name) # splits on spaces by default
  end
end

