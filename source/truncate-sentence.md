---
title: Leetcode 1816 - Truncate sentence
date: 2021-12-05 16:29:32
tags:
---
**`Note:`**
- Regex review time:
  - `^` means the beginning of a string.
  - In string, `\` will escape the next special chars. So if you want to write `\w`, you need to write `\\w`.
  - `\s` means space.
  - `\w` means `letter`.

**`Question:`**

A `sentence` is a list of `words` that are separated by a `single space` with `no leading or trailing` spaces. Each of the words consists of only uppercase and lowercase English letters (no punctuation).

- For example, `"Hello World"`, `"HELLO"`, and `"hello world hello world"` are all sentences.

You are given a sentence `s​​​​​​` and an integer `k​​​​​​`. You want to truncate `s​​​​​​` such that it contains only the first `k​​​​​​` words. Return `s​​​​​​` after truncating it.

**`Example:`**
```
Input: s = "Hello how are you Contestant", k = 4
Output: "Hello how are you"
Explanation:
The words in s are ["Hello", "how" "are", "you", "Contestant"].
The first 4 words are ["Hello", "how", "are", "you"].
Hence, you should return "Hello how are you".
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @param {number} k
 * @return {string}
 */
var truncateSentence = function(s, k) {
  const str = '^' + '\\w+\\s'.repeat(k - 1) + '\\w+';
  const regex = new RegExp(str);
  return s.match(regex)[0];
};
```