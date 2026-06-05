---
title: Leetcode 24 - Swap nodes in pairs
date: 2021-11-21 18:22:30
tags:
- linked list
---
**`Note:`**
- Use a `dummyHead` to bring some convenience.
- The terminating conditon is `no nodes left` or the total number of nodes is `odd` so there is `one node left`.

**`Question:`**

Given a linked list, swap every two adjacent nodes and return its head. You must solve the problem without modifying the values in the list's nodes (i.e., only nodes themselves may be changed.)

**`Example:`**

![img](https://assets.leetcode.com/uploads/2020/10/03/swap_ex1.jpg)
```
Input: head = [1,2,3,4]
Output: [2,1,4,3]
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
 * @return {ListNode}
 */
var swapPairs = function(head) {
  let dummyHead = new ListNode();
  dummyHead.next = head;
  let tmp = dummyHead;
  while (tmp.next && tmp.next.next) {
    let prevNext = tmp.next;
    let prevEnd = tmp.next.next.next;
    tmp.next = tmp.next.next;
    tmp.next.next = prevNext;

    tmp = prevNext;
    tmp.next = prevEnd;
  }
  return dummyHead.next;
};
```