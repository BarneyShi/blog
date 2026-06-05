---
title: Leetcode 166 - Fraction to recurring decimal
date: 2021-10-31 03:30:28
tags:
- hash table
- string
---
**`Note:`**
- ![img](https://i.imgur.com/u0RXbB8.jpg)
- We need to simulation division.
- Use `remainder` to keep track of remainders left.
- Use `map` to record prev remainder and if a new remainder happened before, it means we've found the repeated decimals.
- Use `i` to store decimals position so that we know where to add `(` `)`. Initialized as `0`.
- Take `1 / 6` for example.
  - Record integer part `0` first.
  - The remainder is intialized as `1`.
  - Check if remainder exists in map.
  - Add `remainder` to map with value `i`.
  - Then do `remainder * 10 / denominator`:
    - If the new remainder is `0`, it means the numerator is `divisible`. Just return the result.
    - If not, append the new remainder to the decimal part. 
  - If we encouter the first repeated remainder, based on its `index`, put `(` before it.

**`Question:`**

Given two integers representing the `numerator` and `denominator` of a fraction, return the fraction in string format.

If the fractional part is repeating, enclose the repeating part in parentheses.

If multiple answers are possible, return any of them.

It is guaranteed that the length of the answer string is less than 10^4 for all the given inputs.

**`Example:`**
```
Input: numerator = 4, denominator = 333
Output: "0.(012)"
```

**`Code:`**

```csharp
public class Solution {
    public string FractionToDecimal(int numerator, int denominator) {
      // Convert to long type in case of (-1, -2147483648) etc.
      long a = numerator, b = denominator;
      var isNegative = (a * b) < 0;
      a = Math.Abs(a);
      b = Math.Abs(b);
      long remainder = Math.Abs(a) % Math.Abs(b);
      long quotient = a / b;
      if (remainder == 0) return (isNegative ? "-":"") + quotient;

      var dict = new Dictionary<long, int>();
      int index = 0;
      
      StringBuilder fraction = new StringBuilder();

      int i = 0;
      while (!dict.ContainsKey(remainder)) {
        dict.Add(remainder, i);
        fraction.Append(remainder * 10 / b);
        if (remainder * 10 % b == 0) return (isNegative ? "-":"") + Math.Abs(quotient) + "." + fraction.ToString();
        remainder = remainder * 10 % b;
        i++;
      }
      // Dictionary contains the start index of repeated decimal part.
      var startIndex = dict[remainder];
      return (isNegative ? "-" : "") + Math.Abs(quotient) + "." + fraction.ToString().Substring(0, startIndex) + "(" + fraction.ToString().Substring(startIndex) + ")";
    }
}
```

```javascript
/**
 * @param {number} numerator
 * @param {number} denominator
 * @return {string}
 */
 var fractionToDecimal = function(numerator, denominator) {
  const isNegative = (numerator ^ denominator) < 0 ? '-' : '';
  numerator = Math.abs(numerator);
  denominator = Math.abs(denominator);
  if (numerator % denominator === 0) return numerator === 0 ? '0' : (isNegative + (numerator / denominator) + '');

  const decimal = ~~(numerator / denominator) + '.';
  let fraction = '';
  let map = new Map();
  let remainder = (numerator - denominator) < 0 ? numerator : (numerator % denominator);
  // Use i to record remainder's index, so we can know where to place ().
  let i = 0;
  while (!map.has(remainder)) {
    map.set(remainder, i);
    if (remainder * 10 % denominator === 0) return isNegative + decimal + fraction + (remainder * 10 / denominator);
    const quotient = ~~(remainder * 10 / denominator);
    fraction = fraction + quotient + '';
    remainder = Math.abs(remainder * 10 - quotient * denominator);
    i++;
  }
  const startIndex = map.get(remainder);
  return isNegative + decimal + fraction.slice(0, startIndex) + '(' + fraction.slice(startIndex) + ')';
};
```