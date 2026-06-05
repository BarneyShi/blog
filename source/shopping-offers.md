---
title: Leetcode 638 - Shopping offers
date: 2021-10-23 23:10:11
tags:
- dfs
- backtracking
---
**`Note:`**
- This is a `backtracking` tracking problem. Here, our target is an `array` but not just a `sum`.
- Make item with original price an array like `[0,0,1,...0, price]` and add it into special!
- Remove unqualified elements from `special` in advance.
- Check if we've exceeded needs or fitting needs while iterating. It saves lots of time.
- For `dfs`, we need current `index` so that we won't have repetitive paths, such as `[[1,0,2], [0,1,2]]` with `[[0,1,2], [1,0,2]]`.

**`Question:`**

In LeetCode Store, there are n items to sell. Each item has a price. However, there are some special offers, and a special offer consists of one or more different kinds of items with a sale price.

You are given an integer array price where price[i] is the price of the ith item, and an integer array needs where needs[i] is the number of pieces of the ith item you want to buy.

You are also given an array special where special[i] is of size n + 1 where special[i][j] is the number of pieces of the jth item in the ith offer and special[i][n] (i.e., the last integer in the array) is the price of the ith offer.

Return the lowest price you have to pay for exactly certain items as given, where you could make optimal use of the special offers. You are not allowed to buy more items than you want, even if that would lower the overall price. You could use any of the special offers as many times as you want.

**`Example:`**
```
Input: price = [2,5], special = [[3,0,5],[1,2,10]], needs = [3,2]
Output: 14
Explanation: There are two kinds of items, A and B. Their prices are $2 and $5 respectively. 
In special offer 1, you can pay $5 for 3A and 0B
In special offer 2, you can pay $10 for 1A and 2B. 
You need to buy 3A and 2B, so you may pay $10 for 1A and 2B (special offer #2), and $4 for 2A.
```

**`Code:`**
```javascript
/**
 * @param {number[]} price
 * @param {number[][]} special
 * @param {number[]} needs
 * @return {number}
 */
 var shoppingOffers = function (price, special, needs) {
  // Filter out unqualified specials
 special = special.filter(e => {
   let sum = 0;
   for (let i = 0; i < e.length - 1; i++) {
     sum += price[i] * e[i];
     if (e[i] > needs[i]) return false;
   }
   return sum > e[price.length];
 })
 // Push products with normal price into special
 for (let i = 0; i < price.length; i++) {
   let arr = [...Array(price.length + 1).fill(0)];
   arr[i] = 1;
   arr[arr.length - 1] = price[i];
   special.unshift(arr);
 }

 let result = Infinity;
 let path = [];
 dfs(0, special, needs, 0, [...Array(needs.length + 1).fill(0)]);
 return result;

 function dfs(startIndex, special, needs, expense, shopcart) {
   if (expense > result) return;
   if (!exceedNeeds(shopcart)) return;
   if (fitNeeds(shopcart)) {
     result = Math.min(result, expense);
     return;
   }

   for (let i = startIndex; i < special.length; i++) {
     const cur = special[i];
     path.push(cur);
     expense += cur[cur.length - 1];
     cur.forEach((e, i) => {
       shopcart[i] += e;
     })
     dfs(i, special, needs, expense, shopcart);
     expense -= cur[cur.length - 1];
     cur.forEach((e, i) => {
      shopcart[i] -= e;
    })
     path.pop();
   }
 }

 function exceedNeeds(shopcart) {
   for (let i = 0; i < shopcart.length - 1; i++) {
     if (shopcart[i] > needs[i]) return false;
   }
   return true;
 }

 function fitNeeds(shopcart) {
   for (let i = 0; i < shopcart.length - 1; i++) {
     if (shopcart[i] !== needs[i]) return false;
   }
   return true;
 }
};

```