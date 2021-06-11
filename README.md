# APCSFinalProject
Group Name: LemonMelody
Group Member Name(s): Eric Shi

Description:
This project aims to replicate the game Color Switch. It will be built using Java and Processing. 
The player will control a ball and move it through colorful obstacles. 
Objective to get as high up as possible.
If the ball touches a color that doesn't match the color of the ball, or falls to the bottom, game over.

Directions: 
Run Processing on ColorSwitch.pde (no special directions)
Tap space bar to control bouncy
Tapping spacebar below the white nubs will keep bouncy without moving up 
Exit and run Processing again when game over (no restart key)


Prototype:
https://docs.google.com/document/d/10KbxMqSa_gOEJyjHFpI2dbCwmRtbEQIf1Z4vg9vsY6Q/edit?usp=sharing


Log:
5/25
-Start of project & commit
5/27
-Laid out barebones files + method headers
-Mostly working on design elements and UML
5/30
-Deleted files, ran into problems with Processing not recognizing the classes
5/31
-Added back files, no more errors with processing now
-Still working on design layout
6/1
 -Worked on skeleton
 -Added in the constructors
 -Took most of time to learn about inheritance
 -Basic set up layout

6/2
-APUSH exam, didn't work on project
6/3
-Took day to make most of the elements actually run
-Bouncy now bounces and can fall into void
-Bouncy changes color when it touches food (should probably delete food too)
-Obstacles scroll, really basic generation (random)
-Recognizes game over when bouncy falls / touches wrong color
-Pretty much threw out the parent class because the instance variables didn't update. 
 So like getX() function got the value from when it was first created in the constructor
 Changing X in the subclass didn't change what I got from getX()
-Need to work on the parent class stuff later, decided it wasn't worth it right now

6/4
-Score counter added at top left
-Food disappears when eaten
-Obstacles generate randomly (based on very low chance)
-Bouncy bounces on invisible platform until game starts

6/7
-Made generation more stable, only creates obstacle if there's space 
-Same for food
No longer bc of an incredibly low chance
-White nubs on edges indicate where Bouncy can hover without scrolling obstacles down
-Experimenting with how to create more complex obstacles
-Polar coordinates to move obstacles (rotate them better)
-To do would be refining that.

6/8
-Method to create circular arrangement of obstacles
-Tried different ways to make arrangements using the "lego pieces (obstacles)"
-Game over screen

6/9
-Added polar coordinates option to obstacles so they can rotate about a point
-Created otating ring and plus sign obstacles

6/10
-Added new arrangements & tweaked old ones to make them more doable
-Double rings, etc