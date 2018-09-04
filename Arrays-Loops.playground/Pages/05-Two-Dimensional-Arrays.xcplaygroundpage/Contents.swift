/*:
 ![Make School Banner](./swift_banner.png)
 # Two dimensional Arrays

 You might have noticed we haven't shown you how build a 2D grid of cells. We'll need one for Game of Life so let's get started!

 When we introduced arrays, we said that arrays can represent a list of _any_ type. What if... a variable was initialized to be an array of _arrays_?

*/

var grid: [[Character?]] = []

/*:

 That's right. The double brackets mean that `grid` is a variable of type "`Array` of `Arrays` of `Character` optionals". This is just a convoluted way of saying a "2D grid of optional `Character`s". And just like in previous examples, we can append values to `grid`. The only difference is those values have to be of type `[Character?]`!

 - callout(Try it out):

        let column = [Character?](repeating: nil, count: 10)
        grid.append(column)
 */
/*:
 - note: The initializer for column is a special _constructor_ syntax that lets you quickly set an array with a count of repeated values.

 
 We now have a column of empty cells!
 */
/*:
 - callout(Challenge): Try utilizing some for-loop logic to append 8 of these empty columns to make a 8x10 grid.

*/
var column = [Character?](repeating: nil, count: 10)
for _ in 0...7 {
    grid.append(column)
}




/*:

 Indexing from a 2D grid is simple: You simply use the subscript operator twice – once for the outer array, and then again for the array inside that indexed outer array. In this example, this translates to x and y coordinates of the grid.

    grid[1][2] = "🐱"

 This would modify the cell at the _second column_ and _third row_ of the grid.

 - experiment: Use this syntax to make yourself a nice pattern of `Character`s on your new 8x10, two dimensional grid!
*/
/*:
 - important: grid[0][0] represents the bottom-left corner.

*/
grid[0][0] = "🤬"
grid[0][1] = "🤬"
grid[1][0] = "🤬"
grid[0][2] = "🤬"
grid[4][4] = "👻"
grid[4][3] = "👻"
grid[4][2] = "👻"
grid[4][1] = "👻"
grid[4][0] = "👻"
grid[4][6] = "👻"
grid[7][6] = "🔪"
grid[7][8] = "🐒"
grid[7][7] = "🚬"
grid[7][5] = "💉"

//: - important: Remember that `Array`s are zero-indexed in Swift. `[0]` represents the first value!
//:
//: [Previous](@previous) | [Next](@next)




























/*:
Don't worry about this code. It handles the display.
*/
import PlaygroundSupport
import SpriteKit
let size = CGSize(width: 320, height: 568)
let sceneView = SKView(frame: CGRect(origin: CGPoint.zero, size: size))
sceneView.wantsLayer = true
let scene = SolutionOverlaySimulationScene(fileNamed: "SimulationScene")!
let palette: [Character?] = ["🐱", "🐱", "🐱", "🐱", "🐱", nil, nil, nil]
let sim = Simulation()
sim.grid = grid
scene.setup(simulation: sim, palette: palette)
scene.scaleMode = .aspectFill
sceneView.presentScene(scene)
PlaygroundPage.current.liveView = sceneView
