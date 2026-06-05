---
title: Leetcode 306 - Additive numbers
date: 2021-12-02 23:03:48
tags:
---
**`Note:`**
- Classic `DFS` problem.
- Avoid using `global bool` as the result. Try to make the most of `recursion`. Such as using `recursion(next_call)` in if-else condition.
- Have to preserve the `2 proceding nums` so that we can quickly check next num.
- In the main function, we need to `initialize` the first 2 nums.

**`Question:`**

Additive number is a string whose digits can form additive sequence.

A valid additive sequence should contain at least three numbers. Except for the first two numbers, each subsequent number in the sequence must be the sum of the preceding two.

Given a string containing only digits '0'-'9', write a function to determine if it's an additive number.

Note: Numbers in the additive sequence cannot have leading zeros, so sequence 1, 2, 03 or 1, 02, 3 is invalid.

**`Example:`**
```
Input: "112358"
Output: true
Explanation: The digits can form an additive sequence: 1, 1, 2, 3, 5, 8. 
             1 + 1 = 2, 1 + 2 = 3, 2 + 3 = 5, 3 + 5 = 8
```

**`Code:`**
```javascript
/**
 * @param {string} num
 * @return {boolean}
 */
 var isAdditiveNumber = function(num) {
  for (let i = 0; i < num.length - 2; i++) {
    for (let j = i + 1; j < num.length - 1; j++) {
      const a = num.slice(0, i + 1);
      const b = num.slice(i + 1, j + 1);
      if (a[0] === '0' && a.length > 1 || b[0] === '0' && b.length > 1) continue;
      if (j + 1 === num.length) continue;
      if (dfs(num, j + 1, a, b)) return true;
    }
  }
  return false;

  function dfs(str, startIndex, add1, add2) {
    if (startIndex === num.length) {
      return true;
    }
    const shouldBeNext = (add1 - 0) + (add2 - 0) + '';
    const nextNum = num.slice(startIndex, startIndex + shouldBeNext.length);
    if (nextNum === shouldBeNext && dfs(str, startIndex + shouldBeNext.length, add2, nextNum)) {
      return true;
    }
    return false;
  }
};
```