---
title: Leetcode 724 - Find Pivot Index
date: 2021-12-24 19:47:33
tags:
---
**`Note:`**
- Use `presum[]` to accelerate the process of looking up presums.

**`Question:`**

Given an array of integers `nums`, calculate the pivot index of this array.

The `pivot index` is the index where the sum of all the numbers strictly to the left of the index is equal to the sum of all the numbers strictly to the index's right.

If the index is on the left edge of the array, then the left sum is `0` because there are no elements to the left. This also applies to the right edge of the array.

Return the `leftmost pivot index`. If no such index exists, return `-1`.

**`Example:`**
```
Input: nums = [1,7,3,6,5,6]
Output: 3
Explanation:
The pivot index is 3.
Left sum = nums[0] + nums[1] + nums[2] = 1 + 7 + 3 = 11
Right sum = nums[4] + nums[5] = 5 + 6 = 11
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var pivotIndex = function(nums) {
  const preSum = generatePresum(nums);
  const length = nums.length;
  for (let i = 0; i <nums.length; i++) {
    const prev = preSum[i - 1] !== undefined ? preSum[i - 1] : 0;
    if (prev === preSum[length - 1] - preSum[i]) return i;
  }
  return -1;

  function generatePresum(arr) {
    let presum = [...new Array(arr.length).fill(0)];
    for (let i = 0; i < arr.length; i++) {
      const prev = presum[i - 1] !== undefined ? presum[i - 1] : 0;
      presum[i] = prev + arr[i];
    }
    return presum;
  }
};
```