---
title: Leetcode 1047 - Remove all adjacent duplicates in string
date: 2021-08-18 23:03:39
tags:
- leetcode
- string
---
You are given a string `s` consisting of lowercase English letters. A **duplicate removal** consists of choosing two **adjacent** and **equal** letters and removing them.

   Input: s = "abbaca"
   Output: "ca"
   Explanation: 
   For example, in "abbaca" we could remove "bb" since the letters are adjacent and equal, and this is the only possible move.  The result of this move is that the string is "aaca", of which only "aa" is possible, so the final string is "ca".

   Note: `Stack` data structure is the way to go. Shold have thought of it earlier. Two pointers are tricky

   ```javascript
   /**
    * @param {string} s
    * @return {string}
    */
   var removeDuplicates = function(s) {
     let stack = [];
     for(const char of s) {
       if (stack[stack.length-1] === char) {
         stack.pop();
       } else {
         stack.push(char)
       }
     }
     return stack.join('')
   };
   ```
