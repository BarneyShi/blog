---
title: Leetcode 977 - Squares of a sorted array
date: 2021-08-23 22:34:14
tags:
  - leetcode
  - array
  - double pointers
---

Given an integer array nums sorted in non-decreasing order, return an array of the squares of each number sorted in non-decreasing order.

Example 1:

```

Input: nums = [-4,-1,0,3,10]
Output: [0,1,9,16,100]
Explanation: After squaring, the array becomes [16,1,0,9,100].
After sorting, it becomes [0,1,9,16,100].
```

Example 2:

```
Input: nums = [-7,-3,2,3,11]
Output: [4,9,9,49,121]
```

**Note:** It's very easy to come up with a brute force way. But double pointers is fancier.

```javascript
/**
 * @param {number[]} nums
 * @return {number[]}
 */
 
/* Brute force */
var sortedSquares = function (nums) {
  const arr = nums.map((e) => e ** 2);
  return arr.sort((a, b) => a - b);
};

/* Double pointers */
var sortedSquares = function(nums) {
  let ans = [];
  // sort it first for later use.
  nums.sort((a,b) => (a - b));
  let start = 0, end = nums.length - 1;
  for (let i = nums.length - 1; i >= 0; i--) {
    if (nums[start]**2 > nums[end]**2) {
      ans[i] = nums[start++]**2; 
    } else {
      ans[i] = nums[end--]**2; 
    }
  }
  return ans;
};
```
