---
title: Leetcode 241 - Diff ways to add parentheses
date: 2021-12-02 00:21:39
tags:
- divide and conquer
---
**`Note:`**
- At first I tried to use normal recursion, but because the result tolerates duplicates, the code doesn't work.
  - For example, `(2*3)-4*5` and `2*3-(4*5)` were consider two diff combinations in my original code, but they are not valid combinations. They are the same like `(2*3)-(4*5)`.
- Use recursion, for every `op`, do recursion on `left` and `right` separately, then calc all the possible `combinations`.
- ![img](https://i.imgur.com/symPSYo.png)

**`Question:`**

Given a string `expression` of numbers and operators, return all possible results from computing all the different possible ways to group numbers and operators. You may return the answer in `any order`.

**`Example:`**
```
Input: expression = "2*3-4*5"
Output: [-34,-14,-10,-10,10]
Explanation:
(2*(3-(4*5))) = -34 
((2*3)-(4*5)) = -14 
((2*(3-4))*5) = -10 
(2*((3-4)*5)) = -10 
(((2*3)-4)*5) = 10
```

**`Code:`**
```javascript
/**
 * @param {string} expression
 * @return {number[]}
 */
 var diffWaysToCompute = function(expression) {
  let map = new Map();
  let results = [];
  if (map.has(expression)) return map.get(expression);
  if (!isNaN(expression - 0)) {
    results.push(expression - 0);
    return results;
  }
  for (let i = 0; i < expression.length; i++) {
    if (isNaN(expression[i])) {
      const op = expression[i];
      const left = diffWaysToCompute(expression.slice(0, i));
      const right = diffWaysToCompute(expression.slice(i + 1));
      for (const l of left) {
        for (const r of right) {
          if (op === '+') {
            results.push(l + r);
          } else if (op === '-') {
            results.push(l - r);
          } else {
            results.push(l * r);
          }
        }
      }
    }
  }
  map.set(expression, results);
  return results;
};
```