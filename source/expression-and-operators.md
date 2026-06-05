---
title: Leetcode 282 - Expression and operators
date: 2021-10-16 16:52:14
tags:
- backtracking
- dfs
---
**`Note:`**
- This is a `backtracking` problem, very similar to `palindrome partitioning`.
- We need to record `prev` and `sum`, so we can check if we've got the result quickly.
  - When `+cur`, `prev = cur`, `sum += cur`
  - When `-cur`, `prev = -cur`, `sum -= cur`.
  - When `*cur`, Like `1+2*3*4`. `sum = (sum - prev) + cur*prev` as in `(7 - 2*3) + 4*2*3`. `prev = prev*cur`.

**`Question:`**

Given a string num that contains only digits and an integer target, return `all possibilities` to insert the binary operators '+', '-', and/or '*' between the digits of num so that the resultant expression evaluates to the target value.

Note that operands in the returned expressions `should not` contain leading zeros.

**`Example:`**
```
Input: num = "105", target = 5
Output: ["1*0+5","10-5"]
Explanation: Both "1*0+5" and "10-5" evaluate to 5.
Note that "1-05" is not a valid expression because the 5 has a leading zero.
```

**`Code:`**
```javascript
/**
 * @param {string} num
 * @param {number} target
 * @return {string[]}
 */
var addOperators = function (num, target) {
  let result = [];
  let path = [];
  backtracking(num, 0, 0);
  return result;

  function backtracking(arr, index, sum, prev) {
    if (index === arr.length) {
      if (sum === target) result.push(path.join(''));
      return;
    }
    for (let i = index; i < arr.length; i++) {
      const numStr = arr.slice(index, i + 1);
      if (numStr[0] === "0" && numStr.length > 1) return;
      if (path.length >= 1) {
        path.push("+" + numStr);
        backtracking(arr, i + 1, numStr - 0 + sum, numStr - 0);
        path.pop();

        path.push("-" + numStr);
        backtracking(arr, i + 1, sum - (numStr - 0), -1*(numStr - 0));
        path.pop();

        path.push("*" + numStr);
        const x = (numStr - 0) * prev;
        backtracking(arr, i + 1, sum - prev + x, (numStr - 0) * prev);
        path.pop();
      } else {
        path.push(numStr);
        backtracking(arr, i + 1, numStr - 0, numStr - 0);
        path.pop();
      }
    }
  }
};
```