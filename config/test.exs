use Mix.Config

config :bombero, sets: %{
  set_1: %{
    text: "Sample text",
    options: ["Option 1", "Option 2"]
  },

  set_2: %{
    text: "Sample text for set 2",
    options: ["Set 2: Option 1", "Set 2: Option 2", "Set 2: Option 3"]
  }
}

config :bombero, messenger: Bombero.TestMessenger
