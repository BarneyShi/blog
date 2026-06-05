---
title: Leetcode 9 - Palindrome number
date: 2022-06-19 00:00:53
tags:
- math
---
**`Note:`**
- Convert the int to a string might cause overflow.
- Thought about using `%` but how do you know you've half way through it?
- Well, when `x < num`, (num is the reversed second half), we've got the second half reversed.
- Edge case: `10, 120, 110, etc.` because we can't have a leading zero.

**`Question:`**

Given an integer x, return true if x is `palindrome` integer.

An integer is a `palindrome` when it reads the same backward as forward.

- For example, 121 is a palindrome while 123 is not.

**`Example:`**
```
Input: x = 121
Output: true
Explanation: 121 reads as 121 from left to right and from right to left.
```

**`Code:`**
```csharp
public class Solution {
    public bool IsPalindrome(int x) {
        if (x < 0 || x % 10 == 0 && x != 0) return false;
        int reversed = 0;
        while (x > reversed) {
            reversed = reversed * 10 + x % 10;
            x /= 10;
        }
        return reversed == x || x == reversed/10;
    }
}
```