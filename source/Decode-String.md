---
title: Leetcode 394 - Decode String
date: 2021-12-14 00:19:49
tags:
- stack
---
**`Note:`**
- My first intuition was to use `stack` coz it gave us access to the last `[` when we met a `]`.
- When `curr !== ]`, keep adding chars.
- When `curr === ]`, pop and record tops to `tmp`, and stop at `[`.
- Then pop nums till `top` of stack is not a num string.
- Repeat `tmp` n times as the num we've found, and push the result to `stack`.
- Keep doing it, and return `stack.join('')`.

**`Question:`**

Given an encoded string, return its decoded string.

The encoding rule is: `k[encoded_string]`, where the `encoded_string` inside the square brackets is being repeated exactly `k` times. Note that `k` is guaranteed to be a positive integer.

You may assume that the input string is always valid; No extra white spaces, square brackets are well-formed, etc.

Furthermore, you may assume that the original data does not contain any digits and that digits are only for those repeat numbers, k. For example, there won't be input like `3a` or `2[4]`.

**`Example:`**
```
Input: s = "3[a]2[bc]"
Output: "aaabcbc"
```

**`Code:`**
```javascript
/**
 * @param {string} s
 * @return {string}
 */
var decodeString = function(s) {
  let stack = [];
  s = s.split('');
  while (s.length > 0) {
    const curr = s.shift();
    if (curr === ']') {
      let tmp = ''
      while (stack.length && stack[stack.length - 1] !== '[') {
        tmp = stack.pop() + tmp;
      }
      stack.pop();
      let count = '';
      while (!isNaN(stack[stack.length - 1])) {
        count = stack.pop() + count;
      }
      tmp = tmp.repeat(count - 0);
      stack.push(...tmp.split(''));
    } else {
      stack.push(curr);
    }
  }
  return stack.join('');
};
```