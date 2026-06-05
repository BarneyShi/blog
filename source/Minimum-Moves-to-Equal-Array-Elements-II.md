---
title: Leetcode 462 - Minimum Moves to Equal Array Elements II
date: 2021-12-28 23:44:24
tags:
- double pointer
- math
---
**`Note:`**
- Math knowledge: for `[a, b]`, find a num that has the shortest distance to both nums. It must be `between` a and b.
- Now we have `len / 2` pairs, ofc we need to `sort` them first, then find the `median`.
- The median must be a num that is between every pair!
- When len is odd, it's the middle num.
- When len is even, it's the average of the 2 middle nums.

**`Question:`**

Given an integer array `nums` of size `n`, return the minimum number of moves required to make all array elements equal.

In one move, you can increment or decrement an element of the array by 1.

Test cases are designed so that the answer will fit in a `32-bit` integer.

**`Example:`**
```
Input: nums = [1,2,3]
Output: 2
Explanation:
Only two moves are needed (remember each move increments or decrements one element):
[1,2,3]  =>  [2,2,3]  =>  [2,2,2]
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var minMoves2 = function(nums) {
  nums.sort((a, b) => a - b);
  let ans = 0;
  let left = 0, right = nums.length - 1;
  const isEven = nums.length % 2 === 0;
  const target = isEven ? Math.floor((nums[left] + nums[right]) / 2) : nums[nums.length >> 1];
  while(left < right) {
    ans += nums[right] - nums[left];
    left++;
    right--;
  }
  if (left === right) {
    ans += target - nums[left];
  }
  return ans;
};
```