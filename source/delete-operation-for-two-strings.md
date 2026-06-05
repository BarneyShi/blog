---
title: Leetcode 583 - Delete operation for two strings
date: 2021-09-23 01:14:05
tags:
- dp
---
**`Note`**
- Much like the max length of `common subsequences`, find it and `subtract` it from the `sum of w1, w1`. Then you got the answer.  

Given two strings word1 and word2, return the minimum number of steps required to make word1 and word2 the same.

In one step, you can delete exactly one character in either string.

**Example**
```
Input: word1 = "sea", word2 = "eat"
Output: 2
Explanation: You need one step to make "sea" to "ea" and another step to make "eat" to "ea".
```

```javascript
/**
 * @param {string} word1
 * @param {string} word2
 * @return {number}
 */
var minDistance = function(word1, word2) {
  let dp = [...Array(word1.length+1)].map(e => Array(word2.length+1).fill(0));
  for (let i = 1; i <= word1.length; i++) {
    for (let j = 1; j <= word2.length; j++) {
      if (word1[i-1] === word2[j-1]) {
        dp[i][j] = dp[i-1][j-1] + 1;
      } else {
        dp[i][j] = Math.max(dp[i][j-1], dp[i-1][j]);
      }
    }
  }
  return word1.length + word2.length - dp[word1.length][word2.length]*2;
};
```
