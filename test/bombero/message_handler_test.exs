defmodule Bombero.MessageHandlerTest do
  use BomberoCase

  alias Bombero.MessageHandler, as: Subject
  alias Bombero.TestMessenger

  test "help message" do
    Subject.handle(help_message)

    assert Enum.count(TestMessenger.messages) == 1

    message = TestMessenger.messages |> List.first()
    assert message.recipient == sender.id
    assert message.text =~ ~r/Here's some help/
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
