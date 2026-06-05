---
title: Leetcoe 148 - Sort list
date: 2021-11-13 03:16:26
tags:
- sort
- linked list
---
**`Note:`**
- What is merge sort?
- ![img](https://i.imgur.com/4RSmbE3.png)
- `Recursively` to dissect nodes into a single node. Then `merge` them together.
- Another knowledge is `how to find the middle node`?
  - Use `fast` and `slow` pointer. Fast pointers moves two nodes per time, but slow pointer moves once.
  - The terminating condition is `fast.next && fast.next.next`, targeting both `odd` and `even` number of nodes.
- For merging, use a `dummyHead`, and another tmp to move around. The result should be the `dummyHead`.

**`Question:`**

Given the `head` of a linked list, return the list after sorting it in `ascending` order.

**`Example:`**
![img](https://assets.leetcode.com/uploads/2020/09/14/sort_list_1.jpg)
```
Input: head = [4,2,1,3]
Output: [1,2,3,4]
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
var sortList = function (head) {
  return mergeSort(head);

  function mergeSort(node) {
    // Don't return null, return NODE!!
    if (!node || !node.next) return node;
    let slow = node, fast = node;
    while(fast.next && fast.next.next) {
      slow = slow.next;
      fast = fast.next.next;
    }
    const headOfSecondHalf = slow.next;
    slow.next = null;
    const half1 = mergeSort(node);
    const half2 = mergeSort(headOfSecondHalf);
    return merge(half1, half2);
  }

  function merge(head1, head2) {
    const tmp = new ListNode();
    let cur = tmp;
    while (head1 && head2) {
      if (head1.val < head2.val) {
        cur.next = head1;
        head1 = head1.next;
      } else {
        cur.next = head2;
        head2 = head2.next;
      }
      cur = cur.next;
    }
    cur.next = head1 === null ? head2 : head1;
    return tmp.next;
  }
};
```