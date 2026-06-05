---
title: Leetcode 382 - Linked List Random Node
date: 2021-12-10 02:26:27
tags:
- linked list
- reservoir sampling
---
**`Note:`**
- Assume there is lots of data and you don't know about the length of it. How to pick `one` randomly in `O(N)`?
- Use `reservoir sampling`!
  - Conclusion: The possibility of num with index `i` to be picked is <font color=Green>**k / N**</font> . (n is the count of all nums so far. k is how many nums we want to pick)
  - Proof:
- ![img](https://i.imgur.com/w51yFQ3.png)
- Detail:
  1. When `i > k`, pick a random number between `[1, i]`.
  2. If `ran < K`, it means we randomly picked an `interval` with length `k`. The possibility of it is `k / n`. So we need to keep the cur.
  3. But which one should be replaced?
  4. The possibility to picked one from `result[]` is also `1 / k`. 
  5. Now that `ran` is between `[1, K]`. Let's replace `k[ran]` with `k[i]` coz we picked `k[ran]` among `k` elements with the possibility of `1 / k`.

**`Question:`**

Given a singly linked list, return a random node's value from the linked list. Each node must have the same probability of being chosen.

Implement the `Solution` class:

- `Solution(ListNode head)` Initializes the object with the integer array nums.
- `int getRandom()` Chooses a node randomly from the list and returns its value. All the nodes of the list should be equally likely to be choosen.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/03/16/getrand-linked-list.jpg)
```
Input
["Solution", "getRandom", "getRandom", "getRandom", "getRandom", "getRandom"]
[[[1, 2, 3]], [], [], [], [], []]
Output
[null, 1, 3, 2, 2, 3]

Explanation
Solution solution = new Solution([1, 2, 3]);
solution.getRandom(); // return 1
solution.getRandom(); // return 3
solution.getRandom(); // return 2
solution.getRandom(); // return 2
solution.getRandom(); // return 3
// getRandom() should return either 1, 2, or 3 randomly. Each element should have equal probability of returning.
```

**`Code:`**
```javascript
/**
 * Definition for singly-linked list.
 * function ListNode(val, next) {
 *     this.val = (val===undefined ? 0 : val)
 *     this.next = (next===undefined ? null : next)
 * }
 */
/**
 * @param {ListNode} head
 */
var Solution = function(head) {
  this.head = head;
};

/**
 * @return {number}
 */
Solution.prototype.getRandom = function() {
  let count = 0;
  let cur = this.head;
  let reserved;
  while (cur) {
    count++;
    const random = Math.floor(Math.random() * count) + 1;
    // The possiblity to pick a random that's equal to `count` is 1 / k. 
    // Based on our theory, an element in `res[]` should be replaced. Because k === 1, it must be the only element then.
    if (random === count) {
      reserved = cur.val;
    }
    cur = cur.next;
  }
  return reserved;
};

/**
 * Your Solution object will be instantiated and called as such:
 * var obj = new Solution(head)
 * var param_1 = obj.getRandom()
 */
```