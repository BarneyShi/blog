---
title: Leetcode 72 - Edit distance
date: 2021-09-23 02:33:25
tags:
- dp
---
**`Note`**
- `dp` question.
- `dp[i][j]` means the `min operations` to convert `word1 [0, i-1]` to `word2 [0, j-1]`. (Techinique we used before: iterate from `i=1` and `j=1`)
- How to initialize `dp[i][0]` and`dp[0][j]`? We can't just initialize them all to `0`. `dp[i][0]` means the min operations to convert `word1 [0, i-1]` to an empty string. So, apparently, `dp[i][0] = i`. Likewise, `dp[0][j] = j`.
- For dp deduction, there are `2` situations:
  - When `word1[i-1] === word2[j-1]`, these 2 chars are the same, so `dp[i][j] = dp[i-1][j-1]`
  - When `word1[i-1] !== word2[j-1]`, there are **`3`** kinds of operations:
    - Replace: `dp[i][j] = dp[i-1][j-1] + 1`
    - Add/Delete: Convert `word1 [0, i-2]` to `word2 [0, i-1]` or vice versa.
      - `dp[i][j-1] + 1` Or `dp[i-1][j] + 1`. When to convert a longer one to a short one, it's `deletion`. In the reverse way, it's `addition`. 

![img](https://i.imgur.com/VVJHuf5.png)

Given two strings word1 and word2, return the minimum number of operations required to convert word1 to word2.

You have the following three operations permitted on a word:

- Insert a character
- Delete a character
- Replace a character

**Example**
```
Input: word1 = "horse", word2 = "ros"
Output: 3
Explanation: 
horse -> rorse (replace 'h' with 'r')
rorse -> rose (remove 'r')
rose -> ros (remove 'e')
```

```javascript
/**
 * @param {string} word1
 * @param {string} word2
 * @return {number}
 */
var minDistance = function(word1, word2) {
  if (word1.length === 0) return word2.length;
  if (word2.length === 0) return word1.length;
  let dp = [...Array(word1.length+1)].map(e => Array(word2.length+1).fill(0));
  // Initialize
  for (let i = 0; i <= word1.length; i++) {
    dp[i][0] = i;
  }
  for (let j = 0; j <= word2.length; j++) {
    dp[0][j] = j;
  }
  for (let i = 1; i <= word1.length; i++) {
    for (let j = 1; j <= word2.length; j++) {
      if (word1[i-1] === word2[j-1]) {
        dp[i][j] = dp[i-1][j-1];
      } else {
        dp[i][j] = Math.min(dp[i][j-1] + 1, dp[i-1][j] + 1, dp[i-1][j-1] + 1);
      }
    }
  }
  return dp[word1.length][word2.length];
};
```