---
title: Leetcode 372 - Super Pow
date: 2021-12-04 23:32:30
tags:
- math
---
**`Note:`**
- A combination of both `quick power` and `mod ops`.
- A formula that you need to know:
  - `(a * b) % k = (a % k)(b % k) % k`.
  - It means that `num % mod`
    - `do mod on every factor`
    - `multiply them all together`
    - `do mod again on the result`
- Here we need to do some modifications toward `quickpow`
  - Do `x % mod` first, so every factor in the following recursion calls is modded.
  - As for the result, do another `mod`.

**`Question:`**

Your task is to calculate `a^b` mod `1337` where `a` is a positive integer and `b` is an extremely `large` positive integer given in the form of an array.

**`Example:`**
```
Input: a = 2147483647, b = [2,0,0]
Output: 1198
```

**`Code:`**
```javascript
/**
 * @param {number} a
 * @param {number[]} b
 * @return {number}
 */
var superPow = function(a, b) {
  const MOD = 1337;
  if (b.length === 0) return 1;
  const pow = b.pop();
  // Both factor1 and factor2 have been Modded. So we just need another MOD for the result.
  const factor1 = quickPow(a, pow);
  const factor2 = quickPow(superPow(a, b), 10);
  return (factor1 * factor2) % MOD;

  function quickPow(x, n) {
    if (n === 0) return 1;
    // Do mod on the factor first.
    x %= MOD;
    if (n < 0) return 1 / (quickPow(x, -n));
    const y = quickPow(x, Math.floor(n / 2));
    // Do mod again on the result.
    return n % 2 === 0 ? y * y % MOD : ((y * y % MOD) * x) % MOD;
  }
};
```