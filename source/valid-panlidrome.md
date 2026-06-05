---
title: Leetcode 125 - Valid panlidrome
date: 2021-08-18 22:59:45
tags:
- leetcode
- string
---
**Thoughts:** Using double pointers shoud be my intuition. The trick part is to realize that I should avoid using 

   `while` loop inside the main `while` loop. For example,  s = `.,`. Using while loop to increase `i` or `j` will lead to undefined error.  

   **Notes:** `isNaN(parseInt(num))` is a good way to check if a string is purely numeric. 

   **Quesiton:**

   Given a string `s`, determine if it is a palindrome, considering only alphanumeric characters and ignoring cases. 

   **Example 1:**

   ```
   Input: s = "A man, a plan, a canal: Panama"
   Output: true
   Explanation: "amanaplanacanalpanama" is a palindrome.
   ```

   **Example 2:**

   ```
   Input: s = "race a car"
   Output: false
   Explanation: "raceacar" is not a palindrome.
   ```

   ```javascript
   /**
    * @param {string} s
    * @return {boolean}
    */
   var isPalindrome = function(s) {
     let i = 0;
     let j = s.length -1;
     while(i <= j) {
       if (s[i].toUpperCase() == s[i].toLowerCase() && isNaN(parseInt(s[i]))) {
           i++
       } else if (s[j].toUpperCase() == s[j].toLowerCase() && isNaN(parseInt(s[j]))) {
           j--;
       } else if (s[i].toUpperCase() != s[j].toUpperCase()) {
         return false;
       } else if (s[i].toUpperCase() == s[j].toUpperCase()) {
         i++;
         j--;
       }
     }
     return true;
   };
   ```
