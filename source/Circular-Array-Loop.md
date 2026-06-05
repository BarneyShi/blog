---
title: Leetcode 457 - Circular Array Loop
date: 2021-12-28 21:41:37
tags:
- dfs
---
**`Note:`**
- DFS
  - choose an `i`, start from it and document the `path` in a set. Also mark the `direction` with a bool.
  - If next index appears in `path`, check if the path is `length > 1`.
  - If `curr index` is in `visited[]`, then it must be `false`.
  - If nums[i] is positive but direction is false, then it means the curr path is `false`. 
  - Move to next start index in the for loop.
  - Note that `nums[i]` might be bigger than `length`, so we need `nums[i] % length` sometimes.
  - Note that `i + nums[i]` might be bigger than length or smaller than `0`, we need to map that to an index within the length of nums.

**`Question:`**

You are playing a game involving a circular array of non-zero integers `nums`. Each `nums[i]` denotes the number of indices forward/backward you must move if you are located at index `i`:

- If `nums[i]` is positive, move `nums[i]` steps forward, and
- If `nums[i]` is negative, move `nums[i]` steps backward.

Since the array is circular, you may assume that moving forward from the last element puts you on the first element, and moving backwards from the first element puts you on the last element.

A cycle in the array consists of a sequence of indices seq of length k where:

- Following the movement rules above results in the repeating index sequence `seq[0] -> seq[1] -> ... -> seq[k - 1] -> seq[0] -> ...`
- Every `nums[seq[j]]` is either all positive or all negative.
- k > 1

Return `true` if there is a cycle in nums, or `false` otherwise.

**`Example:`**
```
Input: nums = [2,-1,1,2,2]
Output: true
Explanation:
There is a cycle from index 0 -> 2 -> 3 -> 0 -> ...
The cycle's length is 3.

Input: nums = [-2,1,-1,-2,-2]
Output: false
Explanation:
The sequence from index 1 -> 2 -> 1 -> ... is not a cycle because nums[1] is positive, but nums[2] is negative.
Every nums[seq[j]] must be either all positive or all negative.

Input: nums = [-1,2]
Output: false
Explanation:
The sequence from index 1 -> 1 -> 1 -> ... is not a cycle because the sequence's length is 1.
By definition the sequence's length must be strictly greater than 1 to be a cycle.
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {boolean}
 */
 var circularArrayLoop = function(nums) {
  const path = new Set();
  let visited = {};
  for (let i = 0; i < nums.length; i++) {
    path.clear();
    if (dfs(i, path, nums[i] > 0)) return true;
  }
  return false;

  function dfs(startIndex, path, isForward) {
    const nextStep = isForward ? startIndex : -startIndex;
    if (path.has(nextStep)) {
      let arr = Array.from(path);
      const index = arr.indexOf(nextStep);
      return arr.length - index > 1;
    }
    if (visited[startIndex] !== undefined) return visited[startIndex];
    path.add(nextStep);
    if (isForward && nums[startIndex] < 0 || !isForward && nums[startIndex] > 0) {
      return false;
    }
    visited[startIndex] = false;
    startIndex += nums[startIndex] % nums.length;
    if (startIndex >= nums.length) startIndex -= nums.length;
    if (startIndex < 0) startIndex += nums.length;
    const ans = dfs(startIndex, path, isForward);
    return ans; 
  }
};
```