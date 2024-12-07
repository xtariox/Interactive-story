DROP TABLE IF EXISTS `player_progress`;
DROP TABLE IF EXISTS `choices`;
DROP TABLE IF EXISTS `endings`;
DROP TABLE IF EXISTS `chapters`;

CREATE TABLE `chapters` (
                            `id` INT NOT NULL,
                            `title` VARCHAR(255) NOT NULL,
                            `content` TEXT NOT NULL,
                            PRIMARY KEY (`id`)
);

CREATE TABLE `endings` (
                           `id` INT(11) NOT NULL AUTO_INCREMENT,
                           `title` VARCHAR(255) NOT NULL,
                           `content` TEXT NOT NULL,
                           PRIMARY KEY (`id`)
);

CREATE TABLE `choices` (
                           `id` INT(11) NOT NULL AUTO_INCREMENT,
                           `chapter_id` INT(11) NOT NULL,
                           `text` TEXT NOT NULL,
                           `next_chapter_id` INT(11), -- NULL if it leads to an ending
                           `ending_id` INT(11),
                           PRIMARY KEY (`id`),
                           FOREIGN KEY (`chapter_id`) REFERENCES `chapters`(`id`),
                           FOREIGN KEY (`next_chapter_id`) REFERENCES `chapters`(`id`)
);

CREATE TABLE `player_progress` (
                                   `id` INT(11) NOT NULL AUTO_INCREMENT,
                                   `player_name` VARCHAR(255) NOT NULL UNIQUE,
                                   `player_id` INT(11) NOT NULL,
                                   `chapter_id` INT(11) NOT NULL,
                                   PRIMARY KEY (`id`),
                                   FOREIGN KEY (`chapter_id`) REFERENCES `chapters`(`id`)
);

INSERT INTO `chapters` (`id`, `title`, `content`)
    VALUE
    # Prologue
    (0, 'The Invitation', CONCAT(
                                 'You’ve never seen a letter like this before.',
                                 CHAR(10),
                                 'It arrived at your doorstep on a cold, rainy evening, the envelope sealed with a dark wax emblem—something unfamiliar, yet oddly familiar, as if you’ve seen it before in a dream. The handwriting is neat but strange, elegant yet hurried.',
                                 CHAR(10),
                                 '_"You are invited to visit the Mansion of the Forgotten, a place where answers await those willing to seek them."_',
                                 CHAR(10),
                                  'The rest of the message is vague, cryptic even, speaking of forgotten truths, long-lost family secrets, and something about "the past that never let go."',
                                  CHAR(10),
                                  'A chill runs through your spine as you read those words. There’s something unsettling about the invitation, something you can’t quite place. Yet, despite the unease creeping in, a part of you feels drawn to it—an insatiable curiosity, a need to understand something buried deep within.',
                                 CHAR(10),
                                 'The letter mentions an old mansion, abandoned for decades, hidden in the fog of time and memory. They say no one has dared enter in years, and those who have... never returned. Still, the invitation promises closure, a chance to uncover the truth. It promises you answers. Answers you’ve been searching for, unknowingly, all your life.',
                                  CHAR(10),
                                 'But there''s a catch.',
                                 CHAR(10),
                                 '_"The Mansion does not welcome the faint-hearted. Only the brave may discover its secrets, and only those willing to face the darkness within shall survive."_',
                                 CHAR(10),
                                 'Your heart races, but you cannot ignore the feeling—the pull towards the mansion, like a magnetic force. What could be so important? What could it possibly want with you?',
                                 CHAR(10),
                                 'Your mind races with possibilities, but you’ve already made up your mind. You must go.',
                                 CHAR(10),
                                 'As you pack your things, an unsettling thought flickers in your mind: what if you’re not meant to return?',
                                 CHAR(10),
                                 'The road ahead is long, the sky darkening as you drive. The storm intensifies with every passing mile, and the headlights barely pierce through the thickening fog. And yet, the mansion waits, looming ahead, hidden in the distance.',
                                 CHAR(10),
                                 'It feels... wrong.',
                                 CHAR(10),
                                 'But it’s too late to turn back now.',
                                 CHAR(10),
                                 'You’ve already made your choice.')),

# Chapter 1
    (1, 'Entering the Mansion', CONCAT(
                                    'The mansion looms ahead, its silhouette casting a long shadow across the overgrown path. The sky above is an unnatural shade of grey, as if the sun has long since abandoned this place. A thick fog clings to the ground, swirling around your feet as you approach. The air is damp, carrying the scent of decay and earth, and a chill settles deep within your bones.',
                                    CHAR(10),
                                    'The mansion itself stands in eerie silence, its windows shattered, with shards of glass glinting like jagged teeth in the fading light. The heavy oak doors are ajar, creaking faintly in the wind as though inviting you in. An unsettling stillness pervades the air, broken only by the distant call of a raven.',
                                    CHAR(10),
                                    'Your heart pounds as you take a step closer, the sense of something watching you growing stronger. The invitation flashes in your mind—answers await those willing to seek them. But now that you’re here, you can’t shake the feeling that something is terribly wrong.',
                                    CHAR(10),
                                    'You glance back at the car, the road winding off into the distance. It would be so easy to turn around, to leave this forsaken place behind. But what would that make you? A coward? A failure? After all, you came here for answers, didn’t you?',
                                    CHAR(10),
                                    'The mansion stands before you, beckoning.')),

# Chapter 2
    (2, 'Inside the Mansion', CONCAT(
                                  'The creak of the door is the only sound as you step into the darkness of the mansion. Your footsteps echo in the vast, empty hall, the floorboards beneath you groaning with each step. The air inside is cold and musty, thick with the scent of mildew and old wood. The faint glow from the outside barely illuminates the space, casting long, distorted shadows along the walls.',
                                  CHAR(10),
                                  'Dust hangs thick in the air, as if no one has dared to enter this place for decades. The walls are lined with faded portraits of people you don’t recognize—strangely somber figures whose eyes seem to follow you with an unsettling intensity. Cobwebs stretch across the corners of the room, and the floor creaks ominously beneath your feet.',
                                  CHAR(10),
                                  'The silence is almost deafening, broken only by the occasional sound of something shifting in the distance—something unseen, yet always there.',
                                  CHAR(10),
                                  'As you stand in the entrance, you feel a strange presence surrounding you, a weight on your chest that grows heavier the deeper you go into the mansion. Something is wrong here, but you can’t pinpoint exactly what it is.',
                                  CHAR(10),
                                  'A set of grand stairs leads upward, its ornate railing tarnished and rusted with age. To the right, an arched doorway leads into what looks like a living room, and to the left, there’s a dark hallway that stretches into the shadows, disappearing out of sight.')),

# Chapter 3
    (3, 'The Grand Staircase', CONCAT(
                                   'The stairs creak under your weight as you ascend into the darkness, the air growing heavier with each step. The faint light from downstairs barely reaches the top, and shadows seem to twist and writhe in the corners of the upper floor. It’s as if the house itself is alive, watching you, waiting.',
                                   CHAR(10),
                                   'The staircase is grand, or at least it would have been once—tattered carpet barely clinging to the worn wood, the banister chipped and weathered with age. As you reach the top, you can feel the temperature drop. A strange chill fills the air, and you pull your jacket tighter around you, trying to fight the growing unease.',
                                   CHAR(10),
                                   'The hallway before you is lined with closed doors, some cracked open slightly, others completely shut. But what catches your attention more than anything is the wall to your left—a series of strange, cryptic markings are etched into the surface. They look like symbols, though their meanings elude you. They don’t resemble any language you recognize, and they seem to shift ever so slightly when you glance at them, as if they’re alive.',
                                   CHAR(10),
                                   'As you step forward, a low whispering reaches your ears. It''s impossible to tell where it''s coming from, but the voices are growing louder, filling the empty space with a steady hum of unintelligible murmurs. Your heart races, and you can’t help but feel that you’re being pulled deeper into the mansion’s grip.',
                                   CHAR(10),
                                   'The door at the end of the hall seems inviting in its solitude, the darkened room beyond it hidden from view. But the symbols on the wall... they might hold the key to understanding what’s happening here.')),

# Chapter 4
    (4, 'The Hallway', CONCAT(
                           'You take a cautious step down the dark hallway, your breath shallow, your pulse quickening. The air here feels different—thicker, almost oppressive. The walls seem to close in on you, and the dim light from the stairs behind you fades into the shadows, leaving you with only the faint, flickering glow of your own resolve.',
                           CHAR(10),
                           'The hallway stretches far ahead, disappearing into the darkness. You pass several doors along the way, each one seemingly closed to you. The silence is almost unbearable, broken only by the sound of your own footsteps and the occasional creak of the floorboards beneath your feet.',
                           CHAR(10),
                           'But something feels off. You can’t shake the sensation that you''re being watched, that something is lurking just out of sight. A chill runs down your spine as you hear a faint rustling noise from one of the rooms ahead. It’s almost imperceptible, but it’s there—like the sound of something moving, or breathing, hidden just beyond the door.',
                           CHAR(10),
                           'The hallway stretches on, and you find yourself drawn toward a door at the far end, slightly ajar, a sliver of light escaping from the gap. The air feels colder near it, as if the room beyond holds something... unnatural.')),

# Chapter 5
    (5, 'The Living Room', CONCAT(
                               'You step into the living room, and immediately, the air grows colder. The room is large, its once-grand décor now reduced to a decaying mess of forgotten memories. The furniture is covered in dusty white sheets, like ghosts hiding in plain sight, their outlines barely visible beneath the fabric. The walls are lined with faded wallpaper, peeling and torn in places, revealing the weathered wood beneath.',
                               CHAR(10),
                               'A large fireplace sits against one wall, the hearth cold and empty. The faintest traces of old ash are scattered across the floor. You feel an overwhelming sense of abandonment here, as though time itself has stopped in this place. The silence is suffocating, and the atmosphere is heavy with a sense of regret.',
                               CHAR(10),
                               'You glance around the room, eyes landing on a portrait above the fireplace. It’s an old painting of a family, their faces stern and expressionless, but there’s something wrong with it. One of them—a woman in the back—seems to have her eyes oddly glazed, as if she’s staring directly at you. You can’t shake the feeling that something isn’t right with this painting, that the family, despite their cold expressions, might have been hiding something darker.',
                               CHAR(10),
                               'There’s a door to your right, leading into another room. Beyond that, a faint light flickers, and a soft sound—like whispers—drifts from within.')),

# Chapter 6
    (6, 'The Master Bedroom', CONCAT(
                                  'You push open the door to the master bedroom, and the air feels even heavier, like it’s filled with secrets too dark to be revealed. The room is vast, with a high, arched ceiling and large windows covered in thick, tattered curtains. The light from the hallway barely illuminates the space, casting long, grotesque shadows across the furniture.',
                                  CHAR(10),
                                  'A massive four-poster bed stands in the center of the room, its sheets stained and torn. The bedposts are carved with intricate designs, but the carvings are so worn and faded that they’re almost unrecognizable. The furniture in the room is ornate but covered in dust, and the wooden floor creaks beneath your every step.',
                                  CHAR(10),
                                  'Near the bed, you notice something odd—a small, locked box resting on the nightstand. It’s made of dark wood, its surface smooth but scratched in places. It seems out of place in this otherwise decayed room, as though it hasn’t aged along with everything else. The lock on it is old, rusty, but still intact.',
                                  CHAR(10),
                                  'The atmosphere is thick with the scent of something musty and stagnant, and the whispers you’ve been hearing grow louder, more distinct. It’s almost as if they’re coming from the box itself. Your hand hovers over it, as if drawn to it, but a part of you hesitates. What could be inside?')),

# Chapter 7
    (7, 'The Markings', CONCAT(
                            'The symbols on the wall seem to shift as you approach them, as though they’re alive, writhing beneath the surface of the plaster. You run your fingers lightly over the carvings, and the surface feels unnaturally cold, sending a shiver through your body.',
                            CHAR(10),
                            'The markings don’t resemble any language you know—no recognizable alphabet or symbols from any culture you’ve read about. They’re angular, almost jagged, like they’ve been clawed into the wall. The more you stare, the more they seem to make sense, as if they’re speaking directly to your mind.',
                            CHAR(10),
                            'A sudden whisper breaks the silence, louder than before, resonating in your ears. It’s not coming from behind you, nor from the room itself—it’s coming from the markings. The voices are layered, indistinct, but they carry a tone of warning... or perhaps invitation.',
                            CHAR(10),
                            'Your vision starts to blur, the markings glowing faintly. A deep unease washes over you, yet you feel compelled to reach out, to trace the glowing lines. You’re not sure if it’s curiosity or something more sinister that drives you.')),

# Chapter 8
    (8, 'The Door', CONCAT(
                        'You approach the door at the end of the hallway, the sliver of light spilling out from the crack growing brighter as you draw near. The faint sound of rustling grows louder, more distinct. It’s not like footsteps, nor like a breeze—it’s more like fabric shifting, or something sliding across the floor.',
                        CHAR(10),
                        'The door itself is warped and old, the wood splintering around the edges. You hesitate for a moment, your hand hovering over the doorknob, feeling the cold metal beneath your fingertips. The whispers are louder now, almost urging you to enter.',
                        CHAR(10),
                        'As you push the door open, it creaks loudly, the sound echoing down the hallway behind you. The room beyond is dimly lit by a single flickering bulb hanging from the ceiling, casting strange, dancing shadows across the floor.',
                        CHAR(10),
                        'The room is bare save for a small table in the center, upon which sits an object covered by a black cloth. The cloth shifts slightly, though there’s no breeze in the room. Your heart pounds in your chest as you take a step closer.')),

# Chapter 9
    (9, 'The Other Rooms', CONCAT(
                               'You stop at one of the many doors lining the hallway, the wooden surface faded and cracked with age. The handle feels cold as you turn it, and the door creaks open slowly.',
                               CHAR(10),
                               'The room inside is small and cluttered, filled with furniture that looks as though it’s been hastily shoved inside. Chairs and tables are stacked on top of each other, covered in thick layers of dust. Cobwebs stretch from corner to corner, and the faint smell of decay fills your nostrils.',
                               CHAR(10),
                               'As you take a step inside, something catches your eye—a mirror leaning against the far wall. Its surface is tarnished, but you can still see your reflection. Or can you? The image staring back at you doesn’t move the same way you do. Its eyes seem to follow you, independent of your own movements.',
                               CHAR(10),
                               'You glance back toward the hallway, debating whether to stay or leave. The air in the room feels heavy, and your instincts scream at you to turn back.')),

# Chapter 10
    (10, 'The Portrait', CONCAT(
                            'You step closer to the portrait above the fireplace, drawn by the unsettling presence of the painted family. The frame is cracked in places, and a thick layer of dust clings to its surface, but the image itself remains eerily vivid.',
                            CHAR(10),
                            'The family stares out at you—four figures standing rigidly, dressed in formal, old-fashioned clothing. The father stands at the center, his expression cold and domineering, while the mother is to his right, her eyes unnaturally wide. Two children stand in front, their faces blank, as though their emotions had been erased.',
                            CHAR(10),
                            'But it’s the woman in the background that truly unnerves you. Her eyes seem to follow your every move, and her faint smile feels out of place—a mocking curve that chills you to the core.',
                            CHAR(10),
                            'As you reach out to touch the frame, something shifts. The woman’s smile deepens, and her head tilts ever so slightly. It’s impossible, but it’s happening.',
                            CHAR(10),
                            'A faint sound comes from behind the painting—a soft clicking, like a lock being undone.')),

# Chapter 11
    (11, 'The Flickering Light', CONCAT(
                                    'You push open the door to the room beyond, and the faint flickering light becomes more pronounced. The room is small, barely more than a storage space, but it’s empty except for a single table in the center.',
                                    CHAR(10),
                                    'On the table sits an old oil lamp, its flame sputtering as though it’s on the verge of going out. The faint light it emits casts strange shadows on the walls, shadows that seem to move independently of the lamp’s flickering.',
                                    CHAR(10),
                                    'As you step closer, you notice something written on the table in what looks like dried ink—or perhaps something darker. The words are scrawled in jagged, uneven lines: _“Only the light will reveal the truth.”_',
                                    CHAR(10),
                                    'You glance around, but there’s nothing else in the room. The shadows dance more violently, and the air feels heavy with anticipation.')),

# Chapter 12
    (12, 'The Box', CONCAT(
                       'The small, locked box on the nightstand seems to call out to you. You pick it up, feeling its surprising weight. The wood is smooth, yet faint scratches mar its surface, as though someone—or something—had tried desperately to open it before.',
                       CHAR(10),
                       'As you turn the box in your hands, you notice an engraving on the bottom: a strange symbol resembling an eye with jagged lashes. The whispers in the room grow louder, their tone shifting from faint murmurs to something closer to urgency.',
                       CHAR(10),
                       'Your fingers hover over the rusted lock. You hesitate—something about the box feels wrong, as though opening it could unleash something you’re not prepared to face.')),

# Chapter 13
    (13, 'The Room’s Secrets', CONCAT(
                                  'The room feels heavier as you step further inside. The furniture, stacked haphazardly, seems deliberately arranged to block access to certain parts of the room. Pushing past a chair, you notice a small trapdoor beneath a rotting rug.',
                                  CHAR(10),
                                  'The whispers in your mind grow louder as you crouch to examine the trapdoor. It’s sealed with an iron latch, which looks rusted but sturdy. Scratches and claw marks surround the edges, as though someone—or something—tried to get out.',
                                  CHAR(10),
                                  'Nearby, you notice a set of keys on a dusty shelf, their metal glinting faintly in the dim light. The sense of unease intensifies, and the whispers shift in tone, almost begging you to act.')),

# Chapter 14
    (14, 'The Visions', CONCAT(
                           'As your fingers trace the glowing markings, a sharp pain stabs through your mind. The room fades around you, replaced by a surreal, nightmarish landscape. You see the mansion, but it’s twisted—its walls are alive, pulsating like a beating heart.',
                           CHAR(10),
                           'Figures move in the shadows—silent, faceless beings that seem to watch your every move. A voice echoes in your mind, speaking in a language you don’t understand, yet the meaning is clear: _You shouldn’t be here_.',
                           CHAR(10),
                           'Suddenly, you’re back in the hallway, gasping for air. The markings on the wall are gone, replaced by deep scratches, as though something clawed at the plaster. Your head throbs, and the feeling of being watched grows stronger.')),

# Chapter 15
    (15, 'The Covered Object', CONCAT(
                                  'Your trembling hands reach out to remove the black cloth. As you pull it away, an ornate mirror is revealed, its surface pristine despite the decay around it. But the reflection is wrong.',
                                  CHAR(10),
                                  'You don’t see yourself. Instead, you see the woman from the portrait, standing motionless in the dim light. Her eyes meet yours, and her lips curl into that unsettling smile you saw before.',
                                  CHAR(10),
                                  'Her voice echoes in your mind: _“You’ve come so far. Will you open the final door?”_',
                                  CHAR(10),
                                  'Before you can respond, the mirror shatters with a deafening crack, shards falling at your feet. Behind it, a key is embedded in the wall, glowing faintly with an unnatural light.')),

# Chapter 16
    (16, 'The Mirror’s Truth', CONCAT(
                                  'The fractured shards of the mirror shimmer with an otherworldly glow. As you crouch to examine them, a fragment reflects an image that isn’t there—a distorted vision of the mansion, aflame and crumbling.',
                                  CHAR(10),
                                  'Within the reflection, you see yourself running, but something pursues you. Its form is unclear, shifting like a shadow caught in a storm, but its presence fills you with dread.',
                                  CHAR(10),
                                  'The woman’s voice echoes faintly in your ears: _“The truth lies within, but are you prepared to face it?”_',
                                  CHAR(10),
                                  'Suddenly, the shards grow cold, and the glow fades. Whatever you saw is gone, but a faint trail of blood now leads from the room toward the hallway.')),

# Chapter 17
    (17, 'The Hidden Drawer', CONCAT(
                                 'The desk in the corner creaks under your touch as you pull at its drawers. Most are empty, save for dust and cobwebs, but one drawer resists, its handle jammed. You pull harder, and it suddenly flies open, revealing a small, leather-bound journal.',
                                 CHAR(10),
                                 'The pages are yellowed, and the handwriting is frantic, almost illegible. Skimming through, you decipher fragmented sentences: _“...the house demands sacrifices... shadows grow stronger... the last key lies with her…”_',
                                 CHAR(10),
                                 'Tucked inside the journal is a rusted key and a black-and-white photograph. The photo shows the family from the portrait, but with one difference: the woman in the background is missing.',
                                 CHAR(10),
                                 'As you turn the photo over, words scrawled in ink catch your eye: _“She watches from the mirrors.”_')),

# Chapter 18
    (18, 'The Final Door', CONCAT(
                              'Pulling the portrait away from the wall reveals a narrow, dark passage carved into the stone. The air inside is damp and cold, and the whispers grow louder, their tone more insistent, almost pleading.',
                              CHAR(10),
                              'You step inside, the walls closing in as you move forward. Faint carvings line the stone, resembling the strange symbols you saw earlier. At the end of the passage, you find a small alcove with an ancient-looking altar. On the altar rests an ornate dagger, its blade gleaming despite the darkness.',
                              CHAR(10),
                              'Inscribed on the altar are words in a language you can’t read, but their meaning resonates in your mind: _“A choice must be made.”_')),

# Chapter 19
    (19, 'Guiding Light', CONCAT(
                             'The flickering light draws you closer, emanating from an ancient lantern on a pedestal. Its flame burns unnaturally bright, casting shifting shadows across the room. As you approach, the light steadies, and the whispers fade to silence.',
                             CHAR(10),
                             'A voice, calm yet commanding, resonates in your mind: _“You have sought the truth. Take this light as your guide.”_',
                             CHAR(10),
                             'Reaching out, your fingers brush the lantern’s cold metal. Its glow intensifies, illuminating symbols and hidden paths on the walls that were previously invisible. The flame doesn’t burn, but holding it fills you with a sense of purpose.',
                             CHAR(10),
                             'Suddenly, the voice warns: _“The light will guide you, but it cannot protect you.”_')),

# Chapter 20
    (20, 'Darkness Unleashed', CONCAT(
                                  'As you step into the shadowed room, the air grows heavy, and a deep chill seeps into your bones. The whispers crescendo into a deafening roar, and the door behind you slams shut.',
                                  CHAR(10),
                                  'In the darkness, shapes begin to move—twisted, humanoid forms with glowing eyes and grotesque features. Their movements are slow but deliberate, their attention focused entirely on you.',
                                  CHAR(10),
                                  'Suddenly, a low growl rumbles from the far corner, and a towering figure steps into the faint light. Its face is obscured, but its presence radiates pure malice.',
                                  CHAR(10),
                                  'A voice, not your own, speaks in your mind: _“You’ve gone too far. Now you face the consequences.”_')),

# Chapter 21
    (21, 'The Box’s Secret', CONCAT(
                                'The box feels unnaturally heavy as you lift it onto a nearby table. The carvings on its surface glow faintly under the dim light, and you sense that whatever lies inside is not meant to be disturbed.',
                                CHAR(10),
                                'With trembling hands, you open the box, revealing a black, pulsating orb. Its surface shimmers like liquid, and as you stare into it, visions flash through your mind—pain, despair, and something ancient, watching from the shadows.',
                                CHAR(10),
                                'The orb whispers directly to your thoughts: _“Take me, and I will grant you power. Leave me, and the truth will elude you.”_',
                                CHAR(10),
                                'You feel an intense pull toward the orb, as though it’s calling your very soul.')),

# Chapter 22
    (22, 'Beneath the Floorboards', CONCAT(
                                       'Following the trail of blood leads you to a warped section of the hallway floor. The boards creak ominously as you step closer. With some effort, you pry one loose, revealing a hidden compartment below.',
                                       CHAR(10),
                                       'Inside, you find a pile of old letters, each stained with dried blood. The handwriting is erratic, the words detailing the anguish of someone trapped in the house. One letter catches your attention:',
                                       CHAR(10),
                                       '_“The house feeds on our despair. Only by offering it what it seeks can we escape its grasp. I am sorry for what I must do.”_',
                                       CHAR(10),
                                       'Beneath the letters lies a silver locket. Opening it reveals a photograph of the woman from the portrait, her eyes scratched out. A faint, mournful cry echoes around you.')),

# Chapter 23
    (23, 'The Final Door', CONCAT(
                              'The locket feels heavy in your hand as you follow the blood trail further. It ends abruptly in front of a massive, ancient door etched with symbols that seem to shift as you look at them.',
                              CHAR(10),
                              'The air is oppressive, and a deep hum reverberates through the hall. You feel an overwhelming sense of dread.',
                              CHAR(10),
                              'The woman’s voice returns, softer now: _“This is where it ends, where the truth is revealed. Will you face it, or turn back?”_',
                              CHAR(10),
                              'The door creaks open slightly, revealing a faint red light inside.')),

# Chapter 24
    (24, 'The Ritual', CONCAT(
                          'The room beyond the door is circular, its walls covered in the same shifting symbols. In the center stands an altar, the dagger and the black orb from before placed upon it. The lantern’s light glows brightly in your hand, illuminating a stone inscription:',
                          CHAR(10),
                          '_“The house binds the soul. To break free, the sacrifice must be made.”_',
                          CHAR(10),
                          'The whispers become deafening as the shadows around the room coalesce into a figure—the woman from the portrait. Her hollow eyes pierce yours, and her voice echoes:',
                          CHAR(10),
                          '_“You hold the tools. The choice is yours: destroy the house or become its master.”_')),

# Chapter 25
    (25, 'The Struggle', CONCAT(
                            'Your heart pounds as the twisted figures close in. Grabbing a broken chair leg, you brace yourself for their attack. Their movements are slow but unrelenting, and the air thickens with the scent of decay.',
                            CHAR(10),
                            'The first figure lunges, its claws slashing through the air. You strike it, splintering your weapon and sending the creature staggering back. But there are too many. Their glowing eyes burn with an otherworldly hatred.',
                            CHAR(10),
                            'In the chaos, you spot a glimmer of light—a chance to escape through a cracked window. The whispers scream in protest as you weigh your next move.')),

# Chapter 26
    (26, 'The Pact', CONCAT(
                        'Holding the pulsating orb in your hands, you feel its power coursing through your veins. The whispers coalesce into a singular voice, smooth and persuasive:',
                        CHAR(10),
                        '_“You seek answers, strength, freedom. I can give you all of this. But every gift demands a price. Bind yourself to me, and the truth shall be yours.”_',
                        CHAR(10),
                        'The orb’s glow intensifies, and for a moment, you see visions of yourself commanding the house, its secrets bending to your will. But behind the visions lies a shadow—a sense of eternal servitude.',
                        CHAR(10),
                        'The choice hangs heavy: take the power and bear its curse, or reject it and face the unknown.'));


INSERT INTO `endings` (`title`, `content`)
    VALUE
    # Ending 1
    ('The Safe Path (or So You Think)', CONCAT(
                                               'You stand there for a long moment, the weight of the mansion''s silence pressing down on you. The invitation, the promises of answers, all of it feels distant now, like a cruel joke. You’re overwhelmed by the foreboding atmosphere, the sense that you’re being watched by something unseen.',
                                               CHAR(10),
                                               'Maybe it’s better not to know. Maybe you’re not ready for whatever lies within these walls.',
                                               CHAR(10),
                                               'You turn and walk back toward the door, the feeling of dread intensifying with every step. As you step outside, the cold night air feels almost like a relief, and you breathe in deeply, letting the familiar scent of the outside world calm your racing heart.',
                                               CHAR(10),
                                               'You reach your car, fumble with the door handle, and climb in, slamming the door shut behind you. Your hands tremble as you start the engine, the sound of the car’s engine hums in your ears, a welcome sign of safety. You drive off, glancing in the rearview mirror to see the mansion fading into the distance, swallowed by the storm.',
                                               CHAR(10),
                                               'The mansion stands behind you, silent once more. Its windows, like empty eyes, stare out into the fog. You turn your back on it, telling yourself that you’ll never return.',
                                               CHAR(10),
                                               'But as you drive away, a strange emptiness lingers. The answers you sought remain hidden, locked away in the mansion, and you can’t shake the feeling that you’ve left something behind—something important. Maybe it’s better this way, but you can’t help but wonder what would have happened if you had stayed.',
                                               CHAR(10),
                                               'As the mansion fades into the distance, you can’t shake the feeling that it’s not done with you yet.')),

# Ending 2
    ('The Abandoned Quest', CONCAT(
                                   'As the shadows deepen and the air thickens with unseen malice, fear grips you. This house, its secrets, and its curses are not meant for you to uncover.',
                                   CHAR(10),
                                   'You turn away, your breath quickening as you flee back through the corridors and out into the cold night. The whispers fade behind you, but their echo lingers in your mind.',
                                   CHAR(10),
                                   'Even as you stand outside the mansion’s towering facade, you feel its presence watching you, judging you. The relief of escape is short-lived, replaced by a growing emptiness.',
                                   CHAR(10),
                                   'The weeks that follow are restless. Shadows flicker at the edges of your vision, whispers greet you in silent rooms, and the weight of what you left behind gnaws at your soul. You avoided the unknown, but at what cost?')),

# Ending 3
    ('Liberation', CONCAT(
                          'You grip the dagger tightly, your hands trembling as you aim it at the orb. The whispers rise to a deafening crescendo, begging, threatening, pleading:',
                          CHAR(10),
                          '_“Destroy us, and you destroy yourself! The house will not let you leave!”_',
                          CHAR(10),
                          'With a shout, you plunge the blade into the heart of the orb. A blinding light erupts, and the shadows scream as they are pulled toward the orb, devoured by the light.',
                          CHAR(10),
                          'The house shakes violently, its walls cracking, its very foundation crumbling. You feel a searing pain in your chest as the energy courses through you, threatening to tear you apart.',
                          CHAR(10),
                          'Finally, the light fades. The house falls silent, its oppressive aura gone. You stumble outside, collapsing onto the grass as the mansion behind you collapses into rubble.',
                          CHAR(10),
                          'You are free, but the ordeal has left its mark. Shadows still haunt your dreams, and you can’t shake the feeling that a part of the house remains within you.')),

# Ending 4
    ('The New Master', CONCAT(
                              'The orb’s warmth is intoxicating as you raise it above the altar. The whispers become a singular, triumphant voice:',
                              CHAR(10),
                              '_“You have chosen well. The house is yours to command.”_',
                              CHAR(10),
                              'The orb dissolves into your hands, and a wave of power washes over you. Visions flood your mind—the lives of those who came before, the secrets buried in the house’s walls, and the immense power you now wield.',
                              CHAR(10),
                              'But with the power comes chains. You feel them tightening around your soul, binding you to the house. The shadows bow to you now, but their servitude comes at a price: your freedom.',
                              CHAR(10),
                              'The house is alive again, its halls bending to your will. You are its master, but its prisoner as well, condemned to guard its secrets for eternity.')),

# Ending 5
    ('Eternal Loop', CONCAT(
                            'You stand frozen before the altar, the dagger and orb lying untouched. The whispers swirl around you, mocking and deriding:',
                            CHAR(10),
                            '_“Weak. Unworthy. You had the tools, yet you chose nothing. A soul adrift, a fool lost to fear.”_',
                            CHAR(10),
                            'The shadows close in, their forms coiling tighter. The air thickens, and the room begins to warp. You stumble, falling to your knees as the darkness envelops you.',
                            CHAR(10),
                            'The house consumes you, your mind unraveling as you become one with its walls, its whispers. Your memories fade, and your essence is scattered among the countless souls trapped here.',
                            CHAR(10),
                            'One day, another wanderer will enter the mansion. And when they do, you will be among the voices calling to them, a shadow of what you once were.')),

# Ending 6
    ('A Warrior’s End', CONCAT(
                              'The twisted figures close in, their glowing eyes filled with malice. Despite the odds, you refuse to back down. You clutch the broken chair leg tighter, your breath ragged but determined.',
                              CHAR(10),
                              'With a roar, you swing wildly at the nearest figure, splintering its form. It collapses into a heap of shadowy mist, but two more take its place.',
                              CHAR(10),
                              'Every strike feels heavier, your arms burning with exhaustion. The whispers grow louder, mocking your efforts:',
                              CHAR(10),
                              '_“Foolish... stubborn... a pointless fight against the inevitable.”_',
                              CHAR(10),
                              'One by one, you take them down, but they keep coming, endless and unrelenting. You scream in defiance, standing your ground even as the shadows overwhelm you.',
                              CHAR(10),
                              'Your vision blurs, the edges darkening as the weight of the battle takes its toll. In your final moments, you see a faint light piercing the darkness—a symbol of your courage and resolve.',
                              CHAR(10),
                              'The shadows hesitate, as if recognizing your strength, before consuming everything in their path.'));


INSERT INTO `choices` (`chapter_id`, `text`, `next_chapter_id`, `ending_id`)
VALUES
    (1, 'Enter the mansion', 2, NULL),
    (1, 'Leave and go back home', NULL, 1),

    (2, 'Climb the grand staircase', 3, NULL),
    (2, 'Explore the dark hallway', 4, NULL),
    (2, 'Investigate the living room', 5, NULL),

    (3, 'Continue to the master bedroom', 6, NULL),
    (3, 'Investigate the strange markings on the wall', 7, NULL),
    (3, 'Go back downstairs', 2, NULL),

    (4, 'Open the door at the end of the hallway', 8, NULL),
    (4, 'Check the other doors along the hallway', 9, NULL),
    (4, 'Go back to the stairs', 3, NULL),

    (5, 'Examine the painting more closely', 10, NULL),
    (5, 'Enter the room beyond the door', 11, NULL),
    (5, 'Return to the hallway', 4, NULL),

    (6, 'Open the locked box', 12, NULL),
    (6, 'Search the room for anything else', 13, NULL),
    (6, 'Leave the master bedroom and go downstairs', 2, NULL),

    (7, 'Touch the glowing markings', 14, NULL),
    (7, 'Leave the hallway and explore other rooms', 9, NULL),

    (8, 'Remove the black cloth', 15, NULL),
    (8, 'Leave the room and close the door', 4, NULL),

    (9, 'Approach the mirror', 16, NULL),
    (9, 'Search the room for something useful', 17, NULL),
    (9, 'Leave the room and try another door', 9, NULL),

    (10, 'Remove the painting from the wall', 18, NULL),
    (10, 'Step back and leave the living room', 5, NULL),

    (11, 'Take the lamp', 19, NULL),
    (11, 'Extinguish the flame', 20, NULL),
    (11, 'Leave the room', 5, NULL),

    (12, 'Force the lock open', 21, NULL),
    (12, 'Leave the box and search the room further', 13, NULL),

    (13, 'Use the keys to open the trapdoor', 22, NULL),
    (13, 'Leave the room and ignore the trapdoor', 9, NULL),

    (14, 'Push forward and explore further', 8, NULL),
    (14, 'Flee to the ground floor', 2, NULL),

    (15, 'Take the key', 23, NULL),
    (15, 'Leave the mirror and back away', 11, NULL),

    (16, 'Follow the blood trail', 22, NULL),
    (16, 'Leave the room and avoid the hallway', 9, NULL),

    (17, 'Take the journal and key', 23, NULL),
    (17, 'Put the journal back and close the drawer', 15, NULL),

    (18, 'Take the dagger and leave the passage', 24, NULL),
    (18, 'Leave the passage without disturbing the altar', 13, NULL),

    (19, 'Take the lantern and explore further', 24, NULL),
    (19, 'Leave the lantern and retreat to safety', 2, NULL),

    (20, 'Fight the figures with whatever you can find', 25, NULL),
    (20, 'Flee and try to escape the room', 16, NULL),

    (21, 'Take the orb and accept its power', 26, NULL),
    (21, 'Close the box and leave it untouched', 12, NULL),

    (22, 'Take the locket and follow the cry', 23, NULL),
    (22, 'Leave the locket and seal the floorboards', 9, NULL),

    (23, 'Open the massive door', 24, NULL),
    (23, 'Turn back and leave the mansion', NULL, 2),

    (24, 'Use the dagger to destroy the orb', NULL, 3),
    (24, 'Take the orb and complete the ritual', NULL, 4),
    (24, 'Refuse to act and leave the altar untouched', NULL, 5),

    (25, 'Fight until the end', NULL, 6),
    (25, 'Escape through the window', 16, NULL),

    (26, 'Accept the pact and take the orb’s power', NULL, 4),
    (26, 'Reject the pact and destroy the orb', 24, NULL);