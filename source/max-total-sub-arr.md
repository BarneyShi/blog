---
title: Leetcode 3689 - Maximum Total Subarray Value I
date: 2026-june-9
tags:
- stupid
---
**`Question`**
You are given an integer array nums of length n and an integer `k`.

You need to choose exactly `k` non-empty `subarrays` `nums[l..r]` of nums. Subarrays may overlap, and the exact same subarray (same l and r) can be chosen more than once.

The value of a subarray `nums[l..r]` is defined as: `max(nums[l..r]) - min(nums[l..r])`.

The total value is the sum of the values of all chosen subarrays.

Return the maximum possible total value you can achieve.

**`Examples`**

Example 1:

Input: nums = [1,3,2], k = 2

Output: 4

Explanation:

One optimal approach is:

Choose nums[0..1] = [1, 3]. The maximum is 3 and the minimum is 1, giving a value of 3 - 1 = 2.
Choose nums[0..2] = [1, 3, 2]. The maximum is still 3 and the minimum is still 1, so the value is also 3 - 1 = 2.
Adding these gives 2 + 2 = 4.

**`Note`**

- Don't be fooled by its difficult. Just get `max` and `min` and multiple their diff with `k`.
- One thing to notice is int * int might exceed Max int32, so you need to cast `before` multiplying them.

```csharp
public class Solution {
    public long MaxTotalValue(int[] nums, int k) {
        var max = nums.Max();
        var min = nums.Min();
        long result = (long)k * max - (long) k *min;
        return result;
    }
}
```