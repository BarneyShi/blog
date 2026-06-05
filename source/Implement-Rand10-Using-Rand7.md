---
title: Leetcode 470 - Implement Rand10() Using Rand7()
date: 2022-01-01 01:42:13
tags:
- bitwise
---
**`Note:`**
- Actually a really interesting problem.
- Bitwise is easy to understand but it's not the most efficient one.
- Construct a function to return `0, 1` with 50%, 50% possibility. 
- `[1, 6]` odd num returns 0, and even num returns 1.
- For 10, we only need `4 bits`.
- We can get num from `0` to `15`.
- We want num between `[1, 10]`, so we only need `[0, 9]` then add 1 to the num.
- Do while loop when `n > 9`.

**`Question:`**

Given the API `rand7()` that generates a uniform random integer in the range `[1, 7]`, write a function `rand10()` that generates a uniform random integer in the range `[1, 10]`. You can only call the API `rand7()`, and you shouldn't call any other API. Please do not use a language's built-in random API.

Each test case will have one internal argument `n`, the number of times that your implemented function rand10() will be called while testing. Note that this is `not` an argument passed to `rand10()`.

**`Example:`**
```
Input: n = 3
Output: [3,8,10]
```

**`Code:`**
```javascript
/**
 * The rand7() API is already defined for you.
 * var rand7 = function() {}
 * @return {number} a random integer in the range 1 to 7
 */
var rand10 = function() {
  let ans;
  while (ans === undefined || ans > 9) {
    ans = (rand01() << 3) + (rand01() << 2) + (rand01() << 1) + rand01();
  }
  return ans + 1;
  
  function rand01() {
    let rand;
    while (rand === undefined || rand === 7) {
      rand = rand7();
    }
    if (rand % 2 === 0) {
      return 1;
    } else {
      return 0;
    }
  }
};
```