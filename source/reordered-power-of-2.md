---
title: Leetcode 869 - Reordered power of 2
date: 2021-10-27 17:07:00
tags:
- dfs
---
**`Note:`**
- Typical DFS problem.
- Generate a table of power of 2 so we don't need to calculate every time.
- Know how to prune branches by checking leading zeroes.
- Know how to avoid duplicates by using `used[i]`.

**`Question:`**

You are given an integer `n`. We reorder the digits in any order (including the original order) such that the leading digit is not zero.

Return `true` if and only if we can do this so that the resulting number is a power of two.

**`Example:`**
```
Input: n = 46
Output: true
```

**`Code:`**
Time complexity: `O(log10(n)!)`
```javascript
/**
 * @param {number} n
 * @return {boolean}
 */
var reorderedPowerOf2 = function(n) {
  let result = [];
  let path = [];
  n = n + '';
  const power2Table = generatePowerOf2();
  let used = [...Array(n).fill(false)];
  dfs(used, n);
  return result.length > 0;

  function dfs(used, n) {
    if (path.length === n.length) {
      if (power2Table.includes(path.join('') - 0)) {
        result.push([...path]);
      }
      return;
    } 
    for (let i = 0; i < n.length; i++) {
      if (path.length === 0 && n[i] === '0' || used[i]) continue;
      path.push(n[i]);
      used[i] = true;
      dfs(used, n);
      used[i] = false;
      path.pop();
    }
  }

  function generatePowerOf2() {
    let table = [];
    for (let i = 1; i <= 10**9; i = i*2) {
      table.push(i);
    }
    return table;
  }
};
```