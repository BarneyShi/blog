---
title: Leetcode 384 - Shuffle an array
date: 2021-11-17 02:18:33
tags:
---
**`Note:`**
- How to shuffle randomly?
- For an `array` starting from `0` to `len - 1`.
  - First, pick an `index` between `[0, len - 1]` and `swap` with index 0.
  - Then, pick an `index` between `[1, len - 1]` and `swap` with index 1.
  ...
  - Pick an `index` between `[len - 1, len - 1]` and `swap` with index len - 1...
- Done.

**`Question:`**

Given an integer array nums, design an algorithm to randomly shuffle the array. All permutations of the array should be equally likely as a result of the shuffling.

Implement the Solution class:

- `Solution(int[] nums)` Initializes the object with the integer array nums.
- `int[] reset()` Resets the array to its original configuration and returns it.
- `int[] shuffle()` Returns a random shuffling of the array.

**`Example:`**
```
Input
["Solution", "shuffle", "reset", "shuffle"]
[[[1, 2, 3]], [], [], []]
Output
[null, [3, 1, 2], [1, 2, 3], [1, 3, 2]]

Explanation
Solution solution = new Solution([1, 2, 3]);
solution.shuffle();    // Shuffle the array [1,2,3] and return its result.
                       // Any permutation of [1,2,3] must be equally likely to be returned.
                       // Example: return [3, 1, 2]
solution.reset();      // Resets the array back to its original configuration [1,2,3]. Return [1, 2, 3]
solution.shuffle();    // Returns the random shuffling of array [1,2,3]. Example: return [1, 3, 2]
```

**`Code:`**
`O(N)`
```javascript
/**
 * @param {number[]} nums
 */
var Solution = function(nums) {
  this.array = nums;
};

/**
 * @return {number[]}
 */
Solution.prototype.reset = function() {
  return this.array;
};

/**
 * @return {number[]}
 */
Solution.prototype.shuffle = function() {
  let res = [...this.array];
  for (let i = 0; i < res.length; i++) {
    const r = ~~(Math.random() * (res.length - i) + i);
    [res[i], res[r]] = [res[r], res[i]];
  }
  return res;
};

/**
 * Your Solution object will be instantiated and called as such:
 * var obj = new Solution(nums)
 * var param_1 = obj.reset()
 * var param_2 = obj.shuffle()
 */
```