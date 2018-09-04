/*:
 ![Make School Banner](./swift_banner.png)
 # An Introduction to Arrays

 Arrays are your first foray into dealing with _collections_ of data. So far, you know how to store single values into variables and constants, using `let` and `var`. But what if you wanted to store lots of data, without declaring a variable or constant for each piece?

 Arrays help you solve this problem, by providing you with an _ordered list_ of elements. You can picture arrays as a line of buckets available for you to store your data.

 ![](array.jpg)

 In this tutorial, you'll learn how to set up your own arrays, and _iterate_ through each of the elements using _for-loops_. Also in the process, you'll code a famous game called __Conway's Game of Life__!

 # Conway's Game of Life

 ![](not-game-of-life.png)

 No, not that one!

 ![](gol.png)

 Conway's Game of Life not quite a game. It's [_cellular automaton_](https://en.wikipedia.org/wiki/Cellular_automaton) –- one that depicts the life and death of cells on a two-dimensional grid. Each cell can be turned either on or off. The cells multiply and die off according to the state of their neighbors, a lot like spreading bacteria or microorganisms.

 The grid of cells starts out in a configuration of alive and dead cells. On each step or _generation_, the cells are updated according to the following rules:

 - Count the alive neighbors surrounding the cell
 - For living cells:
    - If the cell has _less than_ 2 neighbors, it dies of underpopulation
    - If the cell has 2 or 3 neighbors, continues living
    - If the cell has more than 3 neighbors, it dies of overpopulation
 - For dead cells
    - If the dead cell has _exactly_ 3 neighbors, it becomes living via reproduction!

 While these rules seem pretty basic, they lead to some amazing emergent behaviors. Lo and behold, some of the phenomena found in Conway's Game of Life:

 - callout(Pulsar): ![](Game_of_life_pulsar.gif)
 */
/*:
 - callout(Glider): ![](Game_of_life_animated_glider.gif)
 */
/*:
 - callout(Glider Gun): ![](Gospers_glider_gun.gif)

 Click the Next button, and we'll be on our way to creating Conway's Game of Life!

*/
//: [Next](@next)
