---
title: Leetcode 1143 - Longest common subsequence
date: 2021-09-21 22:30:45
tags:
- leetcode
- dp
---
**`Note`**
- `dp[i][j]` means the max length of common subsequence between `text1 [0, i-1]` and `text2 [0, j-1]` (Doesn't need to end with the cur char)
  - Create an `(text1.length+1) x (text1.length+1)` dp array 
- Initialize all elements as `0`.
- To skip initializing first row/col manually, the **`techinique`** is to iterate from `i=1` and `j=1` but compare `text1[i-1]` and `text2[j-1]`. In this way, we will initialize the first row/col in our for loops.
- By checking the table we drew, it's easier to find the deduction. 
  - When `text1[i-1] === text2[j-1]`, `dp[i][j] = dp[i-1][j-1] + 1`.
  - When `text1[i-1] !== text2[j-1]`, `dp[i][j] = Math.max(dp[i-1][j], dp[i][j-1]).`
  
![img](https://i.imgur.com/TG4aCrT.png)

Given two strings text1 and text2, return the length of their longest common subsequence. If there is no common subsequence, return 0.

A subsequence of a string is a new string generated from the original string with some characters (can be none) deleted without changing the relative order of the remaining characters.

  - For example, "ace" is a subsequence of "abcde".
A common subsequence of two strings is a subsequence that is common to both strings.

**Example**
```
Input: text1 = "abcde", text2 = "ace" 
Output: 3  
Explanation: The longest common subsequence is "ace" and its length is 3.
```

```javascript
/**
 * @param {string} text1
 * @param {string} text2
 * @return {number}
 */
var longestCommonSubsequence = function(text1, text2) {
  let dp = [...Array(text1.length + 1)].map(e => Array(text2.length + 1).fill(0));

  for (let i = 1; i <= text1.length; i++) {
    for (let j = 1; j <= text2.length; j++) {
      // ** Technique**
      if (text1[i-1] === text2[j-1]) {
        dp[i][j] = dp[i-1][j-1] + 1;
      } else {
        dp[i][j] = Math.max(dp[i-1][j], dp[i][j-1]);
      }
    }
  }
  return dp[text1.length][text2.length];
};
```