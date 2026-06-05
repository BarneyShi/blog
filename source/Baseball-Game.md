---
title: Leetcode 682 - Baseball Game
date: 2021-12-20 00:21:14
tags:
- stack
---
**`Note:`**
- This ain't has nothing to do with baseball.
- Use a stack to contain numbers.
- Pop ops till it's empty.

**`Question:`**

You are keeping score for a baseball game with strange rules. The game consists of several rounds, where the scores of past rounds may affect future rounds' scores.

At the beginning of the game, you start with an empty record. You are given a list of strings `ops`, where `ops[i]` is the `ith` operation you must apply to the record and is one of the following:

1. An integer `x` - Record a new score of `x`.
2. `"+"` - Record a new score that is the sum of the previous two scores. It is guaranteed there will always be two previous scores.
3. `"D"` - Record a new score that is double the previous score. It is guaranteed there will always be a previous score.
4. `"C"` - `Invalidate` the previous score, removing it from the record. It is guaranteed there will always be a previous score.
Return the sum of all the scores on the record.

**`Example:`**
```
Input: ops = ["5","2","C","D","+"]
Output: 30
Explanation:
"5" - Add 5 to the record, record is now [5].
"2" - Add 2 to the record, record is now [5, 2].
"C" - Invalidate and remove the previous score, record is now [5].
"D" - Add 2 * 5 = 10 to the record, record is now [5, 10].
"+" - Add 5 + 10 = 15 to the record, record is now [5, 10, 15].
The total sum is 5 + 10 + 15 = 30.
```

**`Code:`**
```javascript
/**
 * @param {string[]} ops
 * @return {number}
 */
var calPoints = function(ops) {
  let stack = [];
  while (ops.length > 0) {
    const top = ops.shift();
    if (!isNaN(top)) {
      stack.push(top - 0);
    } else if (top === 'C') {
      stack.pop();
    } else if (top === 'D') {
      stack.push(stack[stack.length - 1] * 2);
    } else {
      stack.push(stack[stack.length - 1] + stack[stack.length - 2]);
    }
  }
  return stack.reduce((acc, cur) => acc + cur);
};
```