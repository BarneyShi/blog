# Leetcode 3737 - Count Subarrays With Majority Element I
## Date: 2026-June-24

**`Question`**
You are given an integer array nums and an integer target.

Return the number of `subarrays` of nums in which target is the majority element.

The majority element of a subarray is the element that appears strictly `more` than half of the times in that subarray.

Example 1:

Input: nums = [1,2,2,3], target = 2

Output: 5

Explanation:

Valid subarrays with target = 2 as the majority element:

nums[1..1] = [2]
nums[2..2] = [2]
nums[1..2] = [2,2]
nums[0..2] = [1,2,2]
nums[1..3] = [2,2,3]
So there are 5 such subarrays.

**`Note`**
- 因为length比较小，所以可以用两个loop
- 关键点是如果是majority，那么在subarray里，target element出现次数*2一定要大于subarray的长度。

**`Solution`**

```csharp
public class Solution {
    public int CountMajoritySubarrays(int[] nums, int target) {
        var result = 0;
        for (var i = 0; i < nums.Length; i++) {
            var count = 0;
            for (var j = i; j < nums.Length; j++) {
                if (nums[j] == target) count++;
                if (2*count > j-i+1) result++;
            }
        }
        return result;
    }
}
```