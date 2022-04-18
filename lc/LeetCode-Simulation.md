# Simulation

## Easy

67. Add Binary 二进制求和

```
two binary strings a and b, return sum as binary string.

Input: a = "11", b = "1"
Output: "100"
```
```
两个二进制字符串，返回和，二进制表示。输入非空字符串只含数字1和0。carry进位。
```

```Simulation```
```
遍串，ab进加减字0，标减，加余，得进，有进加1，反序字符
```
```
public String addBinary(String a, String b) {
    StringBuilder ans = new StringBuilder();
    int i = a.length() - 1, j = b.length() - 1, carry = 0;
    while (i >= 0 || j >= 0) {
        if (i >= 0) {carry += a.charAt(i) - '0';i--;}
        if (j >= 0) {carry += b.charAt(j) - '0';j--;}
        ans.append(carry % 2);
        carry /= 2;
    }
    if (carry > 0) {ans.append("1");}
    return ans.reverse().toString();
}
```

258. Add Digits 各位相加

```
integer num, repeatedly add all its digits until result has only one digit, and return it.

Input: num = 38
Output: 2
Explanation: The process is
38 --> 3 + 8 --> 11
11 --> 1 + 1 --> 2 
Since 2 has only one digit, return it.
```
```
非负整数，反复将各位数字相加，直到一位数。
```

```Simulation```
```
遍多位，遍位，加位总，下位，数总，返数
```
```
public int addDigits(int num) {
    while (num >= 10) {
        int sum = 0;
        while (num > 0) {
            sum += num % 10;
            num /= 10;
        }
        num = sum;
    }
    return num;
}
```
```
遍多位，遍位，加位总，数总，返数
```
```
public int addDigits(int num) {
    while (num != 0 && num > 9) {
        int sum = 0;
        for (char numChar : String.valueOf(num).toCharArray()) {
            sum += Character.getNumericValue(numChar);
        }
        num = sum;
    }
    return num;
}
```
```
数减1取余9加1
```
```
public int addDigits(int num) {
    return (num - 1) % 9 + 1;
}
```
```
数减9乘数减1除9
```
```
public int addDigits(int num) {
    return num - 9 * ((num - 1) / 9);
}
```

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

844. Backspace String Compare 比较含退格的字符串

```
two strings s and t, return true if equal when both are typed into empty text editors. '#' means a backspace character.
Note that after backspacing empty text, text will continue empty.

Input: s = "ab#c", t = "ad#c"
Output: true
Explanation: Both s and t become "ac".
```
```
两个字符串，经退格后相等。空文本，输退格符，文本空。
```

```Simulation```
```
整串等，遍串，非退加字，退减一字，返串
```
```
public boolean backspaceCompare(String S, String T) {
    return build(S).equals(build(T));
}

public String build(String str) {
    StringBuffer ret = new StringBuffer();
    int length = str.length();
    for (int i = 0; i < length; ++i) {
        char ch = str.charAt(i);
        if (ch != '#') {ret.append(ch);}
        else if (ret.length() > 0) {ret.deleteCharAt(ret.length() - 1);}
    }
    return ret.toString();
}
```

1275. Find Winner on a Tic Tac Toe Game 井字棋胜者

```
Tic-tac-toe is played by two players A and B on 3 x 3 grid. rules of Tic-Tac-Toe are:
Players take turns placing characters into empty squares ' '.
first player A always places 'X' characters, while second player B always places 'O' characters.
'X' and 'O' characters are always placed into empty squares, never on filled ones.
game ends when there are three of the same (non-empty) character filling any row, column, or diagonal.
game also ends if all squares are non-empty.
No more moves can be played if the game is over.

2D integer array moves where moves[i] = [rowi, coli] indicates that ith move will be played on grid[rowi][coli]. return winner of game if it exists (A or B). In case the game ends in draw return "Draw". If there are still movements to play return "Pending".
assume that moves is valid (i.e., it follows the rules of Tic-Tac-Toe), grid is initially empty, and A will play first.

Input: moves = [[0,0],[2,0],[1,1],[2,1],[2,2]]
Output: "A"
Explanation: A wins, they always play first.
```
```
AB在3x3网格玩井字棋。规则，轮流放棋在空格，A X、B O，只能放空格，3个相同，非空，排直线行列对角线或放满，游戏结束，无法再移棋。移动数组，元素为大小2数组，对应行列，先A后B记录棋子位置。返回获胜者或平局，未结束返待定。移动有效，网络初空，A先走。Draw 平局，Pnding 待定。
```

```Simulation```
```
遍移，行列斜反加玩，行列斜反3返胜，正负1，格尽平局否局中
```
```
public String tictactoe(int[][] moves) {
    int n = 3, player = 1;
    int[] rows = new int[n];
    int[] cols = new int[n];
    int diag = 0, antiDiag = 0;
    for (int[] move : moves) {
        int row = move[0];
        int col = move[1];
        rows[row] += player;
        cols[col] += player;
        if (row == col) {diag += player;}
        if (row + col == n - 1) {antiDiag += player;}
        if (Math.abs(rows[row]) == n || Math.abs(cols[col]) == n || Math.abs(diag) == n
                || Math.abs(antiDiag) == n) {return player == 1 ? "A" : "B";}
        player *= -1;
    }
    return moves.length == n * n ? "Draw" : "Pending";
}
```

1389. Create Target Array in the Given Order 按既定顺序创建目标数组

```
two arrays of integers nums and index. task is to create target array under the following rules:
Initially target array is empty.
From left to right read nums[i] and index[i], insert at index index[i] the value nums[i] in target array.
Repeat previous step until there are no elements to read in nums and index.
Return target array.
It is guaranteed that insertion operations will be valid.

Input: nums = [0,1,2,3,4], index = [0,1,2,2,1]
Output: [0,4,1,3,2]
Explanation:
nums       index     target
0            0        [0]
1            1        [0,1]
2            2        [0,1,2]
3            2        [0,1,3,2]
4            1        [0,4,1,3,2]
```
```
两整数数组nums、index，创建目标数组。目标数组最初为空，从左到右读nums[i]、index[i]，目标数组下标index[i]插入值nums[i]，重复读完元素。返回数组。数字插入位置存在。
```

```Simulation```
```
遍数，有数后移一位，数标加，标数，返组
```
```
public int[] createTargetArray(int[] nums, int[] index) {
    int ans[] = new int[nums.length];
    int count[] = new int[nums.length];

    for (int i = 0; i < nums.length; i++) {
        if (count[index[i]] == 1 || ans[index[i]] != 0) {
            for (int j = nums.length - 1; j > index[i]; j--) {ans[j] = ans[j - 1];}
        }
        count[index[i]]++;
        ans[index[i]] = nums[i];
    }
    
    return ans;
}
```
```
遍数，加标数，遍数，取标数，返组
```
```
public int[] createTargetArray(int[] nums, int[] index) {
    List<Integer> list = new ArrayList<Integer>();
    for (int i = 0; i < nums.length; ++i) {
        list.add(index[i], nums[i]);
    }
    int[] ans = new int[nums.length];
    for (int i = 0; i < nums.length; ++i) {
        ans[i] = list.get(i);
    }
    return ans;
}
```

1560. Most Visited Sector in a Circular Track 圆形赛道经过次数最多的扇区

```
integer n and integer array rounds. circular track which consists of n sectors labeled from 1 to n. marathon will be held on this track, marathon consists of m rounds. ith round starts at sector rounds[i - 1] and ends at sector rounds[i]. round 1 starts at sector rounds[0] and ends at sector rounds[1]
Return array of most visited sectors sorted in ascending order.
Notice that circulate track in ascending order of sector numbers in counter-clockwise direction.

Input: n = 4, rounds = [1,3,1,2]
Output: [1,2]
Explanation: The marathon starts at sector 1. The order of the visited sectors is as follows:
1 --> 2 --> 3 (end of round 1) --> 4 --> 1 (end of round 2) --> 2 (end of round 3 and the marathon)
We can see that both sectors 1 and 2 are visited twice and they are the most visited sectors. Sectors 3 and 4 are visited only once.
```
```
整数n，整数数组rounds。圆形赛道n个扇区，从1到n。比赛m个阶段，第i阶段从rounds[i-1]到rounds[i]扇区结束。第1阶段从rounds[0]到rounds[1]。数组形式返回经过次数最多的几个扇区，按扇区编号升序排列。赛道按扇区编号升序逆时针成圆。
```

```Simulation```
```
遍轮，始轮始大终0否轮终，终轮始大终0否轮终，遍轮始加1终、遍始加1轮终、大大大访加1，遍扇，大加i，返组
```
```
public List<Integer> mostVisited(int n, int[] rounds) {
    List<Integer> ans = new ArrayList<>();
    int max = 1;
    int[] visits = new int[n + 1];
    visits[rounds[0]] = 1;

    for (int i = 1; i < rounds.length; i++) {
        int start = rounds[i - 1] > rounds[i] ? 0 : rounds[i],
                end = rounds[i - 1] > rounds[i] ? n : rounds[i];
        for (int j = rounds[i - 1] + 1; j <= end; j++){max = Math.max(max, ++visits[j]);}
        for (int j = start + 1; j <= rounds[i]; j++){max = Math.max(max, ++visits[j]);}
    }

    for (int i = 1; i <= n; i++) {
        if (visits[i] == max){ans.add(i);}
    }

    return ans;
}
```
```
始大等终、遍始终加i，始小终、遍1终加i、遍始扇加i，返组
```
```
public List<Integer> mostVisited(int n, int[] rounds) {
    List<Integer> ans = new ArrayList<>();
    int start = rounds[0], end = rounds[rounds.length - 1];

    if (start <= end) {
        for (int i = start; i <= end; i++) {ans.add(i);}
    } else {
        for (int i = 1; i <= end; i++) {ans.add(i);}
        for (int i = start; i <= n; i++) {ans.add(i);}
    }

    return ans;
}
```

1920. Build Array from Permutation 基于排列构建数组

```
zero-based permutation nums (0-indexed), build array ans of same length where ans[i] = nums[nums[i]] for each 0 <= i < nums.length and return it.
zero-based permutation nums is array of distinct integers from 0 to nums.length - 1 (inclusive).

Input: nums = [0,2,1,5,3,4]
Output: [0,1,2,4,5,3]
Explanation: The array ans is built as follows: 
ans = [nums[nums[0]], nums[nums[1]], nums[nums[2]], nums[nums[3]], nums[nums[4]], nums[nums[5]]]
    = [nums[0], nums[2], nums[1], nums[5], nums[3], nums[4]]
    = [0,1,2,4,5,3]
```
```
0始标排列，建同长数组，每个i满足ans[i]=nums[nums[i]]。含0和nems.length-1。
```

```Simulation```
```
遍排，组标排排标，返组
```
```
public int[] buildArray(int[] nums) {
    int[] ans = new int[nums.length];
    for (int i = 0; i < nums.length; i++) {
        ans[i] = nums[nums[i]];
    }
    return ans;
}
```

## Medium


## Hard