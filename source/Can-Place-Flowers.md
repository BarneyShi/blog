---
title: Leetcode 605 - Can Place Flowers
date: 2021-12-08 23:32:10
tags:
- greedy
---
**`Note:`**
- How to be `greedy`? As long the current plot can be planted, let's do it.
- Special cases for the `start` and `end`.
- The reason behind this: 
  - For example: `[0,0,0]` can be planted as `[1,0,1]` or `[0,1,0]`.
  - But because we iterate from `left` to `right`, as long as we planted at every possible plot, the result will be the `maximum`. It won't happen like `[0,1,0]`.


**`Question:`**

You have a long `flowerbed` in which some of the plots are planted, and some are not. However, flowers cannot be planted in `adjacent` plots.

Given an integer array `flowerbed` containing `0`'s and `1`'s, where `0` means empty and `1` means not empty, and an integer `n`, return if `n` new flowers can be planted in the `flowerbed` without violating the no-adjacent-flowers rule.

**`Example:`**
```
Input: flowerbed = [1,0,0,0,1], n = 1
Output: true
```

**`Code:`**
```javascript
/**
 * @param {number[]} flowerbed
 * @param {number} n
 * @return {boolean}
 */
var canPlaceFlowers = function(flowerbed, n) {
  let availablePlots = 0;
  if (flowerbed.length === 1) return flowerbed[0] === 0 ? n <= 1 : n === 0;
  for (let i = 0; i < flowerbed.length; i++) {
    if (i === 0 && flowerbed[i] === 0 && flowerbed[i + 1] === 0) {
      availablePlots++;
      flowerbed[i] = 1;
      continue;
    }
    if (i === flowerbed.length - 1 && flowerbed[i - 1] === 0 && flowerbed[i] === 0) {
      availablePlots++;
      flowerbed[i] = 1;
      continue;
    }
    if (flowerbed[i - 1] === 0 && flowerbed[i] === 0 && flowerbed[i + 1] === 0) {
      availablePlots++;
      flowerbed[i] = 1;
    }
  }
  return availablePlots >= n;
};
```