use Mix.Config

config :bombero, sets: %{
  set_1: %{
    text: "Your armor flashes in the sun as your greatsword strikes down the foes of the Empress Leanor, your sworn liege and the most radiant woman in the Three Long Kingdoms. But the enemies are strong, and they are legion.",
    options: ["Stand Fast", "Fall Back"]
  },

  set_2: %{
    text: "Your blade circles faster, your armor drips with the oily black blood of the southern manghouls. If this be your last battle, let it be your greatest. As the grey imps pile forward, biting and clawing at your greaves, you stand taller still, and bellow a curse on the Short King's name.",
    options: ["Fight On", "Succumb"]
  },

  set_3: %{
    text: "You turn to wade back through the sea of vile imps, not too late to protect the Empress, you hope. But there are too many grasping hands. You stumble ­­ suddenly...",
    options: ["Suddenly What?"]
  },

  set_4: %{
    text: "No use. There are too many of them. You fought valiantly, but now...",
    options: ["Now what?"]
  },

  set_5: %{
    text: "You slash and slash, you whirl your silver shield above your head ­­ until...",
    options: ["Until what?"]
  },

  set_6: %{
    text: "You wake with a start and fall from your overstuffed chair, pain flaring in your cheekbone as you hit the floor of your ramshackle farmhouse. A nostril full of dust inspires a powerful sneeze.",
    options: ["Wipe your nose", "Pick yourself up", "Look around"]
  },

  set_7: %{
    text: "You wipe the snot from your upper lip. Pathetic. Were you really that great warrior of your dreams? You were there, at Bandle's Crossing, yes. And you slew many dozens. But it seems so distant now. Perhaps it was all an illusion.",
    options: ["Pick yourself up", "Look around"]
  },

  set_8: %{
    text: "You lift yourself from the floor, your aging joints protesting. Nearly two score years have passed since the battle at Bandle's Crossing, and you are no longer young, no longer strong. Retirement is at hand. Or nearly so. You should be at your post. Ever vigilant, you find your sword is still in your hand.",
    options: ["Look around", "Recall your glory days", "Sit back down"]
  },

  set_9: %{
    text: "It was a harrowing battle. You still bear the scars. The crease in your side where the manghoul's dagger took you. Illusion? That imp's skull became your prize, and has sat on your hearth since that day.",
    options: ["Admire the skull"]
  },

  set_10: %{
    text: "You look to the grate ­­ but the skull is gone! You could not have imagined it, could not have misremembered. But your head is pounding from the fall, your palms slick with sweat. You were there. The Empress saw you. You could have sworn...",
    options: ["Look around", "Sit back down"]
  },

  set_11: %{
    text: "The dusty floor stretches unevenly to a fireplace where embers glow. You see a battered chest, strapped with leather and bronze fittings. Your stuffed chair has seen better days. A doorway leads to your bedroom. A heavy wooden door leads outside.",
    options: ["Pick yourself up"]
  },

  set_12: %{
    text: "Embers glow in a fireplace, barely warming the room. You see a battered chest, strapped with leather and bronze fittings. Your stuffed chair has seen better days. A doorway leads to your bedroom. A heavy wooden door leads outside.",
    options: ["Open the chest", "Open the door", "Sit back down"]
  },

  set_13: %{
    text: "Though its stuffing is nearly gone, there is no more comfortable resting place for this old soldier. Retirement can't come soon enough.",
    options: ["Relax"]
  },

  set_14: %{
    text: "You stir yourself, but are halted in your tracks by a scrabbling sound outside the front door. Your sword comes up nearly of its own accord, as you track the sound around the outside of the farmhouse, toward the window, whose sash stands halfway open to the breeze.",
    options: ["Prepare for attack"]
  },

  set_15: %{
    text: "You take a deep breath ­­ but it's stopped in your chest by a scrabbling sound outside the front door. Your sword comes up nearly of its own accord, as you track the sound around the outside of the farmhouse, toward the window, whose sash stands halfway open to the breeze.",
    options: ["Prepare for attack"]
  },

  set_16: %{
    text: "As you gird yourself, a flash of red shows beyond the rippling panes ­­ resolving into a fat red Latisland pigeon that beats it wings against the glass and then manages to squeeze its considerable bulk through the opening and into your house. It squares itself on the floor before you, puffs its chest, and lets ring a guttural throat. Its cry of fwk­fwk­fwk, fwk­fwk­fwk, fwk­fwk­fwk is grating on your ears.",
    options: ["Attack the bird", "Grab the bird", "Glare at the bird"]
  },

  set_17: %{
    text: "You swing, but your heavy sword is hardly fast enough for the fowl. It flutters and hops to one side. Its cry of fwk­fwk­fwk, fwk­fwk­fwk, fwk­fwk­fwk is grating on your ears.",
    options: ["Grab the bird", "Glare at the bird", "Sheathe your sword"]
  },

  set_18: %{
    text: "With your sword and leather armor, you're not fast enough. The pigeon flutters and skips to one side, avoiding your grasp. Its cry of fwk­fwk­fwk, fwk­fwk­fwk, fwk­fwk­fwk is grating on your ears.",
    options: ["Attack the bird", "Glare at the bird", "Sheathe your sword"]
  },

  set_19: %{
    text: "The bird stares back, pleading. Its cry of fwk­fwk­fwk, fwk­fwk­fwk, fwk­fwk­fwk is grating on your ears.",
    options: ["Attack the bird", "Grab the bird", "Sheathe your sword"]
  },

  set_20: %{
    text: "You settle your greatsword into the scabbard on your belt, a gift of the Empress, and look again at the Latisland red. Its cry of fwk­fwk­fwk, fwk­fwk­fwk, fwk­fwk­fwk is grating on your ears.",
    options: ["Grab the bird", "Glare at the bird", "Draw your sword"]
  },

  set_21: %{
    text: "The pigeon hops away from you. Its cry of fwk­fwk­fwk, fwk­fwk­fwk, fwk­fwk­fwk is grating on your ears.",
    options: ["Attack the bird", "Grab the bird", "Glare at the bird"]
  },

  set_22: %{
    text: "Surprisingly, the pigeon acquiesces. You take it in your hand and notice a slim scroll of vellum wrapped around one bony leg.",
    options: ["Remove the message"]
  },

  set_23: %{
    text: "The pigeon eyes you curiously ­­ then flutters its wings once and settles itself on your hand. You notice a slim scroll of vellum wrapped around one bony leg.",
    options: ["Remove the message"]
  },

  set_24: %{
    text: "As you unfurl the scroll you spot something you haven't seen in decades: the Empress's seal. Leanor herself summons you to the Stalking Palace. You still recognize her unmistakable hand, even after all these years. \"Travel in livery, that the realm may know my savior approaches.\" Your armor needs polishing, but it will serve.",
    options: ["Set out"]
  },

  set_25: %{
    text: "The end of the beginning...",
    options: ["Play Again"]
  },
}

config :bombero, messenger: Bombero.Messenger

if File.exists?("config/#{Mix.env}.exs") do
  import_config "#{Mix.env}.exs"
end
