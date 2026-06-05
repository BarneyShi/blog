---
title: Leetcode 22 - Generate parentheses
date: 2021-11-01 19:57:32
tags:
- dfs
---
**`Note:`**
- Use `backtracking` to find all valid combinations.
- Have to prune unqualified branches, otherwise TLE.

**`Question:`**

Given `n` pairs of parentheses, write a function to generate all combinations of well-formed parentheses.

**`Example:`**
```
Input: n = 3
Output: ["((()))","(()())","(())()","()(())","()()()"]
```

**`Code:`**
```javascript
/**
 * @param {number} n
 * @return {string[]}
 */
var generateParenthesis = function(n) {
  const parentheses = ['(', ')'];
  let result = [];
  let path = [];
  dfs(parentheses, n);
  return result;

  function dfs(parentheses, n) {
    if (path.length === n * 2) {
      if (checkValidity(path)) {
        result.push(path.join(''));
      }
      return;
    }
    for (let i = 0; i < parentheses.length; i++) {
      if (!countParentheses(path, n)) continue;
      path.push(parentheses[i]);
      dfs(parentheses, n);
      path.pop();
    }
  }

  function countParentheses(arr, n) {
    let leftParenthesis = 0;
    let rightParenthesis = 0;
    for (const char of arr) {
      if (char === '(') {
        leftParenthesis++;
        if (leftParenthesis > n) return false;
      } else {
        rightParenthesis++;
        if (rightParenthesis > n) return false;
      } 
    }
    return true;
  }

  function checkValidity(arr) {
    let stack = [];
    for (let i = 0; i < arr.length; i++) {
      if (arr[i] === '(') {
        stack.push(arr[i]);
      } else {
        if (stack.length === 0) return false;
        stack.pop();
      }
    }
    return stack.length === 0;
  }
};
```