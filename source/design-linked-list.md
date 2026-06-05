---
title: Leetcode 707 - Design linked list
date: 2021-08-29 01:56:33
tags:
- leetcode
- linked list
- medium
---
**Note:**
- Need some ES5 inheritance knowledge

Design your implementation of the linked list. You can choose to use a singly or doubly linked list.
A node in a singly linked list should have two attributes: val and next. val is the value of the current node, and next is a pointer/reference to the next node.
If you want to use the doubly linked list, you will need one more attribute prev to indicate the previous node in the linked list. Assume all nodes in the linked list are 0-indexed.

Implement the MyLinkedList class:

- MyLinkedList() Initializes the MyLinkedList object.
- int get(int index) Get the value of the indexth node in the linked list. If the index is invalid, return -1.
- `void addAtHead(int val)` Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list.
- `void addAtTail(int val)` Append a node of value val as the last element of the linked list.
- `void addAtIndex(int index, int val)` Add a node of value val before the indexth node in the linked list. If index equals the length of the linked list, the node will be appended to the end of the linked list. If index is greater than the length, the node will not be inserted.
- `void deleteAtIndex(int index)` Delete the indexth node in the linked list, if the index is valid

**Example 1:**
```
Input
["MyLinkedList", "addAtHead", "addAtTail", "addAtIndex", "get", "deleteAtIndex", "get"]
[[], [1], [3], [1, 2], [1], [1], [1]]
Output
[null, null, null, null, 2, null, 3]

Explanation
MyLinkedList myLinkedList = new MyLinkedList();
myLinkedList.addAtHead(1);
myLinkedList.addAtTail(3);
myLinkedList.addAtIndex(1, 2);    // linked list becomes 1->2->3
myLinkedList.get(1);              // return 2
myLinkedList.deleteAtIndex(1);    // now the linked list is 1->3
myLinkedList.get(1);              // return 3
```

```javascript
function LinkNode(val, next) {
  this.val = val;
  this.next = next;
}

/**
 * Initialize your data structure here.
 */
var MyLinkedList = function() {
  this.size = 0;
  this.head = null;
  this.tail = null;
};

/**
 * Get the nth node
 * @param {number} index
 * @return {LinkNode}
 */
MyLinkedList.prototype.getNode = function(index) {
  if (index < 0 || index > this.size - 1) return null;
  let i = 0;
  let pointer = this.head;
  while (i++ < index) {
    pointer = pointer.next;
  }
  return pointer;
}

/**
 * Get the value of the index-th node in the linked list. If the index is invalid, return -1. 
 * @param {number} index
 * @return {number}
 */
MyLinkedList.prototype.get = function(index) {
  if (index < 0 || index > this.size - 1) {
    return -1;
  }
  let node = this.getNode(index);
  return node.val;
};

/**
 * Add a node of value val before the first element of the linked list. After the insertion, the new node will be the first node of the linked list. 
 * @param {number} val
 * @return {void}
 */
MyLinkedList.prototype.addAtHead = function(val) {
  let newHead = new LinkNode(val, this.head);
  this.head = newHead;
  this.size++;
  if (!this.tail) {
    this.tail = newHead;
  }
};

/**
 * Append a node of value val to the last element of the linked list. 
 * @param {number} val
 * @return {void}
 */
MyLinkedList.prototype.addAtTail = function(val) {
  let newTail = new LinkNode(val, null);
  if (this.size === 0) {
    this.tail = newTail;
    this.head = newTail;
    this.size++;
    return;
  }
  let oldTail = this.getNode(this.size - 1);
  oldTail.next = newTail;
  this.tail = newTail;
  this.size++;
};

/**
 * Add a node of value val before the index-th node in the linked list. If index equals to the length of linked list, the node will be appended to the end of linked list. If index is greater than the length, the node will not be inserted. 
 * @param {number} index 
 * @param {number} val
 * @return {void}
 */
MyLinkedList.prototype.addAtIndex = function(index, val) {
  if (index > this.size) return;
  if (index <= 0) {
    this.addAtHead(val);
    return;
  }
  if (index === this.size) {
    this.addAtTail(val);
    return;
  }
  let node = new LinkNode(val,null);
  let target = this.getNode(index-1);
  node.next = target.next;
  target.next = node;
  this.size++;
};

/**
 * Delete the index-th node in the linked list, if the index is valid. 
 * @param {number} index
 * @return {void}
 */
MyLinkedList.prototype.deleteAtIndex = function(index) {
  if (index < 0 || index > this.size - 1) return;
  if (index === 0) {
    this.head = this.head.next;
    this.size--;
    return;
  }
  let target = this.getNode(index-1);
  target.next = target.next.next;
  this.size--;
};

/** 
 * Your MyLinkedList object will be instantiated and called as such:
 * var obj = new MyLinkedList()
 * var param_1 = obj.get(index)
 * obj.addAtHead(val)
 * obj.addAtTail(val)
 * obj.addAtIndex(index,val)
 * obj.deleteAtIndex(index)
 */
```