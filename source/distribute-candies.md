---
title: Leetcode 575 - Distribute candies
date: 2021-10-31 19:56:12
tags:
- hash table
---
**`Note:`**
- Use `map` to store unique `candy`.

**`Question:`**

Alice has `n` candies, where the `ith` candy is of type `candyType[i]`. Alice noticed that she started to gain weight, so she visited a doctor.

The doctor advised Alice to only eat `n / 2` of the candies she has (n is always even). Alice likes her candies very much, and she wants to eat the maximum number of different types of candies while still following the doctor's advice.

Given the integer array `candyType` of length n, return the maximum number of different types of candies she can eat if she only eats n / 2 of them.

**`Example:`**
```
Input: candyType = [1,1,2,2,3,3]
Output: 3
Explanation: Alice can only eat 6 / 2 = 3 candies. Since there are only 3 types, she can eat one of each type.
```

**`Code:`**
```javascript
/**
 * @param {number[]} candyType
 * @return {number}
 */
var distributeCandies = function(candyType) {
  let map = new Map();
  let target = candyType.length / 2;
  for (const candy of candyType) {
    if (target === 0) break;
    if (!map.has(candy)) {
      map.set(candy, true);
      target--;
    }
  }
  return candyType.length / 2 - target;
};
```