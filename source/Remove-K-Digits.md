---
title: Leetcode 402 - Remove K Digits
date: 2021-12-16 20:41:28
tags:
- monotonic stack
- greedy
---
**`Note:`**
- Intuition: By observing examples, I found that we should remove a `num` when `num[i] > num[i + 1]`. In addition, we should start this from the most significant digits.
- Things I overlooked: 
  - Didn't consider about the new nums after removing some in-between digits. There might be new digits that meet the patterns `num[i] > num[i + 1]` after removing some in-between digits.
- Is there a data structure that can be used to constantly `pop` out digits that are `bigger` than following digits?
- Yes, it's `monotonic stack`!
- Use mono stack while iterating num. Note that every time we use `stack.pop()`, we need to `k--`. And we only do `pop()` while `k > 0`.
- Be careful when there are leading zeroes in the front.

**`Question:`**

Given string `num` representing a non-negative integer `num`, and an integer `k`, return the smallest possible integer after removing `k` digits from `num`.

**`Example:`**
```
Input: num = "1432219", k = 3
Output: "1219"
Explanation: Remove the three digits 4, 3, and 2 to form the new number 1219 which is the smallest.
```

**`Code:`**
```javascript
/**
 * @param {string} num
 * @param {number} k
 * @return {string}
 */
 var removeKdigits = function(num, k) {
   let stack = [];
   for (let i = 0; i < num.length; i++) {
     while (k > 0 && stack.length > 0 && stack[stack.length - 1] > num[i]) {
       stack.pop();
       k--;
     }
     stack.push(num[i]);
   }
   while (k !== 0) {
     stack.pop();
     k--;
   }
   stack = stack.join('').replace(/^0+/g, '');
   return stack.length > 0 ? stack : '0';
};
```