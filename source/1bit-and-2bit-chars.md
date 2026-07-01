---
title: Leetcode 717 - 1-bit and 2-bit chars
date: 2026-07-01
tags:
- dfs
---
**`Question:`**

We have two special characters:

- The first character can be represented by one bit `0`.
- The second character can be represented by two bits (`10` or `11`).
Given a binary array bits that ends with 0, return true if the last character must be a one-bit character.

**`Example:`**
```
Input: bits = [1,0,0]
Output: true
Explanation: The only way to decode it is two-bit character and one-bit character.
So the last character is one-bit character.
```
**`Note:`**
- 很典型的`DFS`问题。
- 分类讨论，如果长度为1并且为0，返回true。否则false。
- 如果长度为2，判断是否有复合`10`,`11`,`00`的，返回true。否则false。
- 注意在写return的时候，要把短的int[]放在前面这样可以提早terminate明显不符合要求的。


**`Code:`**
```csharp
public class Solution {
    public bool IsOneBitCharacter(int[] bits) {
        var length = bits.Length;
        
        if (bits[length-1] != 0) return false;
        return FindPath(bits[0..(length-1)]);
    }

    private bool FindPath(int[] bits) {
        var length = bits.Length;

        if (length == 0) return true;
        if (length == 1 && bits[0] == 1) return false;
        if (length == 1 && bits[0] == 0) return true;

        if (length == 2 && bits[0] == 1 && bits[1] == 0) return true;
        if (length == 2 && bits[0] == 1 && bits[1] == 1) return true;
        if (length == 2 && bits[0] == 0 && bits[1] == 0) return true;
        if (length == 2 && bits[0] == 0 && bits[1] == 1) return false;

        return FindPath(bits[(length-2)..]) && FindPath(bits[0..(length-2)])|| 
        FindPath(bits[(length-1)..]) && FindPath(bits[0..(length-1)]);
    }
}
```