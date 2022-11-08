<script>
MathJax = {
  loader: {load: ['input/asciimath', 'output/chtml']},
  asciimath: {
    delimiters: [['$','$'], ['`','`']]
  }
}
</script>

<script src="https://polyfill.io/v3/polyfill.min.js?features=es6"></script>
<script type="text/javascript" id="MathJax-script" async
  src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/startup.js"></script>

# Introduction

The game is presented this way:

The board has three wooden towers. In the initial configuration, the left tower has several disks stacked neatly from largest to smallest. The game consists of moving these disks one by one following the simple rules that we state below to obtain the same stack of disks as the initial configuration, but in the tower on the right. For example, the picture shows the initial configuration, an intermediate configuration, and the final configuration, which means victory. The middle tower can be used as an intermediate resource for moving the disks from one side to the other.

![](https://i.imgur.com/8jZFFPB.png)



The rules of the game are:

- We can only move the disks that are at the top of a stack.
- We can only place a disk in a stack if it is smaller in size than the disk on top. 

For example, in the intermediate configuration shown in the image, if we want to move the stacking to the left, by the first rule, we can only remove the circle from the top. By the second rule, it cannot be placed on either of the two other towers. Since it is larger than the disks on top of each of the towers in question.


# Objective

Define a function `hanoi : int -> unit` that prints the sequence of moves made to win the game with a number of disks equal to the given parameters. Thus, the solution to the game with 4 disks is calculated by calling `hannoi 4 `.  This function call should print to standard output:

```pseudocode
I move a disk from 1 to 2
I move a disk from 1 to 3
I move a disk from 2 to 3
I move a disk from 1 to 2
I move a disk from 3 to 1
I move a disk from 3 to 2
I move a disk from 1 to 2
I move a disk from 1 to 3
I move a disk from 2 to 3
I move a disk from 2 to 1
I move a disk from 3 to 1
I move a disk from 2 to 3
I move a disk from 1 to 2
I move a disk from 1 to 3
I move a disk from 2 to 3
```


Hint: it might make sense to define a helper function that has the signature `hannoi_aux : int -> int -> int -> int` such that `hannoi_aux n t1 t2 t3` means moving disk `n` from `t1` to `t2` using `t3` as an intermediate tower.