---
title: Leetcode 398 - Random Pick Index
date: 2021-12-14 22:04:06
tags:
- reservoir sampling
- hash table
---
**`Note:`**
- `Brute force` 
  - Hash table
  - Use more `extra space` in exchange of `speed`.

- `Reservoir sampling`
  - Based on our prev knowledge, each time we have `k / N` possibility to keep current `sample`.
  - `N` is the nums who are equal to target we've found so far.
  - `k` is random num between `[1, count]`.
  - If `ran === count`, which is exactly `1 / N` possibility, then we keep `current index`.

**`Question:`**

Given an integer array `nums` with possible duplicates, randomly output the index of a given `target` number. You can assume that the given target number must exist in the array.

Implement the Solution class:

- `Solution(int[] nums)` Initializes the object with the array `nums`.
- `int pick(int target)` Picks a random index `i` from `nums` where `nums[i] == target`. If there are multiple valid i's, then each index should have an equal probability of returning.

**`Example:`**
```

```

**`Code:`**

**`Brute Force:`**
```javascript
/**
 * @param {number[]} nums
 */
var Solution = function(nums) {
  let map = new Map();
  for (const [i, n] of nums.entries()) {
    if (!map.has(n)) {
      map.set(n, [i]);
    } else {
      map.set(n, [...map.get(n), i]);
    }
  }
  this.map = map;
};

/** 
 * @param {number} target
 * @return {number}
 */
Solution.prototype.pick = function(target) {
  const indexes = this.map.get(target);
  return indexes[Math.floor(Math.random() * indexes.length)];
};

/**
 * Your Solution object will be instantiated and called as such:
 * var obj = new Solution(nums)
 * var param_1 = obj.pick(target)
 */
```

**`Reservoir Sampling`**
```javascript
/**
 * @param {number[]} nums
 */
var Solution = function(nums) {
  this.nums = nums;
};

/** 
 * @param {number} target
 * @return {number}
 */
Solution.prototype.pick = function(target) {
  let count = 0;
  let index = 0;
  for (let i = 0; i < this.nums.length; i++) {
    if (this.nums[i] === target) {
      count++;
      const ran = Math.floor(Math.random() * count) + 1;
      if (ran === count) {
        index = i;
      }
    }
  }
  return index;
};
```