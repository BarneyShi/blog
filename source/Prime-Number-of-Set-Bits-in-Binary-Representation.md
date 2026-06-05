---
title: Leetcode 762 - Prime Number of Set Bits in Binary Representation
date: 2021-12-27 19:04:31
tags:
- math
---
**`Note:`**
- Know how to check if a num is `prime` or not (From 2 to floor(sqrt(num))).
- Use memo to remember prev results.

**`Question:`**

Given two integers `left` and `right`, return the count of numbers in the inclusive range [left, right] having a prime number of set bits in their binary representation.

Recall that the number of set bits an integer has is the number of 1's present when written in binary.

- For example, `21` written in binary is `10101`, which has 3 set bits.

**`Example:`**
```
Input: left = 6, right = 10
Output: 4
Explanation:
6  -> 110 (2 set bits, 2 is prime)
7  -> 111 (3 set bits, 3 is prime)
8  -> 1000 (1 set bit, 1 is not prime)
9  -> 1001 (2 set bits, 2 is prime)
10 -> 1010 (2 set bits, 2 is prime)
4 numbers have a prime number of set bits.
```

**`Code:`**
```javascript
/**
 * @param {number} left
 * @param {number} right
 * @return {number}
 */
var countPrimeSetBits = function(left, right) {
  let ans = 0;
  let memo = {};
  for (let i = left; i <= right; i++) {
    if (isPrime(checkSetBits(i))) ans++;
  }
  return ans;

  function isPrime(num) {
    if (num === 1) return false;
    if (memo[num] !== undefined) return memo[num];
    for (let i = 2; i <= Math.floor(Math.sqrt(num)); i++) {
      if (num % i === 0) {
        memo[num] = false;
        return false;        
      }
    }
    memo[num] = true;
    return true;
  }

  function checkSetBits(num) {
    let ans = 0;
    while (num !== 0) {
      const last = num & 1;
      if (last === 1) ans++;
      num = num >> 1;
    }
    return ans;
  }
};
```