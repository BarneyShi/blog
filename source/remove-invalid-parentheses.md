---
title: Leetcode 301 - Remove invalid parentheses
date: 2021-10-27 02:18:29
tags:
- bfs
- dfs
---
**`Note:`**
- We need to return all possible results, so `DFS` or `BFS` is unavoidable.
- `BFS`
  - Use two sets `curSet` (initialized as `s`) and `nextSet`.
  - For every str in `curSet`, check if there are valid ones before each iteration. If yes, it must be the result coz in BFS, the deeper the level is, the more operations we need to do.
  - If not, for each str in curSet, for each parenthesis in `str`, remove it and add it to `nextSet`. 
  - Finally, `curSet = nextSet` and we keep going.


**`Question:`**

Given a string `s` that contains parentheses and letters, remove the minimum number of invalid parentheses to make the input string valid.

Return all the possible results. You may return the answer in any order.

**`Example:`**
```
Input: s = "()())()"
Output: ["(())()","()()()"]
```

**`Code:`**

**`BFS O(n*2^n):`**

Time complexity is as know above coz there are `n` possibilities to remove 1 char and the `max depth` of tree is `2^n`.
```javascript
/**
 * @param {string} s
 * @return {string[]}
 */
var removeInvalidParentheses = function (s) {
  let set = new Set();
  // Initialize
  set.add(s);
  let res = [];
  while (true) {
    for (const arr of set) {
      if (checkValidity(arr)) {
        res.push(arr);
      }
    }
    if (res.length > 0) return res;
    let nextSet = new Set();
    for (const str of set) {
      for (let i = 0; i < str.length; i++) {
        if (str[i] !== '(' && str[i] !== ')') {
          continue;
        }
        const newStr = str.slice(0, i) + str.slice(i + 1);
        nextSet.add(newStr);
      }
    }
    // Almost forgot this part.
    set = nextSet;
  }

  function checkValidity(str) {
    if (str.length === 0) return true;
    let stack = [];
    for (let i = 0; i < str.length; i++) {
      if (str[i] === '(') {
        stack.push([str[i]]);
        continue;
      } else if (str[i] === ')') {
        if (stack.length === 0) return false;
        stack.pop();
      } else {
        continue;
      }
    }
    return stack.length === 0;
  }
};
```