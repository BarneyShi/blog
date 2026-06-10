---
title: Leetcode 2574 - Left and Right Sum Differences
date: 2026-june-09
---
**`Notes`**

Build a array `Sums[]` in which each element is the prefix sum of all previous int including the current one.

**`Question`**

You are given a 0-indexed integer array nums of size n.

Define two arrays `leftSum` and `rightSum` where:

`leftSum[i]` is the sum of elements to the left of the index i in the array nums. If there is no such element, `leftSum[i]` = 0.
`rightSum[i]` is the sum of elements to the right of the index i in the array nums. If there is no such element, `rightSum[i] `= 0.
Return an integer array answer of size n where answer`[i] = |leftSum[i] - rightSum[i]|`.


```csharp
public class Solution {
    public int[] LeftRightDifference(int[] nums) {
        var sums = new int[nums.Length];
        var total = 0;
        var result = new int[nums.Length];
        sums[0] = nums[0];
        total += nums[0];

        for (var i = 1; i < nums.Length; i++) {
            sums[i] = sums[i - 1] + nums[i];
            total += nums[i];
        }

        result[0] = Math.Abs(total - sums[0] - (sums[0] - nums[0]));

        for (var j = 1; j < nums.Length; j++) {
            result[j] = Math.Abs(total - sums[j] - (sums[j] - nums[j]));
        }
        return result;

    }
}
```
