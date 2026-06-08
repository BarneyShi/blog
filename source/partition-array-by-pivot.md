---
title: Leetcode 647 - Palindromic substrings
date: 2021-09-24 02:26:55
tags:
- dp
---
**`Note`**
The most intuitive approach is to create 3 arrays for `less`, `equal` and `bigger` elements.

But obviously, there should be a more optimized approach. This feels like a 2-pointer branch. 

My mistake was to use 2-pointer on the original nums[ ], but the trick is to use foreach on the input and use double pointers in the result array.

- Initialize result array with default value `pivot` so you don't need to fill in missing pivot values in the middle after run. `Array.Fill(value)`
- The `bigger` section will be in reverse order and you need to reverse. Learned C# has built-in function `Array.Reverse(arr, startIndex, numberOfElements)`

```csharp
public class Solution {
    public int[] PivotArray(int[] nums, int pivot) {
        var result = new int[nums.Count()];
        var left = 0;
        var right = result.Count() - 1;

        Array.Fill(result, pivot);

        foreach(var e in nums) {
            if (e < pivot) {
                result[left] = e;
                left++;
            }
            if (e > pivot) {
                result[right] = e;
                right--;
            }
        }

        Array.Reverse(result, right + 1, nums.Count() - (right + 1));

        return result;
    }
}
```
