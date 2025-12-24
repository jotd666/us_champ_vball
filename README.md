"# us_champ_vball" 
remake of US Championship V'ball for Amiga (AGA & ECS)

Requires a 2-button joystick, or the keyboard

Features:

- 25/50 FPS for ECS and AGA amigas
- 32 color ECS version (faster on AGA, using faster fetch mode in that case)
- 64 color AGA version (for classic amigas)
- 128 color AGA version (for really fast amigas. A bit slow on 68060/50 but runs)

Notes:

- You need a hard drive, whdload and some fast memory to run this game.
- The main optimization is to avoid drawing the net sprite all the time. It is
  drawn in the main background so it's part of the background. If
  they were drawn all the time the game FPS drops, so it's drawn only on screen
  change and when right team is right behind it (else the players would appear in
  front of it even if they're behind and it would look bad!). This was pretty hard
  to finetune but worth doing.
  
Credits:

- jotd: reverse-engineering, 68000 transcode, graphics conversion
  sound conversion for the Amiga.
- no9 (soon): music
- PascalDe73: icons

Instructions:

5/fire when not playing: insert coin
1/2/joy up/down when not playing: start game
arrows/joystick: move
red/ctrl: hit ball
blue/alt: jump/increase spike power

Cheat keys:

F1: left side gets 9-0 (or 6-0 in 7-point match)
F2: right side gets 9-0
F3: left side wins immediately

How to play:

Serve: either just push "hit" then "hit" again for normal serve (takes more time, can be countered by good opponents)
or choose a jumping serve. Push "hit", "jump", then "hit" again for a more powerful & fast serve. I think left/right
controls the strength of the serve too.

Defence: jump in front of spike attacks. The player you control gets a "1P" or "2P" flashing sign over him.

Attack: receive ball, the CPU helps and makes a pass, then jump (jump several times to increase power) and hit to spike.
If you miss, you can still bounce back the ball to the other side. I think (not sure) that changing directions while
hitting the ball allows to control it more.

Spike red power can stun the player who tried to receive it. Time the spikes properly to get better chance of opponents not
succeeding into sending it back or attacking. If the opponent gets stunned, it is possible that the other opponent player
sends the ball without attacking. You can attack again, but you lose time.