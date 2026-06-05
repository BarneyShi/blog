---
title: Leetcode 388 - Longest Absolute File Path
date: 2021-12-12 18:04:42
tags:
- stack
---
**`Note:`**
- As the folder structure goes deeper, `\t` is increased by `1` every time. So by the `number` of `\t` in curr path, we can know how deep it is.
- `\n` should be used to split the array.
- Use `prevDepth` to record last depth. 
- Next path must have more `\t` than the `top` of the `stack`.
- If the `top` of stack has `less \t`, pop it till finding a qualified top.
- While finding a new `max`, join path with '' and replace multiple `\t` with a single `\`.

**`Question:`**

Suppose we have a file system that stores both files and directories. An example of one system is represented in the following picture:

![img](https://assets.leetcode.com/uploads/2020/08/28/mdir.jpg)

Here, we have `dir` as the only directory in the root. `dir` contains two subdirectories, `subdir1` and `subdir2`. `subdir1` contains a file `file1.ext` and subdirectory `subsubdir1`. `subdir2` contains a subdirectory `subsubdir2`, which contains a file `file2.ext`.

In text form, it looks like this (with ⟶ representing the tab character):

```
dir
⟶ subdir1
⟶ ⟶ file1.ext
⟶ ⟶ subsubdir1
⟶ subdir2
⟶ ⟶ subsubdir2
⟶ ⟶ ⟶ file2.ext
```

If we were to write this representation in code, it will look like this: `"dir\n\tsubdir1\n\t\tfile1.ext\n\t\tsubsubdir1\n\tsubdir2\n\t\tsubsubdir2\n\t\t\tfile2.ext"`. Note that the `'\n'` and `'\t'` are the new-line and tab characters.

Every file and directory has a unique absolute path in the file system, which is the order of directories that must be opened to reach the file/directory itself, all concatenated by `'/'s`. Using the above example, the `absolute path` to `file2.ext` is `"dir/subdir2/subsubdir2/file2.ext"`. Each directory name consists of letters, digits, and/or spaces. Each file name is of the form `name.extension`, where `name` and `extension` consist of letters, digits, and/or spaces.

Given a string `input` representing the file system in the explained format, return the length of the longest absolute path to a file in the abstracted file system. If there is no file in the system, return `0`.

**`Example:`**

![img](https://assets.leetcode.com/uploads/2020/08/28/dir1.jpg)
```
Input: input = "dir\n\tsubdir1\n\tsubdir2\n\t\tfile.ext"
Output: 20
Explanation: We have only one file, and the absolute path is "dir/subdir2/file.ext" of length 20.
```

**`Code:`**
```javascript
/**
 * @param {string} input
 * @return {number}
 */
var lengthLongestPath = function(input) {
  input = input.split('\n');
  console.log(input)
  let prevDepth = -1;
  let stack = [];
  let max = 0;
  for (let i = 0; i < input.length; i++) {
    const curDepth = countLevel(input[i]);
    if (curDepth > prevDepth) {
      stack.push(input[i]);
    } else {
      while (stack.length > 0 && curDepth <= countLevel(stack[stack.length - 1])) {
        stack.pop();
      }
      stack.push(input[i]);
    }
    prevDepth = curDepth
    if (input[i].indexOf('.') !== -1) {
      const absPath = stack.join('').replace(/(\t)+/g, '\\');
      max = Math.max(max, absPath.length);
    }
  }
  return max;
  function countLevel(str) {
    const matched = str.match(/\t/g);
    return matched ? matched.length : 0;
  }
};
```