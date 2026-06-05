---
title: Backtracking
date: 2021-08-21 17:50:44
tags:
- backtracking
- dfs
---
I realized I ain't learn shit in CPSC320.
Backtracking are perfect for questions like
- Permutation
- Combination
- Subset

It's easier to treat backtracking problems as a `tree`, and typically, answers are where `leaf nodes` are located. While trying to solve those problems, we are traversing the tree, and `backtracking` happens when we `undo` our last operation to `path` to prepare for the next iteration.

![backtracking](https://i.ibb.co/mSfY83s/autodraw-8-21-2021.png)
Just remember the template to solve backtracking problems:
```javascript
function solution() {
  let ans = [];
  let path = [];

  /* initial call */
  backtracking(...params);
  return ans;

  /* backtracking */
  function backtracking(...params) {
    // Found a leaf node
    if (terminating conditions) {
      ans.push(...path);
      return ans;
    }

    // Keep traversing
    for (let each node of choices) {
      // Do something
      backtracking(...params);
      // Undo operations.
    }

  }
}
```