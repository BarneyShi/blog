---
title: Leetcode 374 - Guess number higher or lower
date: 2021-11-10 20:55:40
tags:
- double pointers
---
**`Note:`**
- Double pointers
- Because there is no duplicates, we can let `low < high`.
- `>>>` has a higher predecender than `-`. So we need a parentheses `const middle = low + ((high - low) >>> 1)`.

**`Question:`**

We are playing the Guess Game. The game is as follows:

I pick a number from `1` to `n`. You have to guess which number I picked.

Every time you guess wrong, I will tell you whether the number I picked is higher or lower than your guess.

You call a pre-defined API `int guess(int num)`, which returns 3 possible results:

- `-1`: The number I picked is lower than your guess (i.e. pick < num).
- `1`: The number I picked is higher than your guess (i.e. pick > num).
- `0`: The number I picked is equal to your guess (i.e. pick == num).
Return the number that I picked.

**`Example:`**
```
Input: n = 10, pick = 6
Output: 6
```

**`Code:`**
```javascript
/** 
 * Forward declaration of guess API.
 * @param {number} num   your guess
 * @return 	            -1 if num is lower than the guess number
 *			             1 if num is higher than the guess number
 *                       otherwise return 0
 * var guess = function(num) {}
 */

/**
 * @param {number} n
 * @return {number}
 */
var guessNumber = function(n) {
  let low = 1, high = n;
  while (low < high) {
    const middle = low + ((high - low) >>> 1);
    const call = guess(middle);
    if (call === 0) {
      return middle;
    } else if (call === -1) {
      high = middle - 1;
    } else if (call === 1) {
      low = middle + 1;
    }
  }
  return low;
};
```