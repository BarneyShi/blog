---
title: 🌴 Binary Tree
date: 2021-09-14 19:12:11
tags:
- binary tree
---
## How many kinds of binary tree are there?
- Perfect binary tree
  - Every node has either `0` or `2` child nodes.
![img](https://img-blog.csdnimg.cn/20200806185805576.png)
- Complete binary tree
  - every level, except possibly the last, is completely `filled`, and all nodes are as `far left` as possible.
![img](https://i.ibb.co/HCc5xxX/Screen-Shot-2021-09-14-at-7-15-51-PM.png)
- Binary search tree
  - `val(node.left) < val(node.right)`
  ![img](https://img-blog.csdnimg.cn/20200806190304693.png)
- Balanced binary tree
  - The difference of height between `left substreet` and `right subtree` differ by `no more than 1`.
  ![img](https://img-blog.csdnimg.cn/20200806190511967.png)

## Different traversal ways
![img](https://i.imgur.com/Lutiahp.png)
- `Pre order`: 5, 4, 1, 2, 6, 7, 8
- `In order`: 1, 4, 2, 5, 7, 6, 8
- `Post order`: 1, 2, 4, 7, 8, 6, 5

## How to define your own tree node?
```javascript
unction TreeNode(val, left, right) {
    this.val = (val===undefined ? 0 : val)
    this.left = (left===undefined ? null : left)
    this.right = (right===undefined ? null : right)
}
```

## Traverse in iterative ways
![img](https://i.imgur.com/ueWnuvn.png)
- `Pre-order`:
  - Because we are using a `stack`, to ensure that we push `left` node first into the `result` by popping it out of `stack`. We have to push `right` node first.
  ```javascript
  var preorderTraversal = function(root, result = []) {
    if (!root) return result;
    let stack = [root];
    while (stack.length > 0) {
      let cur = stack.pop();
      result.push(cur.val);
      cur.right && stack.push(cur.right);
      cur.left && stack.push(cur.left);
    }
    return result;
  }
  ```

- `In-order`
![img](https://i.imgur.com/sbTuu7e.png)
  - Think about this particular tree.
  - The result we want is `5, 6, 7`
  - 

```javascript
function inorderTraversal(root, result = []) {
  let stack = [];
  let cur = root;
  while (stack.length || cur) {
    if (cur) {
      // Let go deeper in left subtree 
      stack.push(cur);
      cur = cur.left;
    } else {
      // Three is no more left subtree. We need to record `cur.val` then turn to the right subtree.
      let node = stack.pop();
      result.push(node.val);
      cur = node.right;
    }
  }
  return result;
}
```

- `Post-order`
  - The order of `pre-order` is `Root, Left, Right`, so if we just tweak the order of `left, right` a bit, then `reverse` the result, it would be `Left, Right, Root`!!

```javascript
var postorderTraversal = function(root, result = []) {
  if (!root) return result;
  let stack = [root];
  let cur = null;
  while (stack.length) {
    cur = stack.pop();
    result.push(cur.val);
    // Opposite order of `pre-order`.
    cur.left && stack.push(cur.left);
    cur.right && stack.push(cur.right);
  }
  return result.reverse();
};
```