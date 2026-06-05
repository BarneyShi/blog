---
title: Leetcode 289 - Bulls and cows
date: 2021-11-07 19:48:32
tags:
---
**`Note:`**
- Not so hard.
- Iterate once on secret and guess and put frequencies in each map.
- Pick the smaller value for each key in two maps.

**`Question:`**

You are playing the `Bulls and Cows` game with your friend.

You write down a secret number and ask your friend to guess what the number is. When your friend makes a guess, you provide a hint with the following info:

- The number of "bulls", which are digits in the guess that are in the correct position.
- The number of "cows", which are digits in the guess that are in your secret number but are located in the wrong position. Specifically, the non-bull digits in the guess that could be rearranged such that they become bulls.
Given the secret number `secret` and your friend's guess `guess`, return the hint for your friend's guess.

The hint should be formatted as `"xAyB"`, where `x` is the number of bulls and `y` is the number of cows. Note that both secret and guess may contain duplicate digits.

**`Example:`**
```
Input: secret = "1123", guess = "0111"
Output: "1A1B"
Explanation: Bulls are connected with a '|' and cows are underlined:
"1123"        "1123"
  |      or     |
"0111"        "0111"
Note that only one of the two unmatched 1s is counted as a cow since the non-bull digits can only be rearranged to allow one 1 to be a bull.
```

**`Code:`**
```javascript
/**
 * @param {string} secret
 * @param {string} guess
 * @return {string}
 */
 var getHint = function(secret, guess) {
  let bulls = 0;
  let cows = 0;
  let secretMap = new Map();
  let guessMap = new Map();
  for (let i = 0; i < secret.length; i++) {
    const secretChar = secret[i];
    const guessChar = guess[i];
    if (secretChar === guessChar) {
      bulls++;
    } else {
      if (!secretMap.has(secretChar)) {
        secretMap.set(secretChar, 1);
      } else {
        secretMap.set(secretChar, secretMap.get(secretChar) + 1);
      }
      if (!guessMap.has(guessChar)) {
        guessMap.set(guessChar, 1);
      } else {
        guessMap.set(guessChar, guessMap.get(guessChar) + 1);
      }
    }
  }
  for (const [key, value] of guessMap) {
    if (secretMap.has(key) && secretMap.get(key) > 0) {
      cows += Math.min(secretMap.get(key), value);
      secretMap.set(key, secretMap.get(key) - 1);
    }
  }
  return bulls + 'A' + cows + 'B';
};

```