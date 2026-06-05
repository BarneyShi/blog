---
title: Leetcode 395- Longest substring with at least K repeating characters
date: 2021-11-17 19:29:58
tags:
- divide and conquer
---
**`Note:`**
- In every iteration, iterate once from `start` to `end` and mark frequencies. If a letter appears more than once but less than `k`, do a `DFS`.
- How should we know where to set as the `beginning` of our `DFS`.
- Set a var `tmp`. It tells us where the last `unqualified` letter is.
- Every time we've started an iteration, add `1` to tmp.
- The tricky part is case like `aaaaaaaaabbbcccccddddd`. If you do the above, the result will be `9` instead of `10`. It's because our algo won't do a search on `cccccddddd`.
- Why is that? Coz we would only start a DFS when `cuttingPoints.has(s[i])`. But the whole `cccccddddd` is qualified, so it won't invoke a DFS.
- As you can see, we need a final check in the end. `if (tmp < end) dfs(s, tmp, end, k);`.
Do a last DFS if `tmp` didn't hit the end.

**`Question:`**

Given a string `s` and an integer `k`, return the length of the longest substring of `s` such that the frequency of each character in this substring is greater than or equal to `k`.

**`Example:`**
```
Input: s = "aaabb", k = 3
Output: 3
Explanation: The longest substring is "aaa", as 'a' is repeated 3 times.
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @param {number} k
 * @return {number}
 */
 var longestSubstring = function(s, k) {
  let res = 0;
  dfs(s, 0, s.length - 1, k);
  return res;
  
  function dfs(s, start, end, k) {
    if (start > end) return;
    let letters = [...Array(26).fill(0)];
    for (let i = start; i <= end; i++) {
      letters[s[i].charCodeAt(0) - 97]++;
    }
    if (letters.every(e => e === 0 || e >= k)) {
      res = Math.max(res, end - start + 1);
      return;
    }
    let cuttingPoints = new Set();
    for (let i = 0; i < letters.length; i++) {
      if (letters[i] !== 0 && letters[i] < k) {
        // Quick way to get the letter without extra space
        const letter = String.fromCharCode(i + 97);
        cuttingPoints.add(letter);
      }
    }
    let tmp = 0;
    for (let i = start; i <= end; i++) {
      if (cuttingPoints.has(s[i])) {
        dfs(s, tmp, i - 1, k);
        tmp = i + 1;
      }
    }
    if (tmp < end) dfs(s, tmp, end, k);
  }
};
```