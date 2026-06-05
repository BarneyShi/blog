---
title: Leetcode 206 - Reverse linked list
date: 2021-10-11 20:23:05
tags:
- linked list
---
**`Note:`**
- Use two pointers.
- Need a `null` head as the new `end`.

**`Question:`**

Given the head of a singly linked list, reverse the list, and return the reversed list.

**`Example:`**
![img](https://assets.leetcode.com/uploads/2021/02/19/rev1ex1.jpg)
```
Input: head = [1,2,3,4,5]
Output: [5,4,3,2,1]
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
var reverseList = function(head) {
  if (!head) return head;
  const nullNode = null;
  let slow = nullNode;
  let fast = head;
  while (fast) {
    let tmp = fast.next;
    fast.next = slow;
    slow = fast;
    fast = tmp;
  }
  return slow;
};
```