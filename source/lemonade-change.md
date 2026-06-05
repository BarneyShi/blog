---
title: Leetcode 860 - Lemonade change
date: 2021-10-06 21:35:36
tags:
- greedy
---
**`Note:`**
- What I thought was naive is what most ppl did.
- Try to give changes with bigger values.
- Use an array to store how many bills we have for each value.

At a lemonade stand, each lemonade costs `$5`. Customers are standing in a queue to buy from you, and order one at a time (in the order specified by bills). Each customer will only buy one lemonade and pay with either a `$5`, `$10`, or `$20` bill. You must provide the correct change to each customer so that the net transaction is that the customer pays `$5`.

Note that you don't have any change in hand at first.

Given an integer array bills where bills[i] is the bill the ith customer pays, return true if you can provide every customer with correct change, or false otherwise.

**`Example`**
```
Input: bills = [5,5,5,10,20]
Output: true
Explanation: 
From the first 3 customers, we collect three $5 bills in order.
From the fourth customer, we collect a $10 bill and give back a $5.
From the fifth customer, we give a $10 bill and a $5 bill.
Since all customers got correct change, we output true.
```

```javascript
/**
 * @param {number[]} bills
 * @return {boolean}
 */
var lemonadeChange = function(bills) {
  let cash = [0,0,0];
  for (let i = 0; i < bills.length; i++) {
    if (bills[i] === 20) {
      if (cash[1] >= 1 && cash[0] >= 1) {
        cash[1]--;
        cash[0]--;
        cash[2]++;
        continue;
      } else if (cash[0] >= 3) {
        cash[0] -= 3;
        cash[2]++;
        continue;
      }
      return false;
    } else if (bills[i] === 10) {
      if (cash[0] >= 1) {
        cash[0]--;
        cash[1]++;
        continue;
      }
      return false;
    } else if (bills[i] === 5) {
      cash[0]++;
      continue;
    }
  }
  return true;
};
```