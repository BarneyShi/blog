---
title: Leetcode 390 - Elimination Game
date: 2021-12-13 01:58:36
tags:
- math
---
**`Note:`**
- Every time all nums form an `arithemetic progression` with different `diff`.
- Every time the number of `num` will be `1 / 2` of last time.
- Every time `diff` will `double`!
  - For example, at first diff of `1,2,3,4,5,6,7,8` is 1.
  - Then it becomes `2,4,6,8` which is 2.
  - Then it become `2,6` which is 4.
- Note that the `head` of the progression only changes when 
  - The number of progression is `odd` OR
  - We start from `left`.
- We should keep updating the `head` and eventually it'll become our ans.

**`Question:`**

You have a list `arr` of all integers in the range `[1, n]` sorted in a strictly increasing order. Apply the following algorithm on `arr`:

- Starting from left to right, remove the first number and every other number afterward until you reach the end of the list.
- Repeat the previous step again, but this time from right to left, remove the rightmost number and every other number from the remaining numbers.
- Keep repeating the steps again, alternating left to right and right to left, until a single number remains.
Given the integer `n`, return the last number that remains in arr.

**`Example:`**
```
Input: n = 9
Output: 6
Explanation:
arr = [1, 2, 3, 4, 5, 6, 7, 8, 9]
arr = [2, 4, 6, 8]
arr = [2, 6]
arr = [6]
```

**`Code:`**
```javascript
/**
 * @param {number} n
 * @return {number}
 */
 var lastRemaining = function(n) {
  let fromStart = true;
  let diff = 1;
  let remains = n;
  let res = 1;
  while (remains > 1) {
    if (fromStart || remains % 2 === 1) {
      res += diff;
    }
    fromStart = !fromStart;
    // Diff doubles every time.
    diff *= 2;
    remains = remains >> 1;
  }
  return res;
};

```