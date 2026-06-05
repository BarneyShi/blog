---
title: Leetcode 153 - Find Min in rotated array
date: 2021-11-29 22:38:06
tags:
- binary search
---
**`Note:`**
- Use `binary search` so we can finish it with `O(logn)`.
- Use `nums[mid] > nums[right]` to check which part the mid is in.
- If yes, it means we have to move `left` pointer to `mid + 1`.
- If not, in case `nums[mid]` is the answer, we need to do `right = mid`.
  - For example, in `[4,5,1,2,3]`, nums[mid] = 1 < 3. If we do `right = mid - 1`, we'd miss the ans.

**`Question:`**

Suppose an array of length `n` sorted in ascending order is rotated between `1` and `n` times. For example, the array nums = `[0,1,2,4,5,6,7]` might become:

- `[4,5,6,7,0,1,2]` if it was rotated 4 times.
- `[0,1,2,4,5,6,7]` if it was rotated 7 times.

Notice that rotating an array `[a[0], a[1], a[2], ..., a[n-1]]` 1 time results in the array `[a[n-1], a[0], a[1], a[2], ..., a[n-2]]`.

Given the sorted rotated array `nums` of unique elements, return the minimum element of this array.

You must write an algorithm that runs in `O(log n)` time.

**`Example:`**
```
Input: nums = [3,4,5,1,2]
Output: 1
Explanation: The original array was [1,2,3,4,5] rotated 3 times.
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var findMin = function(nums) {
  let left = 0, right = nums.length - 1;
  if (nums[left] <= nums[right]) return nums[left];
  while (left < right) {
    const mid = ~~((left + right) / 2);
    if (nums[mid] > nums[right]) {
      left = mid + 1;
    } else {
      right = mid;
    }
  }
  return nums[left];
};
```