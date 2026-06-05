---
title: Leetcode 190 - Reverse bits
date: 2021-08-18 23:06:11
tags:
- leetcode
- math
---
**Note**: Use bitwise opertators like `<< >> | &` to impress your interviewers. That's what they want to see.

   ```javascript
   // Naive method
   var reverseBits = function(n) {
     let reversed = n.toString(2).split('').reverse().join('');
     while(reversed.length<32) {
       reversed += '0';
     }
     const output = parseInt(reversed, 2);
     return output;
   };
   // Pro method
   var reverseBits = function(n) {
    	let res = 0;
     for (let i=0; i<32;i++) {
       res <<= 1;
       res |= n&1;
       n >>= 1;
     }
     return res;
   }
   
   ``` 
