---
title: Leetcode 131 - Palindrome partitioning
date: 2021-09-11 00:43:49
tags:
- dfs
- backtracking
---
**`Note:`**
- This is a backtracking problem.
- Need a helper `isPalindrome`
- We need to pass a param `startIndex` as usual, and `[startIndex, i]` is just what we got by spliting.
![img](https://code-thinking.cdn.bcebos.com/pics/131.%E5%88%86%E5%89%B2%E5%9B%9E%E6%96%87%E4%B8%B2.jpg)

Given a string s, partition s such that every substring of the partition is a palindrome. Return all possible palindrome partitioning of s.

A palindrome string is a string that reads the same backward as forward.

**Example:**
```
Input: s = "aab"
Output: [["a","a","b"],["aa","b"]]
```

```javascript
/**
 * @param {string} s
 * @return {string[][]}
 */
var partition = function(s) {
  let path = [];
  let result = [];
  backtracking(0);
  return result;

  function backtracking(index) {
    if (index >= s.length) {
      result.push([...path]);
      return;
    }

    for (let i = index; i < s.length; i++) {
      if (isPalindrome(index, i)) {
        path.push(s.slice(index, i+1));
        backtracking(i+1);
        path.pop();
      }
    }
  }

  function isPalindrome(start, end) {
    let left = start;
    let right = end;
    while (left < right) {
      if (s[left] !== s[right]) return false;
      left++;
      right--;
    }
    return true;
  }


};
```
