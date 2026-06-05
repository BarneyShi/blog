---
title: Leetcode 647 - Palindromic substrings
date: 2021-09-24 02:26:55
tags:
- dp
---
**`Note`**
- DP
  - `dp[i][j]` means `s[i - j]` is a palindrome string.
  - When `s[i] == s[j]`
    - When the length of `s[i, j]` is 1 or 2. For example, `a` or `aa`, it must be a palindrome.
    - When the length of `s[i, j]` is bigger than 2, it then depends on `s[i+1, j-1]`, which is `dp[i+1][j-1]`. It also means that we need to iterate `i` from big to small.
    - ![img](https://i.imgur.com/SBV1WFV.png)

Given a string s, return the number of palindromic substrings in it.

A string is a palindrome when it reads the same backward as forward.

A substring is a contiguous sequence of characters within the string.

**Example**
```
Input: s = "abc"
Output: 3
Explanation: Three palindromic strings: "a", "b", "c".
```

**`Brute Force`**
```javascript
/**
 * @param {string} s
 * @return {number}
 */
var countSubstrings = function(s) {
  if (s.length === 1) return 1;
  let result = 1;
  for (let i = 1; i < s.length; i++) {
    for (let j = 0; j <= i; j++) {
      let str = s.slice(j, i + 1);
      if (isPalindrome(str)) {
        result++; 
      }
    }
  }
  return result;
};

function isPalindrome(str) {
  let left = 0, right = str.length-1;
  while (left < right) {
    if (str[left++] !== str[right--]) {
      return false;
    }
  }
  return true;
}
```

**`DP`**
```javascript
/**
 * @param {string} s
 * @return {number}
 */
var countSubstrings = function(s) {
  if (s.length === 1) return 1;
  let result = 0;
  let dp = [...Array(s.length)].map(e => Array(s.length).fill(false));
  for (let i = s.length - 1; i >= 0; i--) {
    for (let j = i; j < s.length; j++) {
      if (s[i] === s[j]) {
        if (j - i <= 1) {
          result++;
          dp[i][j] = true;
        } else if (dp[i+1][j-1]) {
          result++;
          dp[i][j] = true;
        }
      }
    }
  }
  return result;
}
```