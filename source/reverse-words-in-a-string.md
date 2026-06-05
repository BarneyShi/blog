---
title: Leetcode 151 - Reverse words in a string
date: 2021-10-11 02:54:57
tags:
- double pointers
- string
---
**`Note:`**
- Know how to use `trim` to remove leading or trailing spaces.
- Use `replace` and `/ +/g` regex to replace multi spaces with `single` space.
- Convert string to arr, then use double pointers method to reverse.

**`Question:`**
Given an input string s, reverse the order of the words.

A word is defined as a sequence of non-space characters. The words in s will be separated by at least one space.

Return a string of the words in reverse order concatenated by a single space.

Note that s may contain leading or trailing spaces or multiple spaces between two words. The returned string should only have a single space separating the words. Do not include any extra spaces.

**`Example:`**
```
Input: s = "a good   example"
Output: "example good a"
Explanation: You need to reduce multiple spaces between two words to a single space in the reversed string.

Input: s = "  hello world  "
Output: "world hello"
Explanation: Your reversed string should not contain leading or trailing spaces.
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @return {string}
 */
var reverseWords = function(s) {
  s = s.trim();
  const regex = / +/g;
  s = s.replace(regex, ' ');
  const arr = s.split(' ');
  let left = 0;
  let right = arr.length - 1;
  console.log(arr)
  while (left < right) {
    if (arr[left] === '') left++;
    if (arr[right] === '') right--;
    [arr[left++], arr[right--]] = [arr[right], arr[left]];
  }
  return arr.join(' ');
};
```