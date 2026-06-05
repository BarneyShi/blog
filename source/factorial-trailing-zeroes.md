---
title: Leetcode 172 - Factorial trailing zeroes
date: 2021-08-18 23:12:48
tags:
- leetcode
- math
---
Given an integer `n`, return *the number of trailing zeroes in `n!`*.

   **Note**: The key is to figure out that the number of trailing zeros is determined by the number of `5` in each number. 

   **Example 1:**

   ```
   Input: n = 3
   Output: 0
   Explanation: 3! = 6, no trailing zero.
   ```

   **Example 2:**

   ```
   Input: n = 5
   Output: 1
   Explanation: 5! = 120, one trailing zero.
   ```

   ```javascript
   var trailingZeroes = function(n) {
     let ans = 0;
     while(n > 0) {
       ans += count5(n);
       n--;
     }
     return ans;
   };
   function count5 (num) {
     let ans = 0;
     while (num % 5===0) {
       ans += 1;
       num /= 5;
     }
     return ans;
   }
   ```
