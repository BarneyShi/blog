---
title: Leetcode 239 - Sliding window max
date: 2021-10-10 01:53:34
tags:
- monotonic stack
---
**`Note:`**
- This is a typical `monotonic` problem.
- To always know the max of current window, we need to main a queue in `descending order`.
- Store `index` instead of `value` in the queue because we need to check if `max` is located in window or not.

**`Question:`**

You are given an array of integers nums, there is a sliding window of size k which is moving from the very left of the array to the very right. You can only see the k numbers in the window. Each time the sliding window moves right by one position.

Return the max sliding window.

**`Example:`**
```
Input: nums = [1,3,-1,-3,5,3,6,7], k = 3
Output: [3,3,5,5,6,7]
Explanation: 
Window position                Max
---------------               -----
[1  3  -1] -3  5  3  6  7       3
 1 [3  -1  -3] 5  3  6  7       3
 1  3 [-1  -3  5] 3  6  7       5
 1  3  -1 [-3  5  3] 6  7       5
 1  3  -1  -3 [5  3  6] 7       6
 1  3  -1  -3  5 [3  6  7]      7
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number[]}
 */
var maxSlidingWindow = function(nums, k) {
  let queue = [];
  let result = [];
  for (let i = 0; i < nums.length; i++) {
    // Start from the end, if the value < nums[i], pop it until all values left are bigger than nums[i];
    while (queue.length && nums[i] >= nums[queue[queue.length - 1]]) {
      queue.pop();
    }

    // Push current index
    queue.push(i);
    // Check if `max` is out of window. If yes, shift it.
    if (queue[0] <= i - k) {
      queue.shift();
    }
    // Only start pushing index after index `k-1`.
    if (i >= k - 1) {
      result.push(nums[queue[0]]);
    }
  }
  return result;
};
```