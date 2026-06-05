---
title: Leetcode 8 - String to integer atoi
date: 2021-10-21 00:52:08
tags:
- string
---
**`Note:`**
- Check `+` or `-` first.
- Start iterating and stop when seeing non num char.

**`Question:`**

Implement the myAtoi(string s) function, which converts a string to a 32-bit signed integer (similar to C/C++'s atoi function).

The algorithm for myAtoi(string s) is as follows:

1. Read in and ignore any leading whitespace.
2. Check if the next character (if not already at the end of the string) is '-' or '+'. Read this character in if it is either. This determines if the final result is negative or positive respectively. Assume the result is positive if neither is present.
3. Read in next the characters until the next non-digit character or the end of the input is reached. The rest of the string is ignored.
4. Convert these digits into an integer (i.e. "123" -> 123, "0032" -> 32). If no digits were read, then the integer is 0. Change the sign as necessary (from step 2).
5. If the integer is out of the 32-bit signed integer range [-231, 231 - 1], then clamp the integer so that it remains in the range. Specifically, integers less than -231 should be clamped to -231, and integers greater than 231 - 1 should be clamped to 231 - 1.
6. Return the integer as the final result.
Note:

Only the space character ' ' is considered a whitespace character.
Do not ignore any characters other than the leading whitespace or the rest of the string after the digits.

**`Example:`**
```
Input: s = "   -42"
Output: -42

Input: s = "4193 with words"
Output: 4193
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @return {number}
 */
var myAtoi = function(s) {
  s = s.trim();
  const isPositive = s[0] !== '-';
  let ans = 0;
  let start = 0;
  if (s[0] === '-' || s[0] === '+') start++;
  for (let i = start; i < s.length; i++) {
    if (isNaN(s[i]) || s[i] === ' ') break;
    ans = ans*10 + (s[i] - 0);
  }
  ans = (isPositive ? 1 : -1) * ans;
  if (ans > 2**31-1) return 2**31-1;
  if (ans < -1*2**31) return -1*2**31;
  return ans;
};
```