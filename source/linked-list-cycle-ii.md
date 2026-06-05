---
title: Leetcode 142 - Linked list cycle II
date: 2021-10-11 23:58:51
tags:
---
**`Note:`**
- Double pointers:
  - Just like `Linked list cycle I`, we should use `double pointers` but it's more complicated.
  - ![img](https://i.imgur.com/hHFR4Ht.png)
  - By using 2-pointer, we can find the node where two pointers meet.
  - Here comes the deduction: 
    - Assume `fast` pointer has travelled `n` rounds inside the cycle.
    - Because `fast` always travels `2 times` more than `slow`, we have `2*(a + b) = a + n*(b + c) + b`, which is `a = c + (n-1)*b`.
    - If `n = 1`, we have `a = c`.
    - Because right now `slow` is at `b`, we can use another pointer at the start. And if they both start moving, they will  meet at the intersection!.
- Use `Set` to tell if we've iterated the current node before.

**`Question:`**

Given the head of a linked list, return the node where the cycle begins. If there is no cycle, return null.

There is a cycle in a linked list if there is some node in the list that can be reached again by continuously following the next pointer. Internally, pos is used to denote the index of the node that tail's next pointer is connected to (0-indexed). It is -1 if there is no cycle. `Note` that pos is not passed as a parameter.

`Do not modify` the linked list.

**`Example:`**
![img](https://assets.leetcode.com/uploads/2018/12/07/circularlinkedlist.png)
```
Input: head = [3,2,0,-4], pos = 1
Output: tail connects to node index 1
Explanation: There is a cycle in the linked list, where tail connects to the second node.
```

**`Code:`**

**`Double pointers`**
```javascript
/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var detectCycle = function(head) {
  let slow = head;
  let fast = head;
  // Meet inside the cycle
  while(fast && fast.next) {
    fast = fast.next.next;
    slow = slow.next;
    if (slow === fast) break;
  }
  if (!fast || !fast.next) return null;
  // Reset fast to the head
  fast = head;
  // They will meet at the intersection.
  while (fast !== slow) {
    slow = slow.next;
    fast = fast.next;
  }
  return slow;
};
```

**`Set`**
```javascript
/**
 * Definition for singly-linked list.
 * function ListNode(val) {
 *     this.val = val;
 *     this.next = null;
 * }
 */

/**
 * @param {ListNode} head
 * @return {ListNode}
 */
var detectCycle = function(head) {
  const set = new Set();
  let p = head;
  while (p) {
    if (set.has(p)) {
      return p;
    }
    set.add(p);
    p = p.next;
  }
  return null;
};
```