---
title: Leetcode 92 - Reverse linked list II
date: 2021-11-25 17:42:38
tags:
- linked list
---
**`Note:`**
- Not like normal `reversing linked list`, we need to fix a `prev` pointer and only move `curr`.
- Use a `dummy` in case left is equal to 1.
- ![img](https://i.imgur.com/8ERfzoh.png)
- The most important step: `tmp.next = prev.next`. Don't use tmp.next = curr.

**`Question:`**

Given the `head` of a singly linked list and two integers `left` and `right` where `left <= right`, reverse the nodes of the list from position `left` to position `right`, and return the reversed list.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/02/19/rev2ex2.jpg)
```
Input: head = [1,2,3,4,5], left = 2, right = 4
Output: [1,4,3,2,5]
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
 * @param {number} left
 * @param {number} right
 * @return {ListNode}
 */
var reverseBetween = function(head, left, right) {
  let dummy = new ListNode();
  dummy.next = head;
  let prev = dummy;
  let i = 1;
  while (i < left) {
    i++;
    prev = prev.next;
  }
  let curr = prev.next;
  while (i < right) {
    i++;
    let tmp = curr.next;
    curr.next = tmp.next;
    tmp.next = prev.next;
    prev.next = tmp;
  }
  return dummy.next;
};
```