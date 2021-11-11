# Critical Overview

# Part 1
In Part 1 of the assignment, we modified the grammar in LambdaNat1.cf to account for ENat0, and ENatS using two different cases for evalCBN and subst. We did this by modifying some of the available code in the Interpreter and testing different cases until we were satisfied with our answer. 

Our only difficulty in this part was understanding how the evaluation of EApp works. All 3 of us were confused on why the evaluation function was designed the way it was, which made future progress confusing. We eventually understood that EApp was created entirely to evaluate from the left of the function tree first.

# Part 2
In Part 2 of the assignment, we were tasked with implementing if, let, and minus-one functions. In the program they were called EIf, ELet, and EMinusOne. EIf and EMinusOne were simple, as EIf was just translating the 4 parameters into a Haskell if-then-else statement, and EMinusOne just removed one S from a natural number chain, or returned O since we could not reach negative numbers.

Our difficulty for part 2 was brief, as we struggled to implement ELet. We eventually realized that this is just substitution, and that we had already implemented substitution in another way; Lambda-Calculus. At this point we quickly translated ELet to a lambda evaluation

# Part 3
### Task 1
Part 3 followed a similar suit for Task 1. Here we had to implement evaluation functions for lists and list functions. We assumed that Nil '#' was just the end of list and should be ignored rather than evaluated. We then assumed that ECons will follow similarly to how we constructed natural numbers in the past, where we would separate the head and tail and evaluate them individually. With this head/tail deconstructing nature of evalCBN, we could easily make EHd and ETl functions by picking out which part of the evaluation we wanted for each function. In the case of taking a head or tail out of en empty list (#), we omitted a case for such list to create the desired error "Non-exhaustive patterns".

Finally we were also asked to implement a less-than function. We read that this should strictly be used for comparing integers, so we left out any cases for comparing non-integers. We had a hiccup figuring out how to actually compare the integers to return a True/False value, but eventually discovered that we could nest another case statement to easily convert True/False to 1/0.

### Task 2

Task 2 in part 3 was to create a few programs in the LambdaNat interpreter. 

The first program was `member`, which was simple to figure out because we have become very familiar with recursion. 

`Remove` was a bit trickier because it was not immediately intuitive to evaluate the head and recursively inspect the remaining tail, because instinct brought us to look for a solution with iteration over each list item.

`Sum` was also simple, as we remembered that the end of any list should be #. We were asked to explain sum `x:2:3:4:#` and sum `1:2:3:x:#`
    - `x:2:3:4:#` => `x + 9` because x cannot be evaluated in terms of integers, so the result will be `x + (tl 2:3:4:#)`, which evaluates to `x + 9`
    - `1:2:3:x:#` => `1 + (2 + (3 + (x + 0)))` because x is evaluated last before `#`, thus resulting in `x + 0`. `x + 0` cannot compare to `3`, so its best reduction is `3 + (x + 0)`. This continues at each reduction, and moving through the heads each integer cannot be reduced with a value that has a non-integer nested inside.

`Prod` was the same thing as sum, and had similar interactions with non-integers like `x`

`plus_two` was trivial to enact on an element

`map` was annoying and crashed Ayden's VSCode, as we tried running it without a terminating case `if list = # then list`, which caused an infinite loop trying to run the function on `#`

`insert` was also simple because of the way we interpreted the instructions. We dumbed-down the explaination to "add element before the first list item that is larger than it". With this along with the hint about using less_equal, the task was trivial. There was a minor hiccup in figuring this out because we had some kind of parsing error at first. We kept exploring the `less_equal` function to see what was happening. Turns out, we wasted half an hour searching for nothing because we wrapped parentheses in an if-then-else statement, such that insteal of parsing `if [Expr] = [Expr] then...`, we tried to parse `if [boolean] then...` which was not recognized by the parser.

`sort` was also quickly figured out be using recursion to insert each list item into an empty list at the right position using `insert`. We also recognized that this looks a lot like a non-logarithmic merge-sort.

### Task 3
Task 3 asked us to recreate the previous programs in Haskell. Since we've already created these programs, it was simple enough to translate them over to Haskell. The main difficulty we had was remembering proper Haskell syntax, dealing with the Haskell library and researching how to pass a function as an argument. We created some issues to fix in terms of syntax, which was a minor problem. After creating functions like `prod`, `sum` and `map`, there were some conflicts with pre-existing Haskell functions named exactly the same. Finally for `map`, we had to research how to pass a function as a type, which came out to be `map (Int->Int) -> Int -> Int`.


### Further Questions

> There are a lot of interesting questions. For example, #:# does not parse, but (#):# does. Why? Does that mean that it would make sense to change the grammar?

\# denotes the end of a list. If we say a list is of 2 items, with the first item containing 'end of a list', that would not make any sense programatically. However (#) denotes an empty list. Though it is empty, a list is a list, and of course we must allow a list object to be a list item, so (#):# is allowable as a list containing 1 item; an empty list.



> Reflect on the differences between LambdaNat5 and the Calculator. In LambdaNat5, why can't we implement arithmetic using the simple `evalCBN (EPlus e1 e2) = (evalCBN e1) + (evalCBN e2)`

LambdaNat 5 is not just a calculator, because it does not demand that we feed it 2 integers for `EPlus`. LambdaNat5 will actually accept non-integers and it will figure out what to do with them. It includes cases for us adding non-integer items. Whereas in the calculator, feeding `EPlus` a non-integer parameter will just break it, because it is specifically made for adding two integers.



> Did you notice that the specification "the output-list must be sorted in case that the input-list is sorted" states an invariant? Can you use it to prove the correctness of sort (that is, that sort actually does sort)?

The sort function depends on the identity that a single-item list takes. A list of 1 item is inherently sorted. Therefore, if we insert an item to that single-item list, the resulting list will also be sorted. Since we separate lists with recursion to single out the last item of the list, we can work back down the stack while regrowing the list and keeping it sorted.



> In other programming languages, why could there not just be an abstract type? In our LambdaNat parser, we just said that any `Id` would just be evaluated by itself. Could other languages just allow any "type" and give it default print operations? For example, some type `blob` is not defined by an interpreter, but when printed could just print as its datatype or variable name.

### Overall Difficulties
Most of the difficulties we faced were just starting off at each task. We typically struggled when starting a new section because we did not know what exactly the syntax of each task should look like. Luckily we found the hints placed around LambdaNat4, such as `test/test.lc` showcasing how an advanced program in LambdaNat would look like.

