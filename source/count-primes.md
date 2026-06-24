# Leetcode 204: Count Primes
## Date: 2026-June-22

**`Question`**

Given an integer `n`, return the number of prime numbers that are strictly `less` than `n`.

Example 1:

Input: n = 10 <br>
Output: 4 <br>
Explanation: There are `4` prime numbers less than 10, they are 2, 3, 5, 7.

**`Notes`**
- Because `sqrt(n)^2 = n`, for any number, we just need to count from `2~sqrt(n)` to speed up.
- Create a length `n` array
- 对于每个 `i`, 如果计算 `i*i`直到`i*(n-1)`, 在小于`i*i`的数里，就会有很多数已经被计算过了。比如当`i=5`,如果计算`25， 26，27, ...`这样的话，其实`26`已经在`2*13`计算过了，`27`已经在`3*9`被计算过了。所以你要算的只需要是`5`的倍数。所以在inner forloop，在increment的时候要用`j+=i`而不是加1。

**`Overtime Solution`**
```csharp
public class Solution {
    public int CountPrimes(int n) {
        var result = 0;

        for (var i = 2;i<n;i++) {
            if (IsPrime(i)) result++;
        }
        return result;
    }

    private bool IsPrime(int n) {
        var sqrt = (int)Math.Sqrt(n);
        for (var i = 2; i <= sqrt; i++) {
            if (n % i == 0) return false; 
        }
        Console.WriteLine($"{n} is prime");
        return true;
    }
}
```

```csharp
public class Solution {
    public int CountPrimes(int n) {
        if (n <= 2) return 0; 
        var result = new int[n];
        var sqrt = Math.Sqrt(n);
        for (var i = 2; i < sqrt; i++) {
            for (var j = i*i; j < n; j+=i) {
                    result[j] = 1;
                }
            }

        var count = 0;
        for (var i = 2; i < n; i++) {
            if (result[i] == 0) count++;
        }
        return count;
    }
}
```