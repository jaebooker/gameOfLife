/*:
 ![Make School Banner](./swift_banner.png)
 # Array Basics

 In order to make our Game of Life simulation, we will first need to create a "palette" for the different kinds of `Characters` that the user will be able to place on the grid cells. We will be using a one-dimensional array to store this pallete.

 In many ways, you already know how to manipulate array variables. They behave similarly to normal variables. Shown below is a standard way to initialize an _empty_ array, using `let`.

 */

let palette: [Character] = ["🐱", "😀", "😜"]

/*:

 - note: A `String` is made up of `Character`s. A `Character` is just a single element `String`! It cannot store more than one letter/number/special characters. An `Array` can hold any data type as long as every element in it is the same data type! We'll be working with `Array`'s holding `Character`s most of this playground.

 ## Declaring Arrays

 The _data type_ of this palette variable is `[Character]`. This translates to "an _array_ of _Characters_." You can make arrays of anything, including arrays of `String`s, arrays of `Int`s, or even arrays of _arrays of_ `Character`s (we'll get there soon).

 The `palette` variable is initialized to the empty array, denoted by `[]`. In order to represent a _literal representation_ of an array, you list 0 or more comma-separated values, enclosed within square brackets.

 - callout(Try it out): Try overwriting the empty array literal (right of the equals sign in the code above) with the array below. This represents three `Character` elements, enclosed within an array. Watch how the palette appears to reflect your changes!

    `["🐱", "😀", "😜"]`

 - important: You open up an emoji keyboard by pressing `control + command + space`. Do not forget the `"` around the emoji characters!

 ## Indexing

 Now that we have 3 elements the `palette` variable, how do we retrieve those elements? Enter the _subscript_ operator:

    palette[0]

 In order to retrieve an _element_ of an array, you _postpend_ the variable with brackets containing the _index_ number of the element you wish to retrieve.

 - important: Array indices start from 0 and end with 1 less than the number of elements in it!_ So in this example, `palette[1]` will return the _second_ element in the array, and `palette[3]` will yield an __error__.

 The below image shows how an example array might be initalized, with the indices to the elements shown above each cell:

 ![](array.jpg)

 */

let exampleArray = [2, 5, 1, 3, 4]
exampleArray[0]
exampleArray[1]
exampleArray[2]
exampleArray[3]
exampleArray[4]

/*:

 ## Subscript assignment

 - callout(Try it out): In addition to retrieving elements from the array, you can also assign to elements with the _subscript operator_. It looks exactly like a normal assignment statement.

    `palette[0] = "😜"`


 */



/*:

 ### That didn't work!

 The above code won't work without some changes, though.

 - important: We originally delcared the palette variable using `let`. This made it a constant or _immutable_ array. Just like normal `let` constants, if you create an array using `let`, you won't be able to change anything _inside_ it. In order to overcome this, change your `let` declaration to a `var`.

 Now, you can try setting element 0 of the array to 😜. The first and third elements of the array should now both be set to "😜".

 */
var palettey: [Character] = []
palettey[0] = "😜"
palettey[1] = "😜"
palettey[2] = "😜"
/*:

 ## Appending

 What if you want to _insert_ an element, changing the size of an array? `palette[3] = "🐱"` won't work, since accessing an array beyond it's bounds causes an error. This is where `append()` comes in!


 - callout(Try it out): Try running this code.

    `palette.append("🐱")`

 Now, a new "🐱" character has been tacked on to the back of the array, and it's size has increased by one.

 - note: You can verify that the size of the array has changed, by checking its `count` property:

    `palette.count`

 This will return how many elements there are in the array. It'll come in handy later!

 Try it out in the working space below.

 */
palettey.append("🐱")



/*:

 - note: The syntax for getting the number of elements in an array is _not_ a function -- it doesn't have parenthesizes! `count` is a _property_ or variable that belongs to an array. You access it using _dot syntax_ as you saw above.

 ## For Loops

 So far, we've been operating on elements one at a time. What if we wanted to do the same operation multiple times, or wanted to replace the entire contents of the array? Re-enter the `for loop`... Do you remember it from `drawPolygon`?

    for index in 0..<5 {
        palette.append("😈")
    }

 */
for _ in 0...4 {
    palettey.append("😈")
}


/*:

 If you run it, you'll see that _five_ new 😈's have been appended to the back of the array, meaning that the code in the curly brackets ran 5 times! This is the magic of the _for loop_.

 The above for loops, translated to English works as follows

 - Set `index` to 0
 - While `index` is _less than_ 5, run the enclosing code. After each run, _increment_ the `index` variable by 1

 The variable `index` in this example was set to `0` on the first iteration, `1` in the next iteration, and so on... This might prove useful!

 - important: Did you spot the difference from last time we used `for-loops`? This time we have a counter variable called `index`. We are also starting at `0` and using `..<` instead of `...` -- `..<` means up to _but not_ including the final number while `...` means up to _and including_ the final number. You can read `0..<5` as _zero to five non-inclusive_. `0...5` reads as _zero to five inclusive_.
 */
/*:
 - callout(Try it out): Remember `palette.count`? It told us how many elements there are in the array. Let's try replacing 5 with that, and use the _subscript assignment_ operator to set the element corresponding to that index with 👾.

 */
palettey[palettey.count] = "👾"




/*:

 Congrats, you've learned how to set all the elements to a new value!

 ## More for-loops

 Here are more variations on the for loop you just learned.

    for index in 0...5 {
        // do something
    }

 This version of the for loop uses `...` instead of the `..<` found previously. This means that the for loops from 0 to 5, _inclusively_ – that is, _including_ the 5. That means that the loop will iterate for a total of 6 times!

 - important: Be careful when using `...` to iterate over arrays. Array indices always go from 0 to _1 less than_ the `count` of the array. So the following code would cause an __error__:

        for index in 0...palette.count {
            palette[index] = "😈"
        }

 ## for-in loops

 So far we've been iterating with for loops using integers, but you can actually use arrays directly to retrieve all the elements of the array:

    for element in palette {
        // element is now a variable containing a Character
        // loop code here
    }

 This is equivalent to:

    for index in 0..<palette.count {
        let element = palette[index]
        // loop code here
    }

 - note: We will not be using this syntax right now since we need the index of the array in order to update the elements, but this might be useful in the future.

 Press Next to go on!

*/
//: [Previous](@previous) | [Next](@next)




















/*:
Don't worry about this code. It handles the display.
*/
import PlaygroundSupport
import SpriteKit
let size = CGSize(width: 320, height: 568)
let sceneView = SKView(frame: CGRect(origin: CGPoint.zero, size: size))
sceneView.wantsLayer = true
let scene = SimulationScene(fileNamed: "SimulationScene")!
scene.setup(simulation: EmptySimulation(), palette: convertToOptional(palette))
scene.scaleMode = .aspectFill
sceneView.presentScene(scene)
PlaygroundPage.current.liveView = sceneView
