# Greedy

## Easy

680. Valid Palindrome II 验证回文符串II

```
string s, return true if s can be palindrome after deleting at most one character from it.

Input: s = "abca"
Output: true
Explanation: You could delete the character 'c'.
```
```
非空字符串，最多删除一个字符，是否回文字符串。
```

```Greedy```
```
遍串，低高不等返验高减一或验低加一，低加、高减，返真；
遍串低加高减，低高不等返假，返真；
```
```
public boolean validPalindrome(String s) {
    int low = 0, high = s.length() - 1;
    while (low < high) {
        char clow = s.charAt(low), chigh = s.charAt(high);
        if (clow != chigh) {return validPalindrome(s, low, high - 1) || validPalindrome(s, low + 1, high);}
        ++low;
        --high;
    }
    return true;
}

public boolean validPalindrome(String s, int low, int high) {
    for (int i = low, j = high; i < j; ++i, --j) {
        char ci = s.charAt(i), cj = s.charAt(j);
        if (ci != cj) {return false;}
    }
    return true;
}
```

## Medium


## Hard