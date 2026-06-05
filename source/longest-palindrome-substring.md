---
title: Leetcode 5 - Longest palindrome substring
date: 2021-10-21 01:47:42
tags:
- dp
- double pointers
---
**`Note:`**
- `DP`:
  - What does `dp[i][j]` should mean? Either length of palindrome or bool. But clearly, bool is the only way to obtain the longest palinrome. 
  - `dp[i][j]` means if `s[i - j]` is a palindrome.
  - Because `dp[i][j]` depends on `dp[i+1][j-1]`, we have to iterate `i` from big to small, `j` from small to big. Also, make sure `j` bigger than `i`.
  - When `j - i < 1`. Compare the length.
  - When `j - i > 1`, check `dp[i+1][j-1]`.
- `Center spread`:
  - ![img](https://i.imgur.com/cCEEGNR.png)
  - ![img](https://i.imgur.com/aU2RG4T.png)
  - For each `single` element or `two` adjacent elements, we spread the `window` if the two new nums on `left end` and `right end` are equal.
  - Because there might be both `single center` or `dual center`, we have to do twice.

**`Question:`**

Given a string s, return the longest palindromic substring in s.

**`Example:`**
```
Input: s = "babad"
Output: "bab"
Note: "aba" is also a valid answer.
```

**`Code:`**

**`Center spread O(n^2)`**
```javascript
/**
 * @param {string} s
 * @return {string}
 */
var longestPalindrome = function (s) {
  let start = 0, end = 0;
  let maxLen = 0;
  for (let i = 0; i < s.length; i++) {
    centerSpread(i, i, s);
    centerSpread(i, i + 1, s);
  }
  return s.slice(start, end + 1);

  function centerSpread(center1, center2, s) {
    while (center1 >= 0 && center2 < s.length && s[center1] === s[center2]) {
      // If statement must proceed changes to center1 and center2. Because new boundaries s[center1]. s[center2] might not be equal.
      if (center2 - center1 + 1 > maxLen) {
        start = center1;
        end = center2;
        maxLen = center2 - center1 + 1;
      }
      center1--;
      center2++;
    }
  }
};
```

**`DP, O(n^2)`**
```javascript
/**
 * @param {string} s
 * @return {string}
 */
var longestPalindrome = function (s) {
  let minStart = 0, maxEnd = 0;
  let dp = [...Array(s.length)].map(e => Array(s.length).fill(false));
  for (let i = s.length - 1; i >= 0; i--) {
    for (let j = i; j < s.length; j++) {
      if (s[i] === s[j]) {
        if (j - i <= 1) {
          dp[i][j] = true;
          if (j - i + 1 > maxEnd - minStart + 1) {
            minStart = i;
            maxEnd = j;
          }
        } else if (dp[i + 1][j - 1]) {
          dp[i][j] = true;
          if (j - i + 1 > maxEnd - minStart + 1) {
            minStart = i;
            maxEnd = j;
          }
        }
      }
    }
  }
  return s.substring(minStart, maxEnd + 1);
};
```

**`Brute Force O(n^2)`**
```javascript
 var longestPalindrome = function (s) {
  let result = '';
  for (let i = 0; i < s.length; i++) {
    for (let j = 0; j <= i; j++) {
      const str = s.slice(j, i + 1);
      if (isPalindrome(str)) {
        result = i - j + 1 > result.length ? str : result;
      }
    }
  }
  return result;
};

function isPalindrome(str) {
  let left = 0, right = str.length - 1;
  while (left <= right) {
    if (str[left] !== str[right]) return false;
    left++;
    right--;
  }
  return true;
}
```