---
title: Leetcode 313 - Super ugly
date: 2021-12-05 03:14:26
tags:
- dp
---
**`Note:`**
- Use `minHeap` will TLE, so we stick to `DP`.
- Just like the other similar question `LC 264`. Create a bunch of `pointers` for each `prime`. 
- All pointers are initialized as `0`, which points at `dp[p]`.
- Iterate `pointers[]` and find the min by `dp[pVal] * prime`.
- For all qualified `p`, do `p++`.

**`Question:`**

A super `ugly` number is a positive integer whose prime factors are in the array `primes`.

Given an integer `n` and an array of integers `primes`, return the `nth` super ugly number.

The `nth` super ugly number is guaranteed to fit in a `32-bit` signed integer.

**`Example:`**
```
Input: n = 12, primes = [2,7,13,19]
Output: 32
Explanation: [1,2,4,7,8,13,14,16,19,26,28,32] is the sequence of the first 12 super ugly numbers given primes = [2,7,13,19].
```

**`Code:`**
```javascript
/**
 * @param {number} n
 * @param {number[]} primes
 * @return {number}
 */
var nthSuperUglyNumber = function(n, primes) {
  let dp = [...Array(n).fill(0)];
  dp[0] = 1;
  let p = [...Array(primes.length).fill(0)];
  for (let i = 1; i < n; i++) {
    let min = Infinity;
    for (let i = 0; i < p.length; i++) {
      min = Math.min(min, dp[p[i]] * primes[i]);
    }

    dp[i] = min;
    for (let i = 0; i < p.length; i++) {
      if (dp[p[i]] * primes[i] === min) p[i]++;
    }
  }
  return dp[n - 1];
};
```