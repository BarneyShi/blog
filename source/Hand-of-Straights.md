---
title: Leetcode 846 - Hand of Straights
date: 2021-12-29 17:49:00
tags:
- greedy
---
**`Note:`**
- ![img](https://i.imgur.com/XJRuncH.png)
- Sort hand first.
- Use map to record frequencies.
- For each head, get its `count` in map, and shift the array until `hand[0] !== head`.
- If `count === 0`, it means that we've used all of it before, jump to next iteration.
- Contruct consecutives based on the count, and if needed cards' count is smaller than what we need, return false.
- Update `map` while constructing cards.

**`Question:`**

Alice has some number of cards and she wants to rearrange the cards into groups so that each group is of size `groupSize`, and consists of `groupSize` consecutive cards.

Given an integer array `hand` where `hand[i]` is the value written on the `ith` card and an integer `groupSize`, return `true` if she can rearrange the cards, or false otherwise.

**`Example:`**
```
Input: hand = [1,2,3,6,2,3,4,7,8], groupSize = 3
Output: true
Explanation: Alice's hand can be rearranged as [1,2,3],[2,3,4],[6,7,8]
```

**`Code:`**
```javascript
/**
 * @param {number[]} hand
 * @param {number} groupSize
 * @return {boolean}
 */
var isNStraightHand = function(hand, groupSize) {
  hand.sort((a, b) => a - b);
  let map = new Map();
  for (const card of hand) {
    if (!map.has(card)) {
      map.set(card, 1);
    } else {
      map.set(card, map.get(card) + 1);
    }
  }
  while(hand.length > 0) {
    const top = hand.shift();
    let count = map.get(top);
    if (count === 0) continue;
    while (hand.length > 0 && hand[0] === top) {
      hand.shift();
    }
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