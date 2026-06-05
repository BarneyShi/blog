---
title: Leetcode 535 - Encode and Decode TinyURL
date: 2022-01-09 17:15:57
tags:
- hash table
---
**`Note:`**
- Learned how to use `random().toString(36)` to generate random strings.
- `36-base` system use all `0-9`, `a-z`, `A-Z`, which is quite useful.

**`Question:`**

TinyURL is a URL shortening service where you enter a URL such as https://leetcode.com/problems/design-tinyurl and it returns a short URL such as http://tinyurl.com/4e9iAk. Design a class to encode a URL and decode a tiny URL.

There is no restriction on how your encode/decode algorithm should work. You just need to ensure that a URL can be encoded to a tiny URL and the tiny URL can be decoded to the original URL.

Implement the Solution class:

- `Solution()` Initializes the object of the system.
- `String encode(String longUrl)` Returns a tiny URL for the given `longUrl`.
- `String decode(String shortUrl)` Returns the original long URL for the given shortUrl. It is guaranteed that the given `shortUrl` was encoded by the same object.

**`Example:`**
```
Input: url = "https://leetcode.com/problems/design-tinyurl"
Output: "https://leetcode.com/problems/design-tinyurl"

Explanation:
Solution obj = new Solution();
string tiny = obj.encode(url); // returns the encoded tiny url.
string ans = obj.decode(tiny); // returns the original url after deconding it.
```

**`Code:`**
```javascript
/**
 * Encodes a URL to a shortened URL.
 *
 * @param {string} longUrl
 * @return {string}
 */
let map = new Map();
var encode = function(longUrl) {
  let hash;
  while (hash === undefined || map.has(hash)) {
    hash = Math.random().toString(36).slice(0, 10);
  }
  map.set(hash, longUrl);
  return 'http://tinyurl.com/' + hash;
};

/**
 * Decodes a shortened URL to its original URL.
 *
 * @param {string} shortUrl
 * @return {string}
 */
var decode = function(shortUrl) {
  return map.get(shortUrl.slice(19));
};

/**
 * Your functions will be called as such:
 * decode(encode(url));
 */
```