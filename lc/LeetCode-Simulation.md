# Simulation

## Easy

412. Fizz Buzz 烟花

```
integer n, return string array answer (1-indexed) where:
answer[i] == "FizzBuzz" if i is divisible by 3 and 5.
answer[i] == "Fizz" if i is divisible by 3.
answer[i] == "Buzz" if i is divisible by 5.
answer[i] == i (as a string) if none of the above conditions are true.

Input: n = 15
Output: ["1","2","Fizz","4","Buzz","Fizz","7","8","Fizz","Buzz","11","Fizz","13","14","FizzBuzz"]
```
```
整数，从1到n各整数FizzBuzz表示，字符串数组，下标1开始，3、5倍数FizzBuzz，3倍数Fizz，5倍数Buzz，其他i。
```

```Simulation```
```
遍数，35余0 FB，3余0 F，5余0 B，其他i
```
```
public List<String> fizzBuzz(int n) {
    List<String> list = new ArrayList<>();
    for (int i = 1; i <= n; i++) {
        if (((i % 3) == 0) && ((i % 5) == 0)) list.add("FizzBuzz");
        else if (((i % 3) == 0)) list.add("Fizz");
        else if (((i % 5) == 0)) list.add("Buzz");
        else list.add(Integer.toString(i));
    }
    return list;
}
```

415. Add Strings 字符串相加

```
two non-negative integers, num1 and num2 represented as string, return sum of num1 and num2 as a string.
solve problem without using any built-in library for handling large integers (such as BigInteger). not convert inputs to integers directly.

Input: num1 = "11", num2 = "123"
Output: "134"
```
```
两字符串非负整数，计算和，返回字符串。不能用大整数库，不能转整数。
```

```Simulation```
```
遍串进，减字0得数，负标补0，加进，得进，得尾，标12减，返序字符
```
```
public String addStrings(String num1, String num2) {
    int i = num1.length() - 1, j = num2.length() - 1, add = 0;
    StringBuffer ans = new StringBuffer();
    while (i >= 0 || j >= 0 || add != 0) {
        int x = i >= 0 ? num1.charAt(i) - '0' : 0;
        int y = j >= 0 ? num2.charAt(j) - '0' : 0;
        int result = x + y + add;
        ans.append(result % 10);
        add = result / 10;
        i--;
        j--;
    }
    ans.reverse();
    return ans.toString();
}
```

## Medium


## Hard