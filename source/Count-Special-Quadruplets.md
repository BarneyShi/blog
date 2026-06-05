---
title: Leetcode 1995 - Count Special Quadruplets
date: 2021-12-28 17:45:00
tags:
---
**`Note:`**
- Use brute force with $O(n^4)$ .
- Or iterate backwards for `c` while checking `count[a + b + c]` is `0` or not. If yes, add the count to ans. Add every `c` to count[c] cuz those are our `d`s for later uses.

**`Question:`**

Given a `0-indexed` integer array `nums`, return the number of distinct quadruplets `(a, b, c, d)` such that:

- `nums[a] + nums[b] + nums[c] == nums[d]`, and
- `a < b < c < d`

**`Example:`**
```
Input: nums = [1,1,1,3,5]
Output: 4
Explanation: The 4 quadruplets that satisfy the requirement are:
- (0, 1, 2, 3): 1 + 1 + 1 == 3
- (0, 1, 3, 4): 1 + 1 + 3 == 5
- (0, 2, 3, 4): 1 + 1 + 3 == 5
- (1, 2, 3, 4): 1 + 1 + 3 == 5
```

**`Code:`**

$O(n^3)$
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var countQuadruplets = function(nums) {
  let ans = 0;
  let count = [...new Array(300).fill(0)];
  for (let c = nums.length - 1; c > 1; c--) {
    for (let b = c - 1; b > 0; b--) {
      for (let a = b - 1; a >= 0; a--) {
        if (count[nums[a] + nums[b] + nums[c]]) ans += count[nums[a] + nums[b] + nums[c]];
      }
    }
    count[nums[c]]++;
  }
  return ans;
};
```

$O(n^4)$
```javascript
/**
 * @param {number[]} nums
 * @return {number}
 */
var countQuadruplets = function(nums) {
  let ans = 0;
  for (let d = nums.length - 1; d > 2; d--) {
    for (let c = d - 1; c > 1; c--) {
      for (let b = c - 1; b > 0; b--) {
        for (let a = b - 1; a >= 0; a--) {
          if (nums[a] + nums[b] + nums[c] === nums[d]) ans++;
        }
      }
    }
  }
  return ans;
};
```