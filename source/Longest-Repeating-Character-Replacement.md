---
title: Leetcode 424 - Longest Repeating Character Replacement
date: 2021-12-18 23:27:15
tags:
- sliding window
---
**`Note:`**
- Should have thought of `sliding window`. (It targets most likely for `string` or `array`)
- Why? Because between a certain length of `substr`, there are some repetitive chars and other chars that can be replaced. It just sounds like a sliding window question.
- Use a generic sliding window template to solve this.
- Use an array to store the number of each char.
- When `right - left + 1 - Math.max(...alphabets) > k`, it means even if we exhaust all `k`s, there will still be extra chars. So we need to move `left`.
- At the end, update `ans`.

**`Question:`**

You are given a string `s` and an integer `k`. You can choose any character of the string and change it to any other uppercase English character. You can perform this operation at most `k` times.

Return the length of the longest substring containing the same letter you can get after performing the above operations.

**`Example:`**
```
Input: s = "AABABBA", k = 1
Output: 4
Explanation: Replace the one 'A' in the middle with 'B' and form "AABBBBA".
The substring "BBBB" has the longest repeating letters, which is 4.
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @param {number} k
 * @return {number}
 */
 var characterReplacement = function(s, k) {
  let ans = 0;
  let alphabets = [...new Array(26).fill(0)];
  let left = 0, right = 0;
  while (right < s.length) {
    alphabets[s[right].charCodeAt() - 'A'.charCodeAt()]++;
    while (right - left + 1 - Math.max(...alphabets) > k) {
      alphabets[s[left].charCodeAt() - 'A'.charCodeAt()]--;
      left++;
    }
    ans = Math.max(ans, right - left + 1);
    right++;
  }
  return ans;
};
```