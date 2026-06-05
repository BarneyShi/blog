---
title: Leetcode 278 - First bad version
date: 2021-11-07 22:36:01
tags:
- binary search
---
**`Note:`**
- From now on, use `<` as while loop's terminating condition.
- When `while` loop stop, `left == right`.
- It's more elegant.

**`Question:`**

You are a product manager and currently leading a team to develop a new product. Unfortunately, the latest version of your product fails the quality check. Since each version is developed based on the previous version, all the versions after a bad version are also bad.

Suppose you have `n` versions `[1, 2, ..., n]` and you want to find out the first bad one, which causes all the following ones to be bad.

You are given an API `bool isBadVersion(version)` which returns whether `version` is bad. Implement a function to find the first bad version. You should minimize the number of calls to the API.

**`Example:`**
```
Input: n = 5, bad = 4
Output: 4
Explanation:
call isBadVersion(3) -> false
call isBadVersion(5) -> true
call isBadVersion(4) -> true
Then 4 is the first bad version.
```

**`Code:`**
```javascript
/**
 * Definition for isBadVersion()
 * 
 * @param {integer} version number
 * @return {boolean} whether the version is bad
 * isBadVersion = function(version) {
 *     ...
 * };
 */

/**
 * @param {function} isBadVersion()
 * @return {function}
 */
var solution = function(isBadVersion) {
    /**
     * @param {integer} n Total versions
     * @return {integer} The first bad version
     */
    return function(n) {
        let left = 1, right = n;
        // Use < instead of <=
        while (left < right) {
          const middle = left + (right - left >> 1);
          if (!isBadVersion(middle)) {
            left = middle + 1;
          } else {
            right = middle;
          }
        }
        // return right is also correct;
        return left;
    };
};
```