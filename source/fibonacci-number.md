---
title: Leetcode 509 - Fibonacci number
date: 2021-08-29 22:35:11
tags:
- leetcode
- dp
---
The Fibonacci numbers, commonly denoted F(n) form a sequence, called the Fibonacci sequence, such that each number is the sum of the two preceding ones, starting from 0 and 1. That is,
```
F(0) = 0, F(1) = 1
F(n) = F(n - 1) + F(n - 2), for n > 1.
```
Given n, calculate F(n).

**Example1**
```
Input: n = 2
Output: 1
Explanation: F(2) = F(1) + F(0) = 1 + 0 = 1.
```
**Iterative**
```javascript
// Time complexity: O(n)
// DP formula: F(n) = F(n-1) + F(n-2);
/**
 * @param {number} n
 * @return {number}
 */
var fib = function(n) {
  if (n === 0) return 0;
  if (n === 1) return 1;
  let ans = [];
  ans[0] = 0;
  ans[1] = 1;
  for (let i = 2; i <= n; i++) {
    ans[i] = ans[i-1] + ans[i-2];
  }
  return ans[n];
};
```
**Recursive**
```javascript
// Time complexity: O(n^2)
// You can think of it as a tree, and the number of tree nodes is its time complexity. There are 2^0 + 2^1 + 2^2 + ... + 2^n nodes, which is O(n^2);
var fib = function(n) {
  if (n === 0) return 0;
  if (n === 1) return 1;
  return fib(n-1) + fib(n-2);
};
```