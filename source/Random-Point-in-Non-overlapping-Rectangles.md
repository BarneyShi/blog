---
title: Leetcode 497 - Random Point in Non-overlapping Rectangles
date: 2022-01-04 19:30:10
tags:
---
**`Note:`**
- The weight of random rectangle is not `area` but how many `integers` it covers.
- How to pick an rectangle based on the number of integers that a rect covers?
- Use `presum[]`. Use `random * totalInts` can give us an `index` by checking in `presum[]`.

**`Question:`**

You are given an array of non-overlapping axis-aligned rectangles `rects` where `rects[i] = [ai, bi, xi, yi]` indicates that `(ai, bi)` is the `bottom-left` corner point of the ith rectangle and `(xi, yi)` is the `top-right` corner point of the ith rectangle. Design an algorithm to pick a `random` integer point inside the space `covered` by one of the given rectangles. A point on the `perimeter` of a rectangle is `included` in the space covered by the rectangle.

Any integer point inside the space covered by one of the given rectangles should be equally likely to be returned.

Note that an integer point is a point that has integer coordinates.

Implement the `Solution` class:

- `Solution(int[][] rects)` Initializes the object with the given rectangles rects.
- `int[] pick()` Returns a random integer point [u, v] inside the space covered by one of the given rectangles.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/07/24/lc-pickrandomrec.jpg)
```
Input
["Solution", "pick", "pick", "pick", "pick", "pick"]
[[[[-2, -2, 1, 1], [2, 2, 4, 6]]], [], [], [], [], []]
Output
[null, [1, -2], [1, -1], [-1, -2], [-2, -2], [0, 0]]

Explanation
Solution solution = new Solution([[-2, -2, 1, 1], [2, 2, 4, 6]]);
solution.pick(); // return [1, -2]
solution.pick(); // return [1, -1]
solution.pick(); // return [-1, -2]
solution.pick(); // return [-2, -2]
solution.pick(); // return [0, 0]
```

**`Code:`**
```javascript
/**
 * @param {number[][]} rects
 */
var Solution = function(rects) {
  let integerCnt = [...new Array(rects.length).fill(0)];
  let totalCount = 0;
  for (let [i, [a,b,x,y]] of rects.entries()) {
    totalCount += (x - a + 1) * (y - b + 1);
    integerCnt[i] =  totalCount;
  }
  this.totalCount = totalCount;
  this.cntPresume = integerCnt;
  this.rects = rects;
};

/**
 * @return {number[]}
 */
Solution.prototype.pick = function() {
  const rand = Math.random() * this.totalCount;
  const i = this.cntPresume.findIndex(e => e >= rand);
  let [a, b, x, y] = this.rects[i];
  const px = Math.floor(Math.random() * (x - a + 1) + a);
  const py = Math.floor(Math.random() * (y - b + 1) + b);
  return [px, py];
};
/**
 * Your Solution object will be instantiated and called as such:
 * var obj = new Solution(rects)
 * var param_1 = obj.pick()
 */
```