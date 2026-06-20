# Leetcide 494 - Target sum
## Date: 2026-June-19

**`Question`**

You are given an integer array nums and an integer target.

You want to build an expression out of nums by adding one of the symbols '+' and '-' before each integer in nums and then concatenate all the integers.

For example, if nums = [2, 1], you can add a '+' before 2 and a '-' before 1 and concatenate them to build the expression "+2-1".
Return the number of different expressions that you can build, which evaluates to target.

**Example:**
```
Input: nums = [1,1,1,1,1], target = 3
Output: 5
Explanation: There are 5 ways to assign symbols to make the sum of nums be target 3.
-1 + 1 + 1 + 1 + 1 = 3
+1 - 1 + 1 + 1 + 1 = 3
+1 + 1 - 1 + 1 + 1 = 3
+1 + 1 + 1 - 1 + 1 = 3
+1 + 1 + 1 + 1 - 1 = 3
```

**`Note:`**
- This is also a `01 knapsack` problem.
- Define dp array `dp[i,j]`. It means the `amount` of ways to get sum `j` using `first i` elements, which are `nums[0], nums[1], ...nums[i-1]`. Note, it's `nums[i-1]` not `nums[i]`.
- For each num, you can `add` or `minus` it. When you `add` it, then you need `dp[i,j-num]` to combine to `(j-num+num=j`. Similarly, when you `minus` num, you need `dp[i,j+num]`.
- Assume `sum` is sum of all nums. Then `j` is between `[-sum,sum]`.
- Init `dp[0,0] = 1` means not pick any number to get sum 0. There's only 1 way.
- About dimension of dp array. Number of i's is `nums.Length+1` because index `i` starts at `0` and ends at `length+1`.
Number of j's is `2*sum+1` becauses it starts at `-sum` and ends at `sum`.
- The induction formula is `dp[i,j] = dp[i-1,j-num] + dp[i-1,j+num]`.
- However, because `j<0` is possible during iteration, so you must ensure `j-num > 0`. Then we need an `offset` for all `j`'s. Use `offset=sum` is suitable.
- Finally, when you have `j-num+offset` and `j+num+offset`. You must make sure `j-num+offset>=0` and `j+num+offset<=2*sum` so no out of boundary exception.


```csharp
public class Solution {
    public int FindTargetSumWays(int[] nums, int target) {
        var sum = nums.Sum();
        var dp = new int[nums.Length+1, 2*sum + 1];
        var offset = sum;

        if (target < -sum || target > sum) return 0;

        dp[0,0+offset] = 1;

        for (var i = 1; i <= nums.Length; i++) {
            var num = nums[i-1];
            for (var j = -sum; j <= sum; j++) {

                if (j-num+offset >= 0) {
                    dp[i,j+offset] += dp[i-1, j-num+offset];
                }

                if (j+num+offset <= 2*sum) {
                    dp[i,j+offset] += dp[i-1, j+num+offset];
                }
            }
        }
        return dp[nums.Length, target + sum];
    }
}
```