---
title: Leetcode 430 - Flatten a Multilevel Doubly Linked List
date: 2021-12-19 21:07:54
tags:
- dfs
- linked list
---
**`Note:`**
- Recursion is def easier than `iteration`.
- Push every node on the same level into an `array[]`.
- Concat children array with parent array.
- After returning an array containing all the nodes.
- Append them together, and set `child` to null.

**`Question:`**

You are given a doubly linked list, which contains nodes that have a next pointer, a previous pointer, and an additional child pointer. This child pointer may or may not point to a separate doubly linked list, also containing these special nodes. These child lists may have one or more children of their own, and so on, to produce a multilevel data structure as shown in the example below.

Given the `head` of the first level of the list, flatten the list so that all the nodes appear in a single-level, doubly linked list. Let `curr` be a node with a child list. The nodes in the child list should appear after curr and before curr.next in the flattened list.

Return the `head` of the flattened list. The nodes in the list must have `all` of their `child` pointers set to `null`.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2021/11/09/flatten11.jpg)
```
Input: head = [1,2,3,4,5,6,null,null,null,7,8,9,10,null,null,11,12]
Output: [1,2,3,7,8,11,12,9,10,4,5,6]
Explanation: The multilevel linked list in the input is shown.
After flattening the multilevel linked list it becomes:
```
![img](https://assets.leetcode.com/uploads/2021/11/09/flatten12.jpg)

**`Code:`**
```javascript
/**
 * // Definition for a Node.
 * function Node(val,prev,next,child) {
 *    this.val = val;
 *    this.prev = prev;
 *    this.next = next;
 *    this.child = child;
 * };
 */

/**
 * @param {Node} head
 * @return {Node}
 */
var flatten = function(head) {
  const flattened = dfs(head);
  for (let i = 0; i < flattened.length; i++) {
    flattened[i].next = flattened[i + 1] ? flattened[i + 1] : null;
    flattened[i].prev = flattened[i - 1] ? flattened[i - 1] : null;
    flattened[i].child = null;
  }
  return flattened[0];

  function dfs(node) {
    let nodes = [];
    let p = node;
    while (p) {
      if (p.child === null) {
        nodes.push(p);
        p = p.next;
      } else {
        nodes.push(p);
        const children = dfs(p.child);
        nodes = nodes.concat(children);
        p = p.next;
      }
    }
    return nodes;
  }
};
```