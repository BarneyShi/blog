---
title: Leetcode 13 - Roman to Integer
date: 2021-08-18 01:55:15
tags: 
- leetcode
- string
---
Roman numerals are represented by seven different symbols: `I`, `V`, `X`, `L`, `C`, `D` and `M`.

Symbol       Value
I             1
V             5
X             10
L             50
C             100
D             500
M             1000

For example, `2` is written as `II` in Roman numeral, just two one's added together. `12` is written as `XII`, which is simply `X + II`. The number `27` is written as `XXVII`, which is `XX + V + II`.

Roman numerals are usually written largest to smallest from left to right. However, the numeral for four is not `IIII`. Instead, the number four is written as `IV`. Because the one is before the five we subtract it making four. The same principle applies to the number nine, which is written as `IX`. There are six instances where subtraction is used:

- `I` can be placed before `V` (5) and `X` (10) to make 4 and 9. 
- `X` can be placed before `L` (50) and `C` (100) to make 40 and 90. 
- `C` can be placed before `D` (500) and `M` (1000) to make 400 and 900.

Given a roman numeral, convert it to an integer.

```javascript
/**
 * @param {string} s
 * @return {number}
 */
var romanToInt = function(s) {
 		// Method - 1 
    // let res = 0;
    // let map = new Map([['I', 1], ['V', 5], ['X', 10], ['L', 50], ['C', 100], ['D', 500], ['M', 1000]]);
    // let spec_map = ['I', 'X', 'C'];
    // let exception_map = new Map([['IV', 4], ['IX', 9], ['XL', 40], ['XC', 90], ['CD', 400], ['CM', 900]]);
    // const str_arr = s.split('');
    // let index = 0;
    // while(index < str_arr.length) {
    //     if(spec_map.includes(str_arr[index]) && str_arr[index+1] && exception_map.has(str_arr[index]+str_arr[index+1])) {
    //         res += exception_map.get(str_arr[index]+str_arr[index+1]);
    //         index +=2;
    //     } else {
    //         res += map.get(str_arr[index]);
    //         index++;
    //     }
    // }
    // return res;
    let res = 0;
    let map = new Map([['I', 1], ['V', 5], ['X', 10], ['L', 50], ['C', 100], ['D', 500], ['M', 1000]]);
    for(let i = 0; i<s.length; i++) {
        if(map.get(s[i]) < map.get(s[i+1])) {
            res -= map.get(s[i]);
        } else {
            res += map.get(s[i]);
        }
    }
    return res;  
};
```