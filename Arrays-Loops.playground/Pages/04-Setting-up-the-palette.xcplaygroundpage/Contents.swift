/*:
 ![Make School Banner](./swift_banner.png)
 # Setting up the palette

 ## Back to arrays

 `nil` is going to be handy in order to represent empty buckets in our palette of Characters, but first we need to modify our `palette` variable to be of the right type. Now instead of being an array of `Character`s, our palette is going to be an array of `Character` optionals:

 */

var palette: [Character?] = []

/*:

 - callout(Challenge): Using our newfound knowledge of for-loops and Optionals, set the palette to an array of size 8:

    - Make the first 5 elements are set to "🐱"
    - Make the remaining 3 elements empty (`nil`).

    The display on the right will tell you if your array is correct: if any of your cells light up red, that's an incorrect value! Refer back to the previous pages if you need a refresher on syntax.

 */
var palettes: [Character?] = ["🐱","🐱","🐱","🐱","🐱", nil, nil, nil]





























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
scene.setup(simulation: EmptySimulation(), palette: palette)
scene.scaleMode = .aspectFill
sceneView.presentScene(scene)
scene.setup(solutionSim: EmptySimulation(), solutionPalette: solutionArray())
PlaygroundPage.current.liveView = sceneView
