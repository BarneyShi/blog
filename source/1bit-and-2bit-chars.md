---
title: Leetcode 717 - 1-bit and 2-bit chars
date: 2021-10-24 00:22:58
tags:
- dfs
---
**`Note:`**
- Use `DFS` by repetitively slicing off the last element.
- Remove the last `0` from bits first.
- Base case:
  - `arr` is empty, return true;
  - Only one `0` left, return true;
  - Only one `1` left, return false;
- When last bit is `0`:
  - When the last but one is `0`, only slice off the last `0`.
  - When the last but one is `1`, two situations: Choose to only slice off `0` or `10` together.
- When last bit is `1`:
  - When the last but one is `1`, slice off the last 2;
  - When the lst but one is `0`, return false;

**`Question:`**

We have two special characters:

- The first character can be represented by one bit `0`.
- The second character can be represented by two bits (`10` or `11`).
Given a binary array bits that ends with 0, return true if the last character must be a one-bit character.

**`Example:`**
```
Input: bits = [1,0,0]
Output: true
Explanation: The only way to decode it is two-bit character and one-bit character.
So the last character is one-bit character.
```

**`Code:`**
```javascript
/**
 * @param {number[]} bits
 * @return {boolean}
 */
var isOneBitCharacter = function(bits) {
  bits = bits.slice(0, bits.length - 1);
  return dfs(bits);

  function dfs(arr) {
    const len = arr.length;
    if (len === 0) return true;
    if (arr[len - 1] === 0) {
      if (arr[len - 2] === 0) {
        return dfs(arr.slice(0, len - 1));
      } else if (arr[len - 2] === 1) {
        return dfs(arr.slice(0, len - 1)) || dfs(arr.slice(0, len - 2));
      }
      return true;
    } else if (arr[len - 1] === 1) {
      if (arr[len - 2] === 0) return false;
      if (arr[len - 2] === 1) return dfs(arr.slice(0, len - 2));
      return false;
    }
  }
};
```