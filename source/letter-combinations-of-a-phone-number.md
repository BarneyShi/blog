---
title: Leetcode 17 - Letter combinations of a phone number
date: 2021-09-08 22:51:31
tags:
- dfs
- backtracking
---
**`Note:`**
- This is a `backtracking` problem.
- Not like other `combination sum` questions. You are not just iterating a `single` string, instead, you are iterating `many` strings in responding to every `digit` of digits.
- Three steps to do backtracking problems
  - The backtracking `params` are current index of digits and digits.
  - The `termination condition` is `index === digits.length`
  - The logic of iterating on each level is the most important part
    - Get the string according to `index`.
    - Do backtracking.

![img](https://img-blog.csdnimg.cn/20201123200304469.png)

Given a string containing digits from 2-9 inclusive, return all possible letter combinations that the number could represent. Return the answer in any order.

A mapping of digit to letters (just like on the telephone buttons) is given below. Note that 1 does not map to any letters.

![img](https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Telephone-keypad2.svg/200px-Telephone-keypad2.svg.png)
```javascript
/**
 * @param {string} digits
 * @return {string[]}
 */
var letterCombinations = function(digits) {
  let ans = [];
  let path = [];
  if (digits.length === 0) return ans;
  let map = {'0':'', '1':'','2':'abc', '3':'def', '4':'ghi', '5':'jkl', '6':'mno', '7':'pqrs', '8':'tuv', '9':'wxyz'};
  backtracking(0, digits);
  return ans;
  
  function backtracking(index, digits) {
    if (index == digits.length) {
      ans.push(path.join(''));
      return;
    }
    const str = map[digits[index]];
    for (let i = 0; i < str.length; i++) {
      path.push(str[i]);
      backtracking(index + 1, digits);
      path.pop();
    }
  }
};
```