---
title: Leetcode 519 - Random flip matrix
date: 2021-11-26 21:09:14
tags:
---
**`Note:`**
- First, map `2D` `m x n` matrix into a `1D` array. How?
  - `[i, j] -> [i * n + j]`.
  - Explain: There are `m * n` cells in this matrix, [0, 0] is mapped to 0, and `[m - 1, n - 1]` is mapped to `(m - 1) * n + n - 1 === m * n - 1`.
- How should we mark indexes that have been `picked`?
- Use `random * totalLength` to get a random num between `[0, len - 1]`.
- If `map.get(random)` exists, it means the num was picked before, and now it `maps to another index`.
- If not, it's a qualified index. So `index = this.map.get(random) || random`
- How to update the map?
  - Map the `last element` to `index ran`;
  - In case the last element also maps to another index, we need to check `map.get(this.len - 1)`.
  - ![img](https://i.imgur.com/o0sTtLB.png)
  - `map.set(random, map.get(len - 1) || len - 1)`.
    - (`Total` is the length, and that's why we do `total - 1` first);
- Use `floor(index / n)` to get row, `index % n` to get col.

**`Question:`**

There is an `m x n` binary grid `matrix` with all the values set `0` initially. Design an algorithm to randomly pick an index `(i, j)` where `matrix[i][j] == 0` and flips it to `1`. All the indices `(i, j)` where `matrix[i][j] == 0` should be equally likely to be returned.

Optimize your algorithm to minimize the number of calls made to the built-in random function of your language and optimize the time and space complexity.

Implement the `Solution` class:

- `Solution(int m, int n)` Initializes the object with the size of the binary matrix m and n.
- `int[] flip()` Returns a random index [i, j] of the matrix where matrix[i][j] == 0 and flips it to 1.
- `void reset()` Resets all the values of the matrix to be 0.

**`Example:`**
```
Input
["Solution", "flip", "flip", "flip", "reset", "flip"]
[[3, 1], [], [], [], [], []]
Output
[null, [1, 0], [2, 0], [0, 0], null, [2, 0]]

Explanation
Solution solution = new Solution(3, 1);
solution.flip();  // return [1, 0], [0,0], [1,0], and [2,0] should be equally likely to be returned.
solution.flip();  // return [2, 0], Since [1,0] was returned, [2,0] and [0,0]
solution.flip();  // return [0, 0], Based on the previously returned indices, only [0,0] can be returned.
solution.reset(); // All the values are reset to 0 and can be returned.
solution.flip();  // return [2, 0], [0,0], [1,0], an
```

**`Code:`**
```javascript
/**
 * @param {number} m
 * @param {number} n
 */
var Solution = function(m, n) {
  this.m = m;
  this.n = n;
  this.map = new Map();
  this.total = m * n;
};

/**
 * @return {number[]}
 */
Solution.prototype.flip = function() {
  const random = ~~(Math.random() * this.total);
  // total represents the whole length. Minus 1 is the index of the last element.
  this.total--;
  const index = this.map.get(random) || random;
  this.map.set(random, this.map.get(this.total) || this.total);
  return [~~(index / this.n), index % this.n];
};

/**
 * @return {void}
 */
Solution.prototype.reset = function() {
  this.total = this.m * this.n;
  this.map.clear();
};

/**
 * Your Solution object will be instantiated and called as such:
 * var obj = new Solution(m, n)
 * var param_1 = obj.flip()
 * obj.reset()
 */
```