defmodule Bombero.TestMessenger.State do
  defstruct messages: []

  def add_message(state, recipient, text) do
    message = %{recipient: recipient, text: text}

    state
    |> Map.put(:messages, [ message | state.messages ])
  end
end

defmodule Bombero.TestMessenger do
  alias Bombero.TestMessenger.State

  def start_link do
    Agent.start(fn ->
      %State{}
    end, name: __MODULE__)
  end

  def messages do
    Agent.get(__MODULE__, fn (state) ->
      state.messages
    end)
  end

  def send_text_message(recipient, text) do
    Agent.update(__MODULE__, fn (state) ->
      State.add_message(state, recipient, text)
    end)
  end
end
