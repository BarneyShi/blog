---
title: Leetcode 150 - Evaluate RPN
date: 2021-10-09 22:53:14
tags:
---
**`Note:`**
- Use `stack` to contain nums. When encountering a symbol in `s`, use the last 2 nums for calculations.
- For division, if the result is positive, use `math.floor`, otherwise we should use `math.ceil`.

**`Question:`**

Evaluate the value of an arithmetic expression in Reverse Polish Notation.

Valid operators are `+`, `-`, `*`, and `/`. Each operand may be an integer or another expression.

`Note` that division between two integers should truncate toward zero.

It is guaranteed that the given RPN expression is always valid. That means the expression would always evaluate to a result, and there will not be any division by zero operation.

**`Example:`**
```
Input: tokens = ["10","6","9","3","+","-11","*","/","*","17","+","5","+"]
Output: 22
Explanation: ((10 * (6 / ((9 + 3) * -11))) + 17) + 5
= ((10 * (6 / (12 * -11))) + 17) + 5
= ((10 * (6 / -132)) + 17) + 5
= ((10 * 0) + 17) + 5
= (0 + 17) + 5
= 17 + 5
= 22
```

**`Code:`**
```javascript
/**
 * @param {string[]} tokens
 * @return {number}
 */
var evalRPN = function(tokens) {
  let stack = [];
  for (let i = 0; i < tokens.length; i++) {
    if (isNaN(parseInt(tokens[i]))) {
          const num2 = parseInt(stack.pop());
          const num1 = parseInt(stack.pop());
      switch (tokens[i]) {
        case '+':
          const add = num1 + num2;
          stack.push(add);
          break;
        case '-':
          const minus = num1 - num2;
          stack.push(minus);
          break;
        case '*':
          const multi = num1 * num2;
          stack.push(multi);
          break;
        case '/':
          const division = num1*num2 > 0 ? Math.floor(num1 / num2) : Math.ceil(num1 / num2);
          stack.push(division);
          break;
      }
      continue;
    }
    stack.push(tokens[i]);
  }
  return stack.pop();
}; 
```