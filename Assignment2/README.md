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

