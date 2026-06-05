---
title: Leetcode 55 - Jump game
date: 2021-10-05 01:07:28
tags:
- greedy
- dp
---
**`Note:`**
- `Greedy`
  - For each element, get the `furthest` index you can reach and `update` the limit of for loop. If `index >= length - 1`, means we can get to the end.
- `DP`
  - `dp[i]` means the `furthest index` you can get from position `i`. 
    - (Note: it's not how many steps you can take the most, it's the `INDEX`)
  - When `dp[i-1] > i`, it means from `i-1`, we can get to `i` or even further. So, we need to pick the bigger one

You are given an integer array nums. You are initially positioned at the array's `first index`, and each element in the array represents your maximum jump length at that position.

Return true if you can reach the last index, or false otherwise.

**Example**
```
Input: nums = [2,3,1,1,4]
Output: true
Explanation: Jump 1 step from index 0 to 1, then 3 steps to the last index.
```

**`Greedy`**
```javascript
/**
 * @param {number[]} nums
 * @return {boolean}
 */
var canJump = function(nums) {
  let distance = nums[0];
  for (let i = 0; i <= distance; i++) {
    distance = Math.max(nums[i] + i, distance);
    if (distance >= nums.length - 1) return true;
  }
  return false;
};
```

**`DP`**
```javascript
/**
 * @param {number[]} nums
 * @return {boolean}
 */
var canJump = function(nums) {
  let dp = [...Array(nums.length).fill(0)];
  dp[0] = nums[0];
  if (dp[0] >= nums.length - 1) return true;
  for (let i = 1; i < nums.length; i++) {
    if (dp[i-1] >= i) {
      dp[i] = Math.max(dp[i-1], nums[i] + i);
    }
    if (dp[i] === 0) return false;
  }
  return true;
};
```

**`DFS`**
```javascript
/**
 * @param {number[]} nums
 * @return {boolean}
 */
var canJump = function(nums) {
  let visited = Array(nums.length);
  return dfs(0);
  
  function dfs(index) {
    if (index === nums.length - 1) return true;
    if (nums[index] === 0) return false;
    if (visited[index] !== undefined) {
      return visited[index];
    }
    for (let i = 1; i <= nums[index]; i++) {
      if (index + i < nums.length && dfs(index + i)) {
        return true;
      }
    }
    visited[index] = false;
    return false;
  }
};
```