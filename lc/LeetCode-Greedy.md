# Greedy

## Easy

605. Can Place Flowers 能否种花

```
flowerbed in which some of plots are planted, and some are not. flowers cannot be planted in adjacent plots.
integer array flowerbed containing 0's and 1's, where 0 means empty and 1 means not empty, and integer n, return if n new flowers can be planted in flowerbed without violating no-adjacent-flowers rule.

Input: flowerbed = [1,0,0,0,1], n = 1
Output: true
```
```
花坛，花不能种在相邻地。整数数组，0没种花、1种花，n朵花，能种返真，不能返假。
[0, i]范围内最多可种i/2朵花。
[i, j]范围内最多可种(j-i-2)/2朵花。
[j, length]范围内最多可种(length-j-1)/2朵花。
```

```Greedy```
```
未种，遍坛，有种，计加前未种，计加前已种，，计大等要返真，前种标；
无花计加可种，计加剩种，计大等要；
```
```
public boolean canPlaceFlowers(int[] flowerbed, int n) {
    int count = 0;
    int m = flowerbed.length;
    int prev = -1;
    for (int i = 0; i < m; i++) {
        if (flowerbed[i] == 1) {
            if (prev < 0) {count += i / 2;}
            else {count += (i - prev - 2) / 2;}
            if (count >= n) {return true;}
            prev = i;
        }
    }
    if (prev < 0) {count += (m + 1) / 2;}
    else {count += (m - prev - 1) / 2;}
    return count >= n;
}
```

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