---
title: Leetcode 14 - Longest prefix
date: 2021-08-18 22:39:45
tags:
- leetcode
- string
---
Write a function to find the longest common prefix string amongst an array of strings.

If there is no common prefix, return an empty string `""`. 

**Example 1:**
```
Input: strs = ["flower","flow","flight"]
Output: "fl"
```
**Example 2:**
```
Input: strs = ["dog","racecar","car"]
Output: ""
Explanation: There is no common prefix among the input strings.
```
```javascript
/**
 * @param {string[]} strs
 * @return {string}
 */
var longestCommonPrefix = function(strs) {
    let res = "";
    if (strs.length == 0) return res;
    let _first = strs[0].split('');
    strs.shift();
    for (let i = 0; i < _first.length; i++) {
        let e = _first[i];
        let temp = strs.filter(x => x[i] == e);
        if (temp.length == strs.length) {
            res += e;
        } else {
            break;
        }
    }
    return res;
};
```