---
title: Leetcode 453 - Min moves to equal array elements
date: 2021-10-19 16:44:40
tags:
- array
---
**`Note:`**
- You know this is an easy question and you know you got something wrong when getting a TLE.
- Increment `n-1` items by `1` is equal to decrement `one` item by 1.
  - Find the min and `add up` all diff of every item between min.

**`Question:`**

Given an integer array nums of size n, return the minimum number of moves required to make all array elements equal.

In one move, you can `increment n - 1` elements of the array by 1.

**`Example:`**
```
Input: nums = [1,2,3]
Output: 3
Explanation: Only three moves are needed (remember each move increments two elements):
[1,2,3]  =>  [2,3,3]  =>  [3,4,3]  =>  [4,4,4]
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var minMoves = function(nums) {
  const min = Math.min(...nums);
  let result = 0;
  for (let num of nums) {
    result += num - min;
  }
  return result;
};
```

**`Method TLE`**
```javascript
var minMoves = function(nums) {
  let count = 0;
  let max = Math.max(...nums);
  let min = Math.min(...nums);
  let diff = max - min;
  while (diff !== 0) {
    const indexOfMax = nums.indexOf(max);
    nums = incrementArr(nums, diff, indexOfMax);
    count += diff;
    max = Math.max(...nums);
    min = Math.min(...nums);
    diff = max - min;
  }
  return count;
};
function incrementArr(nums, diff, index) {
  let result = [...nums];
  for (let i = 0; i < nums.length; i++) {
    if (i === index) continue;
    result[i] += diff;
  }
  return result;
}
```