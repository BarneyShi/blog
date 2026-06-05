---
title: Leetcode 89 - Gray code
date: 2021-11-24 22:25:05
tags:
- dfs
---
**`Note:`**
- Kinda hard to find the pattern, so DFS all the way.
- Use ` num ^ 1 << i` to flip bits.
- Use `set` to check if we've use a num before.
- The longest length of num is `n` bits.

**`Question:`**

An `n-bit` gray code sequence is a sequence of `2n` integers where:

- Every integer is in the inclusive range `[0, 2n - 1]`,
- The first integer is `0`,
- An integer appears `no more than once` in the sequence,
- The binary representation of every pair of `adjacent` integers differs by exactly one bit, and
- The binary representation of the `first` and `last` integers differs by exactly one bit.

Given an integer `n`, return any valid `n-bit gray code sequence`.

**`Example:`**
```
Input: n = 2
Output: [0,1,3,2]
Explanation:
The binary representation of [0,1,3,2] is [00,01,11,10].
- 00 and 01 differ by one bit
- 01 and 11 differ by one bit
- 11 and 10 differ by one bit
- 10 and 00 differ by one bit
[0,2,3,1] is also a valid gray code sequence, whose binary representation is [00,10,11,01].
- 00 and 10 differ by one bit
- 10 and 11 differ by one bit
- 11 and 01 differ by one bit
- 01 and 00 differ by one bit
```

**`Code:`**
```javascript
/**
 * @param {number} n
 * @return {number[]}
 */
var grayCode = function(n) {
  const len = 2**n;
  let hasFound = false;
  let res = [];
  let path = [0];
  let set = new Set([0]);
  dfs(n);
  return res;

  function dfs(n) {
    if (path.length === len) {
      res.push(...path);
      hasFound = true;
      return;
    }
    if (hasFound) return;
    const lastNum = path[path.length - 1];
    for (let i = 0; i < n; i++) {
      const candidate = lastNum ^ (1 << i);
      if (!set.has(candidate)) {
        path.push(candidate);
        set.add(candidate);
        dfs(n);
        const pop = path.pop();
        set.delete(pop);
      }
    }
  }
};
```