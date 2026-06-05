---
title: Leetcode 326 - Power of three
date: 2021-08-18 23:10:58
tags:
- leetcode
- math
---
**Note**: It's not that hard but there are some traps in this problem.

   `method 1:`

   ```javascript
   var isPowerOfThree = function(n) {
     let remainder = 0;
     if (n === 0) return false;
     if (n === 1) return true;
     while (remainder === 0) {
       remainder = n % 3;
       n = n / 3;
       if (n === 1) return true;
     }
     return Number.isInteger(n);
   };
   ```

   `method 2:`

   ```javascript
   var isPowerOfThree = function(n) {
       for (let x = 1; x <= n; x *= 3) {
           if (x === n) {
               return true
           }
       }
       return false
   };
   ```
