# Leetcode 1833 - Max Ice Cream Bars
# Date - 2026-June-20

**`Question`**

It is a sweltering summer day, and a boy wants to buy some ice cream bars.

At the store, there are `n` ice cream bars. You are given an array `costs` of length n, where `costs[i]` is the price of the `ith` ice cream bar in coins. The boy initially has `coins` coins to spend, and he wants to buy as many ice cream bars as possible. 

Note: The boy can buy the ice cream bars in any order.

Return the `maximum` number of ice cream bars the boy can buy with `coins` coins.

You must solve the problem by `counting sort`.

**Example 1:**

Input: costs = [1,3,2,4,1], coins = 7
Output: 4
Explanation: The boy can buy ice cream bars at indices 0,1,2,4 for a total price of 1 + 3 + 2 + 1 = 7.

**`Notes`**

Good to know about Counting Sort. You initialize an array with size `max+1`. Use index `i` to represent num from
nums array. And array[i] is the count of occurrence. 

So you just need to spend as much many as possible while iterating the sortedArray.

**`Answer`**

```csharp
public class Solution {
    public int MaxIceCream(int[] costs, int coins) {
        var countDict = new Dictionary<int,int>();
        var sortedArray = new int[costs.Max()+1];

        foreach(var cost in costs) {
            sortedArray[cost]++;
        }

        var result = 0;

        for (var i=0;i<sortedArray.Length;i++) {
            var count = sortedArray[i];
            while (count > 0 && coins >= i) {
                coins -= i;
                count--;
                result++;
            }
        }
        return result;
    }
}
```