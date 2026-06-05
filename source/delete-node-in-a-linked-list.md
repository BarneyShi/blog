---
title: Leetcode 237 - Delete node in a linked list
date: 2021-11-01 17:38:08
tags:
- double pointers
- linked list
---
**`Note:`**
- Use `fast` and `slow` pointer.
- Be careful of the condition of `while` loop.
- Need to truncate the linked list at last, to assign its end as `null`.

**`Question:`**

Write a function to delete a node in a singly-linked list. You will `not` be given access to the `head` of the list, instead you will be given access to the node to be deleted directly.

It is guaranteed that the node to be deleted is not a tail node in the list.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2020/09/01/node1.jpg)
```
Input: head = [4,5,1,9], node = 5
Output: [4,1,9]
Explanation: You are given the second node with value 5, the linked list should become 4 -> 1 -> 9 after calling your function.
```

**`Code:`**
```javascript
/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */
/**
 * @param {ListNode} node
 * @return {void} Do not return anything, modify node in-place instead.
 */
var deleteNode = function(node) {
  let slow = node, fast = node.next;
  while (fast.next) {
    slow.val = fast.val;
    slow = fast;
    fast = fast.next;
  }
  slow.val = fast.val;
  slow.next = null;
};
```