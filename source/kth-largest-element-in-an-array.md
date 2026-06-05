---
title: Leetcode 215 - Kth largest element in an array
date: 2021-11-15 16:12:48
tags:
- sort
---
**`Note:`**
- We know we need to use some sort of `sorting` algo, but which one?
- Only in quick sort do we need know a pivot that can tell us how many bigger elements than the pivot.
- We don't need to sort all elements, we need some `binary search` based on whethere `pivot` is bigger than `nums.length - k`.
- When `pivot < nums.length - k`, it means the res is located in the `right`. Then we do `quicksort(pivot + 1, right)`;

**`Question:`**

Given an integer array `nums` and an integer `k`, return the `kth` largest element in the array.

Note that it is the `kth` largest element in the sorted order, not the `kth` distinct element.

**`Example:`**
```
Input: nums = [3,2,1,5,6,4], k = 2
Output: 5
```

**`Code:`**

**`Time complexity O(N)`**

Explain: Because `N*(1/2 + 1/4 + ...) = N`
```javascript
/**
 * @param {number[]} nums
 * @param {number} k
 * @return {number}
 */
var findKthLargest = function(nums, k) {
  return quicksort(nums, 0, nums.length - 1, k);
 
  function partition(nums, left, right) {
    const start = left;
    const pivot = nums[left];
    while (left < right) {
      while (left < right && nums[right] >= pivot) {
        right--;
      }
      while (left < right && nums[left] <= pivot) {
        left++;
      }
      [nums[left], nums[right]] = [nums[right], nums[left]];
    }
    [nums[start], nums[left]] = [nums[left], nums[start]];
    return left;
  }

  function quicksort(nums, left, right, k) {
    if (nums.length <= 1) return nums;
    const pivot = partition(nums, left, right);
    if(pivot < nums.length - k) {
      return quicksort(nums, pivot + 1, right, k);
    } else if (pivot > nums.length - k) {
      return quicksort(nums, left, pivot - 1, k);
    } else {
      return nums[pivot];
    }
  }
};
```