---
title: Leetcode 139 - Word break
date: 2021-09-18 01:26:19
tags:
- dfs
- dp
- backtracking
---
**`DP`**
- This is a `complete knapsack` problem.
- The DP deduction is `DP[j] = isValid(word) && DP[j-word]`
- We'd better iterate `j` (backpack) first because we care about the `order of elements`.

**`Backtracking`**
- Easier to come up with a solution but we have to optimize, otherwise TLE.
- Use `memo[startIndex]` (This is particularly useful to result that is `false`, for example: `"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaab", ["a","aa","aaa","aaaa","aaaaa","aaaaaa","aaaaaaa","aaaaaaaa","aaaaaaaaa","aaaaaaaaaa"]`)
  - By quickly remembering `backtracking(startIndex) == false`, we can quickly terminate unuseful recursions.
- Note that `memo[i]` is wrong. (Btw `i` is not accessbile outside of the `forloop`).

Given a string s and a dictionary of strings wordDict, return true if s can be segmented into a space-separated sequence of one or more dictionary words.

Note that the same word in the dictionary may be reused multiple times in the segmentation.

**Example**

```
1.
Input: s = "leetcode", wordDict = ["leet","code"]
Output: true
Explanation: Return true because "leetcode" can be segmented as "leet code".

2.
Input: s = "catsandog", wordDict = ["cats","dog","sand","and","cat"]
Output: false
```
**`DP`**
```javascript
/**
 * @param {string} s
 * @param {string[]} wordDict
 * @return {boolean}
 */
var wordBreak = function(s, wordDict) {
  let dp = [...Array(s.length + 1).fill(false)];
  dp[0] = true;
  for (let j = 0; j <= s.length; j++) {
    for (let i = 0; i < wordDict.length; i++) {
      if (j >= wordDict[i].length) {
        if (wordDict.includes(s.slice(j - wordDict[i].length, j)) && dp[j - wordDict[i].length]) {
          dp[j] = true;
        }
      }
    }
  }
  return dp[s.length];
};
```
**`Backtracking`**
```javascript
/**
  * @param {string} s
  * @param {string[]} wordDict
  * @return {boolean}
  */
var wordBreak = function(s, wordDict) {
  let ans = [];
  let path = [];
  let memo = [];
  backtracking(0);
  return ans.length !== 0;

  function backtracking(startIndex) {
    if (path.join('').length === s.length) {
      ans.push([...path]);
    }
    if (memo[startIndex] === false) {
      return;
    }
    for (let i = startIndex; i < s.length; i++) {
      let str = s.substring(startIndex, i+1);
      if (!wordDict.includes(str)) {
        memo[startIndex] = false;
        continue; 
      }
      path.push(str);
      backtracking(i+1);
      path.pop();
    }
  }
};
```