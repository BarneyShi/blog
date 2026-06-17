# Leetcode 3614 - Process String with Special Operations II
## Date: 2026-06-16

**`Question`**
You are given a string s consisting of lowercase English letters and the special characters: '*', '#', and '%'.

You are also given an integer `k`.

Build a new string result by processing s according to the following rules from left to right:

- If the letter is a lowercase English letter append it to result.
- A `*` removes the last character from result, if it exists.
- A `#` duplicates the current result and appends it to itself.
- A `%` reverses the current result.

Return the kth character of the final string result. If k is out of the bounds of result, return `.`.

**`Notes`**
- Iterate the string one by one and find kth char will def timeout. Because doubling the length and reversing will be expensive.
- However, just getting the `length` first will be quick.
- Start `backwards` and continuously adjust `k` and result string's `length`.
    - If input[i] is `*`, when you move backwards to input[i-1], you need to change result string's length as `length+1`. K will still be the same.
    - If input[i] is `#`, it's the tricky part. 
        - First, change `length = length / 2`. 
        - Second, if `k+1 <= length`, it means k will be in the first half result and no need to change. An example will be `abcabc` and `k = 2`, k will be in the first half. 
            - Otherwise, k will be in second half. And `k=k-length`.
    - If input[i] is `%`, `length` doesn't change. But `k=length-k-1`. You can use `abcd` and k=2 as example.

**`Solution`**

```csharp
public class Solution {
    public char ProcessStr(string s, long k) {
        var length = GetLength(s);
        if (length < k + 1) return '.';

        for(var i=s.Length-1;i>=0;i--){
            var cur = s[i];

            if (cur == '*') {
                length++;
                continue;
            }
            if (cur == '#') {
                length /= 2;
                if (k + 1 > length) {
                    k -= length;
                }
                continue;
            }
            if (cur == '%') {
                k = length - (k+1);
                continue;
            }
            if (k + 1 == length) {
                return cur;
            }
            length--;
        }
        return '.';
    }

    private long GetLength(string s) {
        long length = 0;
        foreach(var cur in s) {
            if (cur == '*') {
                length = length > 0 ? length - 1 : 0;
            } else
            if (cur == '#') {
                length *= 2;
            } else 
            if (cur == '%') {
                length = length;
            } else {
                length += 1;
            }
        }
        return length;
    }
}
```