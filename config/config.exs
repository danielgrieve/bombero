use Mix.Config

config :bombero, sets: %{
  set_1: %{
    text: "Your armor flashes in the sun as your greatsword strikes down the foes of the Empress Leanor, your sworn liege and the most radiant woman in the Three Long Kingdoms. But the enemies are strong, and they are legion.",
    options: ["Stand Fast", "Fall Back"]
  },

  set_2: %{
    text: "Your blade circles faster, your armor drips with the oily black blood of the southern manghouls. If this be your last battle, let it be your greatest. As the grey imps pile forward, biting and clawing at your greaves, you stand taller still, and bellow a curse on the Short King's name.",
    options: ["Fight On", "Succumb"]
  }
}

config :bombero, messenger: Bombero.Messenger

if File.exists?("config/#{Mix.env}.exs") do
  import_config "#{Mix.env}.exs"
end
