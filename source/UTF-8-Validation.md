---
title: Leetcode 393 - UTF-8 Validation
date: 2021-12-13 21:39:24
tags:
- dfs
---
**`Note:`**
- The description was so confusing.
- Just enumerate all situations and put them in a `dfs`.
- Use `memo` coz there might be repetitive calculations.
- Use `e.toString(2)` to convert decimals to binariy strs. (Reversed operation is to use `parseInt(str, 2)`).

**`Question:`**

Given an integer array `data` representing the data, return whether it is a valid UTF-8 encoding.

A character in `UTF8` can be from `1 to 4` bytes long, subjected to the following rules:

1. For a 1-byte character, the first bit is a `0`, followed by its Unicode code.
2. For an n-bytes character, the first `n` bits are all one's, the `n + 1` bit is 0, followed by `n - 1` bytes with the most `significant` 2 bits being 10.

This is how the UTF-8 encoding would work:
```
   Char. number range  |        UTF-8 octet sequence
      (hexadecimal)    |              (binary)
   --------------------+---------------------------------------------
   0000 0000-0000 007F | 0xxxxxxx
   0000 0080-0000 07FF | 110xxxxx 10xxxxxx
   0000 0800-0000 FFFF | 1110xxxx 10xxxxxx 10xxxxxx
   0001 0000-0010 FFFF | 11110xxx 10xxxxxx 10xxxxxx 10xxxxxx
```
`Note`: The input is an array of integers. Only the `least significant 8` bits of each integer is used to store the data. This means each integer represents only 1 byte of data.

**`Example:`**
```
Input: data = [197,130,1]
Output: true
Explanation: data represents the octet sequence: 11000101 10000010 00000001.
It is a valid utf-8 encoding for a 2-bytes character followed by a 1-byte character.
```

**`Code:`**
```javascript
/**
 * @param {number[]} data
 * @return {boolean}
 */
 var validUtf8 = function(data) {
  let memo = {};
  data = data.map(e => {
    let binaryStr = e.toString(2);
    if (binaryStr.length > 8) {
      binaryStr = binaryStr.slice(0, 8);
      return binaryStr;
    } else if (binaryStr.length < 8) {
      binaryStr = '0'.repeat(8 - binaryStr.length) + binaryStr;
      return binaryStr;
    }
    return binaryStr;
  });
  return dfs(data, 0);

  function dfs(data, startIndx) {
    if (startIndx >= data.length) return true;
    if (memo[startIndx] !== undefined) return memo[startIndx];
    if (data[startIndx][0] === '0') {
      const bool = dfs(data, startIndx + 1);
      memo[startIndx] = bool;
      return bool;
    }
    if (data[startIndx].slice(0, 3) === '110' && data[startIndx + 1] && data[startIndx + 1].slice(0, 2) === '10') {
      const bool = dfs(data, startIndx + 2);
      memo[startIndx] = bool;
      return bool;
    }
    if (data[startIndx].slice(0, 4) === '1110' && data[startIndx + 1] && data[startIndx + 1].slice(0, 2) === '10' && data[startIndx + 2] && data[startIndx + 2].slice(0, 2) === '10') {
      const bool = dfs(data, startIndx + 3);
      memo[startIndx] = bool;
      return bool;
    }
    if (data[startIndx].slice(0, 5) === '11110' && data[startIndx + 1] && data[startIndx + 1].slice(0, 2) === '10' && data[startIndx + 2] && data[startIndx + 2].slice(0, 2) === '10' && data[startIndx + 3] && data[startIndx + 3].slice(0, 2) === '10') {
      const bool = dfs(data, startIndx + 4); 
      memo[startIndx] = bool;
      return bool;
    }
    memo[startIndx] = false;
    return false;
  }
};
```