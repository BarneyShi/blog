---
title: Leetcode 86 - Partition list
date: 2021-11-24 20:14:00
tags:
- linked list
- double pointers
---
**`Note:`**
- Use two `dummy heads`.
- Go through the list with a pointer `tmp`, when `tmp.val >= x`, append the current node to `bigHead`.
- And remember to let `tmp.next = null`.
- Finally, connect `smallPointer` to `bigHead.next`
- Return `smallHead.next`.

**`Question:`**

Given the `head` of a linked list and a value `x`, partition it such that all nodes less than `x` come before nodes `greater than or equal` to `x`.

You should `preserve` the original relative order of the nodes in each of the two partitions.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/01/04/partition.jpg)
```
Input: head = [1,4,3,2,5,2], x = 3
Output: [1,2,2,4,3,5]
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
 * @param {number} x
 * @return {ListNode}
 */
var partition = function(head, x) {
  let bigHead = new ListNode(), smallHead = new ListNode();
  let tmp = head;
  let bigPointer = bigHead, smallPointer = smallHead;
  while (tmp) {
    if (tmp.val < x) {
      smallPointer.next = tmp;
      smallPointer = smallPointer.next;
    } else {
      bigPointer.next = tmp;
      bigPointer = bigPointer.next;
    }
    let next = tmp.next;
    tmp.next = null;
    tmp = next;
  }
  smallPointer.next = bigHead.next;
  return smallHead.next;
};
```