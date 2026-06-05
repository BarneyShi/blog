---
title: Leetcode 386 - Lexicographical Numbers
date: 2021-12-11 21:07:38
tags:
- dfs
---
**`Note:`**
- This is essentially `pre-order` traveral of a `10-ary` tree.
- ![img](https://i.imgur.com/M2W9lUR.png)
- `Iterative`
  - A single var `num` can store our paths.
  - Keep `multiplying num` by `10`, and add every num to `ans[]` till it's bigger or equal to `n`.
  - While it's `>= n` or `num % 10 === 9`, divide num by `10`. 
    - Question: why do we need to check if `num % 10 === 9`? Coz when `num === 19`, next num should be `2` instead of `20`. We need to go all the way back to `top` level. 
  - Otherwise do `num++`.
- `Recursion`
  - Just like what we'd do in a bianry tree, add `num` to `ans[]` first.
  - Then do `DFS` on every child. `(num * 10 + i)`

**`Question:`**

Given an integer `n`, return all the numbers in the range `[1, n]` sorted in lexicographical order.

You must write an algorithm that runs in `O(n)` time and uses `O(1)` extra space. 

**`Example:`**
```
Input: n = 13
Output: [1,10,11,12,13,2,3,4,5,6,7,8,9]
```

**`Code:`**
```javascript
/**
 * @param {number} n
 * @return {number[]}
 */
var lexicalOrder = function(n) {
  let ans = [];
  curr = 1;
  while (ans.length < n) {
    while (curr <= n) {
      ans.push(curr);
      curr *= 10;
    }
    while (curr >= n || curr % 10 === 9) {
      curr = Math.floor(curr / 10);
    }
    curr++;
  }
  return ans;
};
```

```javascript
/**
 * @param {number} n
 * @return {number[]}
 */
var lexicalOrder = function(n) {
  let ans = [];
  for (let i = 1; i <= 9; i++) {
    dfs(i);
  }
  return ans;

  function dfs(num) {
    if (num > n) return;
    ans.push(num);
    for (let i = 0; i <= 9; i++) {
      dfs(num * 10 + i);
    }
  }
};
```