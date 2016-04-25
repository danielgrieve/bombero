defmodule Bombero.MessageHandlerTest do
  use ExUnit.Case

  alias Bombero.MessageHandler, as: Subject
  # alias Bombero.TestMessenger

  test "help message" do
    # Subject.handle(help_message)
    # Set up the messenger to store the messages sent rather than try and send
    # them in tests.
  end


  defp help_message do
    %{sender: sender,
      message: %{
        text: "help"
      }
    }
  end

  defp sender do
    %{id: 123456}
  end
end
