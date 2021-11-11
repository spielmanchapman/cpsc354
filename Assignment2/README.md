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

