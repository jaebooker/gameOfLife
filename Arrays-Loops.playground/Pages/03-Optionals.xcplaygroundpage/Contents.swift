/*:
 ![Make School Banner](./swift_banner.png)
 # A Quick Detour: Optionals

 ## Empty variables

 You might have been wondering how to set an array element to be _empty_. After all, arrays are like buckets of data: why can't one of the buckets be empty? Let's take a step back from arrays for a moment and talk about _optionals_.

 _Optionals_ are a feature in Swift that allow pieces of data to be empty. Swift provides a very special value – one that represents nothingness, or the absense of data: `nil`. Optionals are like boxes that may have something inside, or they may have nothing inside (`nil`).

 - note: `nil` is also commonly referred as `null` in other programming languages. Swift is much more strict about when variables can lack a value, and this is very helpful in avoiding bugs where we think we have a value when in fact we don't. Functions can even return an optional to indicate when the operation has failed or they have no value to give back to you.

 ## nil

 Any variable in Swift can be set to `nil`, if it is declared as an _optional_ type.

 */

var mightContainCharacter: Character? = nil

/*:

 We express the fact that a value is of optional type by putting a question mark (`?`) at the end of the type name. For example, here is how we declare a variable of type `Int?` (read as "optional `Int`"):
 */

var maybeAnInt: Int? = 15

//: Here, we have expressly given the variable a value of 15, but we could just as easily have assigned it `nil`:

maybeAnInt = nil

/*:

 Now `maybeAnInt` is `nil`, which is to say it has _no value_. If `maybeAnInt` had just been of type Int (no question mark), we could not have set it to `nil`.

 ## Unwrapping an Optional

 When we retrieve the value from an optional, we call that "unwrapping" it. This is like opening the box and seeing whether there's anything inside. We can test whether an optional has a value by comparing the whole thing to `nil`. If it is not equal to `nil`, it contains a value. Woo hoo!

 We can then safely use **force unwrapping** to get its value. Force unwrapping is done by putting an exclamation point (`!`) after the name of the variable we want to unwrap. This assures Swift that the optional contains a value and that it is therefore safe to read. If we're wrong, the code will crash. Here, we test whether `maybeAnInt` has a value and if it does, we rip open the box (force unwrap) and print its value.

 */
maybeAnInt = 0
if maybeAnInt != nil {
    print("maybeAnInt contains a value, and it is \(maybeAnInt!)")
} else {
    print("maybeAnInt does not contain a value")
}

/*:

 - experiment: Try changing the value of `maybeAnInt` from `nil` to something else above. Notice which message is printed depending on the value. Make sure to change it _above_ the conditional!

 ## Optional Binding

 A more compact way of testing and acting on an optional value is **optional binding**, where we test for the presence of an object and, if it exists, we create a new variable for this object in a narrower scope. Here, we "bind" the value of `maybeAnInt` (if present) to a new constant named `definitelyAnInt`, which only exists inside the `if/else` block, and print it:

 */

if let definitelyAnInt = maybeAnInt {
    print("maybeAnInt contains a value, and it is \(definitelyAnInt)")
} else {
    print("maybeAnInt does not contain a value")
}

/*:

 - experiment: Try changing the value of `maybeAnInt` again, and again take note that if it contains a value, the message indicates this and the local variable `definitelyAnInt` has the same value. If it doesn't contain a value, then `definitelyAnInt` won't be created.

 - important: It is common practice to unwrap optionals to the same variable name. It is only unwrapped _inside_ the if-statement and becomes an optional again outside of the if-statement.

 ## Implicitly Unwrapped Optionals

 Sometimes we want to indicate that an optional will always have a value when we need it. For example, this happens when we separate the declaration of an optional from the first time we set its value. The first time we declare the optional, it won't have a value, but we'll set it before we use it. To support this scenario, we can declare a variable as an **implicitly unwrapped optional**. Implicitly unwrapped optionals are declared by placing an exclamation point (`!`) after the type to indicate that they **can** contain `nil`, but must always have a value when they are read:

 */

var alwaysAString: String! = nil

/*:

 Notice that we initially assign `nil` to this implicitly unwrapped optional `String`. If we were to try to use it at this point, we would trigger a runtime error:

 */

//let stringLength = alwaysAString.characters.count

/*:

 - experiment: Try uncommenting the line above and seeing what happens. You will probably notice that the remainder of the Playground can no longer be evaluated. This is because the underlying process crashes when it attempts to access the variable. That's why we have to ensure that we never read an implicitly-unwrapped optional before setting its value.

 Let's assign a value so the variable is no longer `nil`:

 */

alwaysAString = "Now I have a value!"

//: Now, when we print this string, it is implicitly unwrapped to the `String` value it contains:

print(alwaysAString)

/*:

 The important takeaway here is that declaring a variable as implicitly unwrapped allows Swift to _automatically_ unwrap the value whenever it is used. This is the inverse of the usual situation: normally, we use the `!` to force-unwrap a value once we're sure it contains a value. With implicitly unwrapped optionals, we assert from the moment we declare the variable that it will _never_ be `nil` when we use it. That can save us a lot of typing (and visual clutter!) for variables that are accessed frequently. But it's important to be 100% sure that the variable is assigned before it's read the first time, because otherwise accessing it will result in crash.

 ## Calling methods on Optionals

 In order to call methods on optionals, you must first give Swift something that is non-optional, either through an implicitly unwrapped optional or by force unwrapping the optional where the method is called. Directly accessing an optional causes a compile-time error. Uncomment the following line to see:

 */

//let intDescription = maybeAnInt.description // Value of optional type 'Int?' not unwrapped!

/*:

 But we're programmers and we like working around the rules. You don't have to give Swift a non-optional if you use a technique called **optional chaining**. Chaining allows you to try to call a method on an optional. It will call the method if the optional has a value, and returns `nil` if it does not. Chaining is performed by placing a question mark between the variable name and the dot, parenthesis, or bracket that follows it:

 */

let optionalArray: [Int]? = [ 1, 2, 3, 4 ]
let arrayLength = optionalArray?.count
let firstElement = optionalArray?[0]

/*:

 Placing a `?` after the name `optionalArray` will cause Swift to check whether the variable is `nil` before attempting to call `count` or access the array. The types of these expressions are optionals of the same type as the return type of method (so the call to `count`, which normally produces an `Int`, produces an `Int?` in this case). Phew! Still with us?

 - experiment: Set `optionalArray` to `nil` and observe how the output values change.

 ## The Nil Coalescing Operator

 Sometimes we want to use a default value in the place of an optional when it turns out to be `nil`. For example, we might want to provide a placeholder name for an object when its own `name` property is `nil`, or use 0 if an integer is `nil`.

 Swift provides a way to do this very compactly: the nil-coalescing operator (`??`). When the optional to the left of the operator has a value, that value becomes the value of the expression. When the optional is `nil`, the value of the expression is the value on the right of the operator. Let's look at an example:

 */

let optionalString: String? = nil
let petName = optionalString ?? "Fido"

/*:

 So if `optionalString` is not nil, we'll set `petName` to the value of `optionalString`. If it is nil, we'll set `petName` to "Fido".

 ## Recap

 We have looked at some of the capabilities of optionals in Swift. Optionals are a fundamental part of Swift that allow us to be very clear about when variables contain values and when they do not. All of the rules associated with optionals can be confusing at first, but you will quickly gain an intuition by putting your knowledge into practice. The compiler will try to help you along the way, reminding you when you make mistakes.

 - important: When working with optionals, try to prefer _optional binding_ (`if let`) and _optional chaining_ (`?`) instead of using _nil checks_ (`!= nil`) and _force unwrapping_ (`!`).

 When you're done, click Next to move on.

*/
//: [Previous](@previous) | [Next](@next)
