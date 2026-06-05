---
title: Leetcode 443 - String Compression
date: 2021-12-24 23:32:05
tags:
- sliding window
---
**`Note:`**
- Because we need O(1) space, we have to do in-place replace.
- In order not to store `count` as a string, we need to replace elements with num backwards, then reverse what we've replace. That's what the `reverse()` helper is for.

**`Question:`**

Given an array of characters `chars`, compress it using the following algorithm:

Begin with an empty string `s`. For each group of consecutive repeating characters in `chars`:

- If the group's length is `1`, append the character to `s`.
- Otherwise, append the character followed by the group's length.

The compressed string `s` should not be returned separately, but instead, be stored in the input character array chars. Note that group lengths that are 10 or longer will be split into multiple characters in `chars`.

After you are done `modifying the input array`, return the new length of the array.

You must write an algorithm that uses only constant extra space.

**`Example:`**
```
Input: chars = ["a","a","b","b","c","c","c"]
Output: Return 6, and the first 6 characters of the input array should be: ["a","2","b","2","c","3"]
Explanation: The groups are "aa", "bb", and "ccc". This compresses to "a2b2c3".
```

**`Code:`**
```javascript
/**
 * @param {character[]} chars
 * @return {number}
 */
 var compress = function(chars) {
  let left = 0, right = 0;
  while (right < chars.length) {
    // Replace ch[left] with curr char.
    chars[left] = chars[right];
    let count = 1;
    while (chars[right] === chars[right + 1]) {
      right++;
      count++;
    }
    if (count > 1) {
      left++;
      // Prepare for reversing.
      const reverseStart = left;
      const reverseEnd = (count + '').length + left - 1;
      while(count > 0) {
        chars[left] = count % 10 + '';
        count = Math.floor(count / 10);
        left++;
      }
      reverse(reverseStart, reverseEnd);
    } else {
      left++;
    }
    right++;
  }
  return left;

  function reverse(l, r) {
    while (l < r) {
      [chars[l], chars[r]] = [chars[r], chars[l]];
      l++;
      r--;
    }
  }
};
```