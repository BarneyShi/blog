---
title: Leetcode 128 - Longest consecutive sequence
date: 2021-11-12 03:15:52
tags:
- hash table
---
**`Note:`**
- `Search` in Set only takes O(1), so we can use it.
- How do we start counting the LCS? - Find the beginning first!
- When `set` has `num-1`, it means the cur is not the start. If we count now, we'll have to repeat it again when we find the real start. So skip it!
- WHen there is no `num-1`, start counting it!
- What's the time complexity?
  - In the outer `for-loop`, you will iterate every num `once`.
  - In the `while` loop, because we make sure that we `only start from the head of LCS`, we will also iterate every num in the current subsequence `once`.
  - Every element will be iterated twice, so it's `O(2n)`, which is `O(n)`.

**`Question:`**

Given an unsorted array of integers `nums`, return the length of the longest consecutive elements sequence.

You must write an algorithm that runs in `O(n)` time.

**`Example:`**
```
Input: nums = [100,4,200,1,3,2]
Output: 4
Explanation: The longest consecutive elements sequence is [1, 2, 3, 4]. Therefore its length is 4.
```

**`Code:`**
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var longestConsecutive = function(nums) {
  let res = 0;
  let set = new Set(nums);
  for (const num of nums) {
    if (!set.has(num - 1)) {
      let cur = num;
      let count = 1;
      while (set.has(cur + 1)) {
        cur++;
        count++;
      }
      res = Math.max(res, count);
    }
  }
  return res;
};
```