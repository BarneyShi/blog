---
title: Leetcode 71 - Simplify path
date: 2021-11-23 21:52:18
tags:
- stack
---
**`Note:`**
- When there is `..`, we need to go back to the upper level direction.
- It's like poping out the current dir and retrieve the last dir.
- Just like `stack[]`!
- Split the path with `/` then add dir path one by one.

**`Question:`**

Given a string `path`, which is an `absolute path` (starting with a slash `'/'`) to a file or directory in a Unix-style file system, convert it to the simplified `canonical path`.

In a Unix-style file system, a period `'.'` refers to the current directory, a double period `'..'` refers to the directory up a level, and any multiple consecutive slashes (i.e. `'//'`) are treated as a single slash `'/'`. For this problem, any other format of periods such as `'...'` are treated as file/directory names.

The `canonical path` should have the following format:

- The path starts with a single slash `'/'`.
- Any two directories are separated by a single slash `'/'`.
- The path does not end with a trailing `'/'`.
- The path only contains the directories on the path from the root directory to the target file or directory (i.e., no period `'.'` or double period `'..'`)

Return the simplified `canonical path`.

**`Example:`**
```
Input: path = "/a/./b/../../c/"
Output: "/c"
```

**`Code:`**
```javascript
/**
 * @param {string} path
 * @return {string}
 */
var simplifyPath = function(path) {
  path = path.split('/');
 let res = [];
  for (const dir of path) {
    if (dir === '.' || dir === '') continue;
    if (dir === '..') {
      res.pop();
      continue;
    }
    res.push(dir);
  }
  return '/' + res.join('/');
};
```