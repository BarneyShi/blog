---
title: Leetcode 93 - Restore ip address
date: 2021-09-11 16:23:17
tags:
- dfs
- backtracking
---
**`Note:`**
- 2022 Update:
  - No need to write a helper. 
  - Check `path` length before adding it to the result in case index hasn't reached the end.
- This is a backtracking problem, very similar to `palindrome partitioning`.
- Pay attention to the `termination condition` because `path.length === s.lenght` is not enough. We also need to check if `path.length === s.length`.

Given a string s containing only digits, return all possible valid IP addresses that can be obtained from s. You can return them in any order.

A valid IP address consists of exactly four integers, each integer is between 0 and 255, separated by single dots and cannot have leading zeros. For example, "0.1.2.201" and "192.168.1.1" are valid IP addresses and "0.011.255.245", "192.168.1.312" and "192.168@1.1" are invalid IP addresses. 

**Example**
```
Input: s = "25525511135"
Output: ["255.255.11.135","255.255.111.35"]

Input: s = "0000"
Output: ["0.0.0.0"]
```

```javascript
/**
 * @param {string} s
 * @return {string[]}
 */
var restoreIpAddresses = function(s) {
  let result = [];
  let path = [];
  backtracking(0);
  return result;

  function backtracking(startIndex) {
    if (path.length > 4) return;
    if (startIndex >= s.length && path.length === 4) {
      result.push(path.join('.'));
      return;
    }
    for (let i = startIndex; i < startIndex + 3 && i < s.length; i++) {
      const curr = s.slice(startIndex, i + 1);
      if (curr.length > 1 && curr[0] === '0' || curr - 0 > 255) continue;
      path.push(curr);
      backtracking(i + 1);
      path.pop();
    }
  }
};
```