---
title: Leetcode 216 - Combination sum III
date: 2021-09-08 01:54:15
tags:
- dfs
- backtracking
---
**`Note:`**
- This is a `backtracking` problem even though it can be solve using `dp`, but it's kinda hard.

Find all valid combinations of k numbers that sum up to n such that the following conditions are true:

Only numbers 1 through 9 are used.
Each number is used at most once.
Return a list of all possible valid combinations. The list must not contain the same combination twice, and the combinations may be returned in any order.

**Example:**
```
Input: k = 3, n = 7
Output: [[1,2,4]]
Explanation:
1 + 2 + 4 = 7
There are no other valid combinations.
```

```javascript
/**
 * @param {number} k
 * @param {number} n
 * @return {number[][]}
 */
var combinationSum3 = function(k, n) {
  let path = [];
  let ans = [];
  backtracking(0, n, k, 1);
  return ans;
  
  
  function backtracking(curSum, targetSum, k, startIndex) {
    if (path.length === k) {
      // End iteration earlier
      if (curSum > targetSum) return;
      
      if (curSum === targetSum) {
        ans.push([...path]);
      }
      return;
    }
    
    for (let i = startIndex; i <= 9; i++) {
      curSum += i;
      path.push(i);
      backtracking(curSum, n, k, i + 1);
      curSum -= i;
      path.pop();
    }
  }
};
```