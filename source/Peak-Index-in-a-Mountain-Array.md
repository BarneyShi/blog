---
title: Leetcode 852 - Peak Index in a Mountain Array
date: 2022-01-10 23:30:19
tags:
---
**`Note:`**
- Because arr is guaranteed to be a mountain array, we only need to find the first element that is bigger than both of its neighbor.

**`Question:`**

Let's call an array arr a mountain if the following properties hold:

- arr.length >= 3
- There exists some i with 0 < i < arr.length - 1 such that:
  - arr[0] < arr[1] < ... arr[i-1] < arr[i]
  - arr[i] > arr[i+1] > ... > arr[arr.length - 1]

Given an integer array arr that is guaranteed to be a mountain, return any i such that arr[0] < arr[1] < ... arr[i - 1] < arr[i] > arr[i + 1] > ... > arr[arr.length - 1].

**`Example:`**
```
Input: arr = [0,1,0]
Output: 1
```

**`Code:`**
```javascript
/**
 * @param {number[]} arr
 * @return {number}
 */
var peakIndexInMountainArray = function(arr) {
  for (let i = 1; i < arr.length - 1; i++) {
    if (arr[i] > arr[i - 1] && arr[i] > arr[i + 1]) return i;
  }
};
```