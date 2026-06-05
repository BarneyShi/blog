---
title: Leetcode 69 - Sqrt
date: 2021-08-18 22:52:29
tags:
- leetcode
- math
---
Given a non-negative integer `x`, compute and return *the square root of* `x`.

Since the return type is an integer, the decimal digits are **truncated**, and only **the integer part** of the result is returned.

 

**Example 1:**

```
Input: x = 4
Output: 2
```

**Example 2:**

```
Input: x = 8
Output: 2
Explanation: The square root of 8 is 2.82842..., and since the decimal part is truncated, 2 is returned.
```

 

**Constraints:**

- `0 <= x <= 231 - 1`

**Thoughts**: To use `binary search`, initialize `left` as `0` and `right` as `Number.MAX_VALUE`. Everytime we compare `mid` with `x/mid` in which `mid` is just `left + (right-left)/2`. We have to write it in this form so it won't overflow. Also, when we compare if `mid^2` is bigger or smaller than `x`, we have to write it as `mid` vs `x/mid`.

```javascript
/**
 * @param {number} x
 * @return {number}
 */
var mySqrt = function(x) {
    let left = 0;
    let right = Math.floor(x/2+1); // Use floor to convert res to integer

    while(true){
        let mid = Math.floor(left + (right-left)/2); // same as above
        if(mid > x/mid) {
            right = mid-1;
        } else {                                     
          	// For mid < x/mid, there are two situations
            if (mid+1 > x/(mid+1)) return mid;
            left = mid+1;
        }
    }
};
```

