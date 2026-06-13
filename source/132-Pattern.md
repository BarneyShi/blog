---
title: Leetcode 456 - 132 Pattern
date: 2026-June-13
tags:
- monotonic stack
---
**`Note:`**
- For every `i`, need to find a pair `(j, k)` after `i` that `i < k < j`.
- We have to iterate backwards cuz `j` and `k` appear after `i`. You need to have
`(j,k)` ready when you do iterate for `i`.
- What kind of data structure do we need?
  - It can store potential `j`.
  - All nums that are smaller than `j` need to be removed.
- Yes, it's monotonic stack in `non-increasing order`.
- Everytime we pop out a num, compare it with `maxK` to keep max.
- Once current num `< maxK`, it means we found nums[i]. And we're sure there are nums in the stack that are bigger than `nums[j]` and thus bigger than `nums[i]`.

**`Question:`**

Given an array of `n` integers `nums`, a 132 pattern is a subsequence of three integers `nums[i]`, `nums[j]` and `nums[k]` such that `i < j < k` and `nums[i] < nums[k] < nums[j]`.

Return `true` if there is a 132 pattern in `nums`, otherwise, return `false`.

**`Example:`**
```
Input: nums = [3,1,4,2]
Output: true
Explanation: There is a 132 pattern in the sequence: [1, 4, 2].
```

**`Code:`**
```csharp
public class Solution {
    public bool Find132pattern(int[] nums) {
        var maxK = int.MinValue;
        var stack = new Stack<int>();

        for(var i = nums.Count()-1; i >=0; i--) {
            var num = nums[i];
            if (num < maxK) {
                return true;
            }

            while (stack.Count > 0 && num > stack.Peek()){
                var top = stack.Pop();
                if (top > maxK) {
                    maxK = top;
                }
            }
            stack.Push(num);
        }
        return false;
    }
}
```