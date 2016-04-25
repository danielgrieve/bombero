use Mix.Config

config :bombero, sets: %{
  set_1: %{
    text: "Sample text",
    options: ["Option 1", "Option 2"]
  },

  set_2: %{
    text: "Sample text for set 2",
    options: ["Set 2: Option 1", "Set 2: Option 2", "Set 2: Option 3"]
  },

  set_5: %{
    text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam ipsum diam, eleifend a nibh sit amet, tristique mollis dui. Aliquam erat volutpat. Cras massa felis, porta ut metus nec, varius ullamcorper leo. Integer id vulputate ante. Cras vitae nisi fringilla, faucibus nulla eu, volutpat massa. Fusce euismod volutpat.",
    options: []
  }
}

config :bombero, messenger: Bombero.TestMessenger
