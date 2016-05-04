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

  # Set 25 should set a flag:
  #   characterArmor = "leather"
  set_25: %{
    text: "You release the bird and cross to your door. But the Empress's message echoes: \"Travel in livery.\" Now where did you hide that damnable armor?",
    options: ["Look around"]
  },

  set_26: %{
    text: "Embers glow in a fireplace, barely warming the room. You see a battered chest, strapped with leather and bronze fittings. Your stuffed chair has seen better days. A red Latisland pigeon scrabbles on the floor.",
    options: ["Open the chest", "Sit back down"]
  },

  set_27: %{
    text: "You relax into your chair, which is no longer as \"easy\" as you might like. The pigeon scratches in a corner.",
    options: ["Get to your feet", "Recall the Empress"]
  },

  set_28: %{
    text: "As a Protector, you stood close enough to touch the Empress daily. To do so in the Palace halls, however, would have disgraced her name and yours. Enough to watch her lips as they commanded you, to steal a glance at her eyes of..."
    options: ["Green?", "Red?", "Moonlight grey?"]
  },

  set_29: %{
    text: "Could that have been their color? So many years have passed that you cannot now be sure. Could it be nothing but a dream? Surely not! You rise from your chair. A journey awaits. But first, your livery..."
    options: ["Open the chest"]
  },

  # Set 30 should set three flags:
  #   platePolished = "false"
  #   armorWorn = "false"
  #   boxOpened = "false"
  set_30: %{
    text: "In the chest, dusty with years of disuse, your plate armor waits patiently, livery of a Protector of the Long Realm. A musty wooden box you don't remember waits alongside your helm."
    options: ["Open the box", "Wear the armor"]
  },

  # Set 31 should set a flag:
  #   boxOpened = "true"
  set_31: %{
    text: "A few rags, grey with oils and lye, are stuffed haphazardly inside."
    options: ["Take rags", "Wear the armor"]
  },

  set_32: %{
    text: "The rags are greasy to the touch, redolent with the polish that will make your armor gleam again."
    options: ["Polish the armor", "Wear the armor"]
  },

  # Set 33 should set a flag:
  #   platePolished = "true"
  set_33: %{
    text: "As you work the rags against the metal surfaces, your armor starts to shine as it once did at Bandle's Crossing and on fields of battle throughout the realm."
    options: ["Wear the armor"]
  },

  # Set 34 should set two flags:
  #   characterArmor = "plate"
  #   armorWorn = "true"
  set_34: %{
    text: "You struggle into your heavy armor. As it settles on your shoulders, you imagine you feel some of the power of your youth. But you notice the leather armature beneath the plate is fraying. Would these pieces really stand against a determined foe?"
    options: ["Take off the armor", "Leave the farmhouse"]
  },

  # Set 35 should set a flag:
  #   characterArmor = "none"
  set_35: %{
    text: "You place the armor in the chest again, beside the box of greasy rags."
    options: ["Take rags", "Wear the armor"]
  },

  set_36: %{
    text: "Your armor could not shine any more if you polished it on a virgin's ass."
    options: ["Wear the armor"]
  },

  # Set 37 should set a flag:
  #   characterArmor = "plate"
  set_37: %{
    text: "The armor settles on your shoulders once again. There's no mistake: it carries with it some of the energy of your youth."
    options: ["Leave the farmhouse"]
  },

  # Set 38 should set a flag:
  #   characterArmor = "none"
  set_38: %{
    text: "You place the armor in the chest again, beside the wooden box."
    options: ["Open the box", "Wear the armor"]
  },

  # Set 39 is meant to have an image:
  #   farmhouse.jpg
  #   found in https://drive.google.com/folderview?id=0Bx-H3fjlaKN0X3dGay1TckN3R3c&usp=sharing
  set_39: %{
    text: "You throw open the door to your modest farmhouse and cross the threshold, the first step on a journey you feel sure will be your last. You squint at the noontime sun and shield your eyes. It is time to go."
    options: ["Set out", "One last look"]
  },

  set_40: %{
    text: "The track from your farmhouse runs due west in the direction of Stalking, the seat of power. Behind you, though, your ruined watchtower lies."
    options: ["Look west", "Look to the tower"]
  },

  # Set 40a is meant to have an image:
  #   path.jpg
  #   found in https://drive.google.com/folderview?id=0Bx-H3fjlaKN0X3dGay1TckN3R3c&usp=sharing
  set_40a: %{
    text: "The Empress awaits. You stiffen your back. There is no time to lose."
    options: ["Set out west", "Reconsider"]
  },

  # Set 40b is meant to have an image:
  #   tower.jpg
  #   found in https://drive.google.com/folderview?id=0Bx-H3fjlaKN0X3dGay1TckN3R3c&usp=sharing
  set_40b: %{
    text: "The watchtower you built these many years ago still stands, though time has laid it almost as low as it has laid you. You are tempted by one last look before you abandon your post for the last time."
    options: ["Climb the tower", "Reconsider"]
  },

  set_41: %{
    text: "You steal one last glance at the watchtower you built, the once-proud symbol of your exile, but you aren't sure whether leaving it behind inspires grief, regret, or a budding sense of elation."
    options: ["Begin your journey"]
  },

  set_42: %{
    text: "In your heavy plate mail, even the walk to the tower tires you. You set a weary foot on the lowest step of this symbol of your exile and consider the climb."
    options: ["Climb the stair", "Go west"]
  },

  set_43: %{
    text: "You are halfway up the tumbledown tower when something starts to give. A stone falls from the parapet to land at your feet, cracking the flags beneath you. Mortar gives way as the tower begins to collapse."
    options: ["Back down!", "Leap up!", "Jump!"]
  },

  set_44: %{
    text: "You hurry back down the crumbling steps just in time. With a rain of stone, the tower gives up its tenuous hold. It crashes down around you, but you escape unhurt. At least you know your armor can take a blow."
    options: ["Set out west"]
  },

  set_45: %{
    text: "As you step over the widening crevice, the lower half of the stair you spent so many back-breaking hours to build starts to crumble away beneath you. You trip up the remaining steps, with a single wall of the tower still standing to support you. As you gain the parapets, you wonder if you'll be able to make it back down."
    options: ["Take in the view"]
  },

  set_46: %{
    text: "Looking west from the parapets, you can make out the two roads that lead toward the Stalking Palace."
    options: ["Look to the Low Road", "Look to the High Road"]
  },

  set_47: %{
    text: "The Low Road, through the darkness of Haver's Broadwood, bends past the many lurksome dangers that lie to its either side. You shudder to recall your last passage that way."
    options: ["Look to the High Road", "Descend"]
  },

  set_48: %{
    text: "The High Road flies straight, a league south of the Broadwood, crossed and recrossed by the Wandering Flume. But smoke rises from the towns along its length as you have not seen in decades. Something dire is afoot."
    options: ["Look to the Low Road", "Descend"]
  },

  set_49: %{
    text: "There are just enough stones left for you to make it to the ground without harm. You dust yourself off and brace yourself for the journey ahead."
    options: ["Set out west"]
  },

  set_50: %{
    text: "As the tower gives up its tenuous hold, you leap from the stair, pelted by a rain of stone as the tower crashes down around you. You pick yourself up and realize you're unhurt. And in surveying the surroundings, you spot a flash of white cloth, trapped beneath a parapet stone."
    options: ["Move the stone"]
  },

  set_51: %{
    text: "You manage to shift the stone, its shape familiar to you from hours of standing watch, and pluck up the scrap of white silk before the breeze can carry it away."
    options: ["Examine the cloth"]
  },

  set_52: %{
    text: "The bit of silk is tattered and yellowed with age, but the monogram is unmistakable: a single letter L, embroidered in the royal style. How did it get here? The memory is lost to your aging mind, if ever you knew it. You gingerly pocket the scrap and brace yourself for the journey ahead."
    options: ["Set out west"]
  },

  set_53: %{
    text: "To be continued...",
    options: ["Play Again"]
  },

}

config :bombero, messenger: Bombero.Messenger

if File.exists?("config/#{Mix.env}.exs") do
  import_config "#{Mix.env}.exs"
end
