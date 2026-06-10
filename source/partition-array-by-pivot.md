---
title: Leetcode 2161 - Partition Array According to Given Pivot
date: 2026-june-7
---
**`Note`**
The most intuitive approach is to create 3 arrays for `less`, `equal` and `bigger` elements.

But obviously, there should be a more optimized approach. This feels like a 2-pointer branch. 

My mistake was to use 2-pointer on the original nums[ ], but the trick is to use foreach on the input and use double pointers in the result array.

- Initialize result array with default value `pivot` so you don't need to fill in missing pivot values in the middle after run. `Array.Fill(value)`
- The `bigger` section will be in reverse order and you need to reverse. Learned C# has built-in function `Array.Reverse(arr, startIndex, numberOfElements)`

**`Question`**

You are given a `0-indexed` integer array nums and an integer `pivot`. Rearrange nums such that the following conditions are satisfied:

Every element less than `pivot` appears `before` every element greater than pivot.
Every element equal to pivot appears in `between` the elements less than and greater than pivot.
The relative order of the elements less than pivot and the elements greater than pivot is `maintained`.
More formally, consider every `pi`, `pj` where `pi` is the new position of the `ith` element and `pj` is the new position of the `jth` element. If `i` < `j` and both elements are smaller (or larger) than pivot, then `pi` < `pj`.
Return nums after the rearrangement.

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
