# W-G-parts
A repo to contain the OpenScad code for Willcox & Gibbs chain stitch sewing machine

## Printable Parts
- drive wheel adapter: fits around the drive wheel and moves the belt channel from the machine side to the outside. Part presses into place with a snap and is friction fit.
- gantry: holds the axle for the hand wheel in position above the drive wheel
- hand wheel: hand wheel
- spool holder: replaces the spool holder
- spool holder pin: holds the spool pin in place

## Unprintable Parts
- M8 machine bolt, 2 washers, and nut
- skateboard bearing
- drive belt (I cut one to size from a Singer leather belt)
- 4 x #8 wood screws (1/2 or 3/4 inch)
- plank or board to put it on

## Ancillary Files
- You will need the [BOLSI2](https://github.com/revarbat/BOSL2/) library
- You will also need my ShapesNPaths library to render this code
- raw points: contains the handcrafted points from which to derive the gantry
- modeled points: contains the modeled points for the gantry
- fitscript: contains the python script that models the points to create a smooth curve

### TODO
- improve fit of drive wheel adapter
- clean up files so that they all use the ShapesNPaths library
- add constants file
