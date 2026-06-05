---
title: Leetcode 458 - Poor pigs
date: 2021-11-24 16:19:03
tags:
- math
---
**`Note:`**
- ![img](https://i.imgur.com/Qt4mCDx.png)
- First, a pig can drink `many` buckets at `one time`.
- Name all buckets from `0` to `n - 1`.
- Start from a simple example, assume there are `1000` buckets, `15` minToTest, `15` minToDie.
- Because `2^10 > 1000 > 2^9`. We need `10` pigs.
- Allot each pig with a `digit` of the `10-digit` binary number.
- If a pig `dies` after drinking all the `buckets with digit 1`. It means the number of the poisonous bucket has `1` on that digit.
- ![img](https://i.imgur.com/Kh7Zhdk.png)
- ![img](https://i.imgur.com/OcALf8O.png)

**`Question:`**

There are `buckets` buckets of liquid, where `exactly one` of the buckets is poisonous. To figure out which one is poisonous, you feed some number of (poor) pigs the liquid to see whether they will die or not. Unfortunately, you only have `minutesToTest` minutes to determine which bucket is poisonous.

You can feed the pigs according to these steps:

1. Choose some live pigs to feed.
2. For each pig, choose which buckets to feed it. The pig will consume all the chosen buckets simultaneously and will take no time.
3. Wait for `minutesToDie` minutes. You may not feed any other pigs during this time.
4. After `minutesToDie` minutes have passed, any pigs that have been fed the poisonous bucket will die, and all others will survive.
5. Repeat this process until you run out of time.

Given `buckets`, `minutesToDie`, and `minutesToTest`, return the `minimum` number of pigs needed to figure out which bucket is poisonous within the allotted time.

**`Example:`**
```
Input: buckets = 1000, minutesToDie = 15, minutesToTest = 60
Output: 5
```

**`Code:`**
```javascript
/**
 * @param {number} buckets
 * @param {number} minutesToDie
 * @param {number} minutesToTest
 * @return {number}
 */
var poorPigs = function(buckets, minutesToDie, minutesToTest) {
  const base = ~~(minutesToTest / minutesToDie) + 1;
  return Math.ceil(Math.log(buckets) / Math.log(base));
};
```