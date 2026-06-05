---
title: Leetcode 1296 - Divide Array in Sets of K Consecutive Numbers
date: 2021-12-29 18:37:29
tags:
- greedy
---
**`Note:`**
- Same question as Leetcode 846.
- However, avoiding using `shift()` cuz it's too time consuming.
- Just use an index `j` to mark the position.

**`Question:`**

Given an array of integers `nums` and a positive integer `k`, find whether it is possible to divide this array into sets of k consecutive numbers.

Return `true` if it is possible. Otherwise, return `false`.

**`Example:`**
```
Input: nums = [1,2,3,3,4,4,5,6], k = 4
Output: true
Explanation: Array can be divided into [1,2,3,4] and [3,4,5,6].
```

**`Code:`**
```javascript
/**
 * @param {number[]} hand
 * @param {number} groupSize
 * @return {boolean}
 */
var isPossibleDivide = function(hand, groupSize) {
  hand.sort((a, b) => a - b);
  let map = new Map();
  for (const card of hand) {
    if (!map.has(card)) {
      map.set(card, 1);
    } else {
      map.set(card, map.get(card) + 1);
    }
  }
  let j = 0;
  // Use j instead of shift();
  while (j < hand.length) {
    const top = hand[j];
    let count = map.get(top);
    while (j < hand.length && hand[j] === top) {
      j++;
    }
    if (count === 0) continue;
    let i = 1;
    while (i < groupSize) {
      if (!map.has(top + i) || map.get(top) < count) return false;
      map.set(top + i, map.get(top + i) - count);
      i++;
    }
  }
  return true;
};
```