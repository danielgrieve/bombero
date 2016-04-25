defmodule Bombero.TestMessenger.State do
  defstruct button_messages: [], text_messages: []

  def add_button_message(state, recipient, text, options) do
    message = %{recipient: recipient, text: text, options: options}

    state
    |> Map.put(:button_messages, [ message | state.button_messages ])
  end

  def add_text_message(state, recipient, text) do
    message = %{recipient: recipient, text: text}

    state
    |> Map.put(:text_messages, [ message | state.text_messages ])
  end
end

defmodule Bombero.TestMessenger do
  alias Bombero.TestMessenger.State

  def start_link do
    Agent.start(fn ->
      %State{}
    end, name: __MODULE__)
  end

  def button_messages do
    Agent.get(__MODULE__, fn (state) ->
      state.button_messages
    end)
  end

  def text_messages do
    Agent.get(__MODULE__, fn (state) ->
      state.text_messages
    end)
  end

  def reset do
    Agent.update(__MODULE__, fn (_) ->
      %State{}
    end)
  end

  def send_button_message(recipient, text, options) do
    Agent.update(__MODULE__, fn (state) ->
      State.add_button_message(state, recipient, text, options)
    end)
  end

  def send_text_message(recipient, text) do
    Agent.update(__MODULE__, fn (state) ->
      State.add_text_message(state, recipient, text)
    end)
  end
end
