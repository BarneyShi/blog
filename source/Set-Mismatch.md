---
title: Leetcode 645 - Set Mismatch
date: 2021-12-12 21:37:18
tags:
---
**`Note:`**
- Sort first so we can find the duplicates.
- While iterating, find `sum` and the duplicates.
- The sum was supposed to be `(1 + n) * n / 2`.
- The diff between `correctSum` and `sum` is how much we should add to the `duplicates`.
- And that's the missing num.

**`Question:`**

You have a set of integers `s`, which originally contains all the numbers from `1` to `n`. Unfortunately, due to some error, one of the numbers in `s` got duplicated to another number in the set, which results in `repetition` of one number and loss of another number.

You are given an integer array `nums` representing the data status of this set after the error.

Find the number that occurs twice and the number that is missing and return them in the form of an array.

**`Example:`**
```
Input: nums = [1,2,2,4]
Output: [2,3]
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number[]}
 */
var findErrorNums = function (nums) {
  nums.sort((a, b) => a - b);
  const n = nums.length;
  let ans = [0, 0];
  let sum = 0;
  for (let i = 0; i < nums.length; i++) {
    if (nums[i] === nums[i + 1]) ans[0] = nums[i];
    sum += nums[i];
  }
  ans[1] = ((1 + n) * n / 2) + ans[0] - sum;
  return ans;
};
```