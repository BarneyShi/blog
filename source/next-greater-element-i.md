---
title: Leetcode 496 - Next greater element I
date: 2021-10-25 22:12:28
tags:
- array
- monotonic stack
---
**`Note:`**
- `Monotone stack`
  - Iterate `backwards`.
  - For each `nums2[i]`, if stack is not empty. It means the last element if `monostack` is the first element that is greater than nums2[i]. Otherwise, no element is greater than it.
  - Use a `map` to store the greater element, so we don't need to reiterate monostack again.

**`Question:`**

The next greater element of some element x in an array is the first greater element that is to the right of x in the same array.

You are given two distinct 0-indexed integer arrays nums1 and nums2, where nums1 is a subset of nums2.

For each `0 <= i < nums1.length`, find the index `j` such that `nums1[i] == nums2[j]` and determine the next greater element of nums2[j] in nums2. If there is no next greater element, then the answer for this query is `-1`.

Return an array ans of length nums1.length such that ans[i] is the next greater element as described above.

**`Example:`**
```
Input: nums1 = [4,1,2], nums2 = [1,3,4,2]
Output: [-1,3,-1]
Explanation: The next greater element for each value of nums1 is as follows:
- 4 is underlined in nums2 = [1,3,4,2]. There is no next greater element, so the answer is -1.
- 1 is underlined in nums2 = [1,3,4,2]. The next greater element is 3.
- 2 is underlined in nums2 = [1,3,4,2]. There is no next greater element, so the answer is -1.
```

**`Code:`**
**`Monotone stack`**
```javascript
/**
 * @param {number[]} nums1
 * @param {number[]} nums2
 * @return {number[]}
 */
var nextGreaterElement = function(nums1, nums2) {
  let map = new Map();
  let monoStack = [];
  for (let i = nums2.length - 1; i >= 0; i--) {
    while (monoStack.length > 0 && monoStack[monoStack.length - 1] < nums2[i]) {
      monoStack.pop();
    }
    map.set(nums2[i], monoStack.length ? monoStack[monoStack.length - 1] : -1);
    monoStack.push(nums2[i]);
  }
  let res = [...Array(nums1.length).fill(-1)];
  for (let i = 0; i < res.length; i++) {
    res[i] = map.get(nums1[i]);
  }
  return res;
};
```


**`Brute Force O(n^2)`**
```javascript
/**
 * @param {number[]} nums1
 * @param {number[]} nums2
 * @return {number[]}
 */
var nextGreaterElement = function(nums1, nums2) {
  let result = [...Array(nums1.length).fill(-1)];
  for (let i = 0; i < nums1.length; i++) {
    const index = nums2.indexOf(nums1[i]);
    for (let j = index; j < nums2.length; j++) {
      if (nums2[j] > nums1[i]) {
        result[i] = nums2[j];
        break;
      }
    }
  }
  return result;
};
```