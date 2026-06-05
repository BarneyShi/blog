---
title: Leetcode 468 - Validate IP Address
date: 2021-12-31 21:36:09
tags:
---
**`Note:`**
- Not as hard as I thought.
- Know how to `regex` to quickly filter unqualified strings.

**`Question:`**

Given a string queryIP, return "IPv4" if IP is a valid IPv4 address, "IPv6" if IP is a valid IPv6 address or "Neither" if IP is not a correct IP of any type.

**A valid IPv4** address is an IP in the form `"x1.x2.x3.x4"` where 0 <= $x_i$ <= 255 and $x_i$ cannot contain leading zeros. For example, "192.168.1.1" and "192.168.1.0" are valid IPv4 addresses but "192.168.01.1", while "192.168.1.00" and "192.168@1.1" are invalid IPv4 addresses.

**A valid IPv6** address is an IP in the form `"x1:x2:x3:x4:x5:x6:x7:x8"` where:

- 1 <= $x_i$.length <= 4
- $x_i$ is a hexadecimal string which may contain digits, lower-case English letter ('`a`' to '`f`') and upper-case English letters ('`A`' to '`F`').
- Leading zeros are allowed in $x_i$.

For example, `"2001:0db8:85a3:0000:0000:8a2e:0370:7334"` and `"2001:db8:85a3:0:0:8A2E:0370:7334"` are valid IPv6 addresses, while "2001:0db8:85a3::8A2E:037j:7334"` and `"02001:0db8:85a3:0000:0000:8a2e:0370:7334"` are invalid IPv6 addresses.

**`Example:`**
```
Input: queryIP = "172.16.254.1"
Output: "IPv4"
Explanation: This is a valid IPv4 address, return "IPv4".
```

**`Code:`**
```javascript
/**
 * @param {string} queryIP
 * @return {string}
 */
 var validIPAddress = function(queryIP) {
  if (queryIP.includes('.') && queryIP.includes(':') || !queryIP.includes('.') && !queryIP.includes(':')) return 'Neither';
  if (queryIP.includes('.')) {
    if (isIPV4(queryIP.split('.'))) return 'IPv4';
  } else {
    if (isIPV6(queryIP.split(':'))) return 'IPv6';
  }
  return 'Neither';

  function isIPV4(ip) {
    return ip.length === 4 && ip.every(e => !isNaN(e) && (e.length > 1 && e.length <= 3 && e[0] !== '0' || e.length === 1) && e >= '0' && e <= '255' && e.match(/:|[a-zA-Z]/g) === null);
  }

  function isIPV6(ip) {
    return ip.length === 8 && ip.every(e => e.match(/[g-zG-Z]|\./g) === null && e.length > 0 && e.length <= 4);
  }
};
```