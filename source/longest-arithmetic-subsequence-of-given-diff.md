---
title: Leetcode 1218 - Longest arithmetic subsequence of given diff
date: 2021-11-04 22:15:21
tags:
---
**`Note:`**
- `dp[i]` is the longest length ending with `arr[i]`.
- But if we use normal DP, there will be a double for loop, which leads to TLE.
- Because we are looking for an `arithmetic progression`. We can know what the `prev num` should be by `cur num`. 
- If we use a `map` to store each other, then we can know if `map.get(cur - diff)` exist or not.
- This saves us lots of time.

**`Question:`**

Given an integer array `arr` and an integer `difference`, return the length of the longest subsequence in arr which is an arithmetic sequence such that the difference between adjacent elements in the subsequence equals difference.

A subsequence is a sequence that can be derived from arr by deleting some or no elements without changing the order of the remaining elements.

**`Example:`**
```
Input: arr = [1,3,5,7], difference = 1
Output: 1
Explanation: The longest arithmetic subsequence is any single element.

Input: arr = [1,5,7,8,5,3,4,2,1], difference = -2
Output: 4
Explanation: The longest arithmetic subsequence is [7,5,3,1].
```

**`Code:`**
```javascript
/**
 * @param {number[]} arr
 * @param {number} difference
 * @return {number}
 */
var longestSubsequence = function (arr, difference) {
  let dp = [...Array(arr.length).fill(1)];
  let map = new Map();
  let res = 0;
  for (let i = 0; i < arr.length; i++) {
    if (!map.has(arr[i] - difference)) {
      map.set(arr[i], 1);
      dp[i] = 1;
    } else {
      dp[i] = map.get(arr[i] - difference) + 1;
      map.set(arr[i], map.get(arr[i] - difference) + 1);
    }
    res = Math.max(res, dp[i]);
  }
  return res;
};
```