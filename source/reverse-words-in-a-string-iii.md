---
title: Leetcode 557 - Reverse words in a string III
date: 2021-12-03 19:03:52
tags:
- double pointers
---
**`Note:`**
- Strings are immutable in JS, so we need to convert them to arrays.

**`Question:`**

Given a string `s`, reverse the order of characters in each word within a sentence while still preserving whitespace and initial word order.

- 1 <= s.length <= 5 * 104
- s contains printable ASCII characters.
- s does `not` contain any leading or trailing `spaces`.
- There is at least one word in s.
- All the words in s are separated by a `single space`.

**`Example:`**
```
Input: s = "Let's take LeetCode contest"
Output: "s'teL ekat edoCteeL tsetnoc"
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @return {string}
 */
var reverseWords = function(s) {
  s = s.split(' ');
  s = s.map(e => {
    e = e.split('');
    let left = 0, right = e.length - 1;
    while (left < right) {
      [e[left], e[right]] = [e[right], e[left]];
      left++;
      right--;
    }
    return e.join('');
  })
  return s.join(' ');
  
};
```