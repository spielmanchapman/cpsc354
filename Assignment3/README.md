```
  $$$$\        $$$$$$$$\                     
    $$ \       $$  _____|                           Ayden Best 2317839
     $$ \      $$ |    $$\   $$\ $$$$$$$\  
     $$$ \     $$$$$\  $$ |  $$ |$$  __$$\          Corey Spielman 2316074
    $$ $$ \    $$  __| $$ |  $$ |$$ |  $$ |
   $$ / $$ \   $$ |    $$ |  $$ |$$ |  $$ |         Connor Cowher 2317839
 $$$ /   $$$\  $$ |    \$$$$$$  |$$ |  $$ |
 \___|   \___| \__|     \______/ \__|  \__|
```

# Critical Appraisal
Submitted 12/8/2021

## Part 1
Part 1 was trivial after looking at `examples.lc`. All we had to do was understand the syntax and recognize that pattern matching would be done with `case-of` and `->` was used in place of `=` or `then`. We actually just copied our original programs from Assignment 2 and then rewrote them with the new syntax that we had for this assignment.

## Part 2
In Part 2, we knew exactly what the task was and did not have to waste time getting started. We however ran into 2 issues that stalled us simply because we didn't know how the language was supposed to work.

The first issue was referring to a pointer, which required the `!` prefix. Once we checked `circular-list.lc`, we realized that we have to use this unknown symbol to us. We researched a bit to understand why the examples were doing what they were doing, and then correctly implemented `get` and `next`. 

The second issue was defining variables. We quickly understood that we had to use `let`, but got caught up in syntax once again. We were confused by the point in the assignment instructions that claimed we did not have to use "in" anymore, because we had another syntax issue and could not pinpoint the problem. This issue involved not actually returning the new list item at the end of `insert`. After mixing around syntax to try and 'un-break' the insert function, we finally had a working version.


### Testing
The testing we used was the included `round-robin-test.lc` which proved to be very useful. We got a little too ahead of ourselves and looked over the point about migrating the test cases to `round-robin.lc`, and instead tried to load the test file alongside the main file. This gave us errors with the definition for `newCList`, which drove us in circles trying to figure out what was wrong with our function for making a new list when everything looked correct.

### Observations
We noticed that the example for `delete` called to delete the node after the one that was passed. This was interesting, because it made the function definition much much easier to create. We were completely stuck initially because we could not figure out how to reference the next-node-pointer of the previous node from the passed node. We're still wondering how deletion of the passed node could possibly work without implementing a doubly-linked-list.

##Sources:

https://stackoverflow.com/questions/993112/what-does-the-exclamation-mark-mean-in-a-haskell-declaration/993326
Used to understand what `!` means in Haskell. Basically, evaluate `!var` first, and then get its memory location.
This was needed to get the internal values of a list item (in `get` and `next`)