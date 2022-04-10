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

1217. Minimum Cost to Move Chips to The Same Position 最小代价移动筹码到同一位置

```
n chips, where position of ith chip is position[i].
move all chips to same position. In one step, change position of ith chip from position[i] to:
position[i] + 2 or position[i] - 2 with cost = 0.
position[i] + 1 or position[i] - 1 with cost = 1.
Return minimum cost needed to move all chips to same position.

Input: position = [1,2,3]
Output: 1
Explanation: First step: Move the chip at position 3 to position 1 with cost = 0.
Second step: Move the chip at position 2 to position 1 with cost = 1.
Total cost is 1.
```
```
n筹码，第i筹码位置position[i]，position[i]+2 -2 cost 0，position[i]+1 -1 cost 1，移动所有筹码最小代价。
```

```Greedy```
```
遍位，计奇、计偶，奇偶取小
```
```
public int minCostToMoveChips(int[] position) {
    int oddCnt = 0, evenCnt = 0;
    for (int i = 0; i < position.length; i++) {
        if (position[i] % 2 != 0) {
            oddCnt++;
        } else {
            evenCnt++;
        }
    }
    return Math.min(oddCnt, evenCnt);
}
```

1710. Maximum Units on a Truck 卡车上的最大单元数

```
put some amount of boxes onto one truck. 2D array boxTypes, where boxTypes[i] = [numberOfBoxesi, numberOfUnitsPerBoxi]:
numberOfBoxesi is number of boxes of type i.
numberOfUnitsPerBoxi is number of units in each box of the type i.
an integer truckSize, which is maximum number of boxes that can be put on truck. choose any boxes to put on truck as long as number of boxes does not exceed truckSize.
Return maximum total number of units that can be put on truck.

Input: boxTypes = [[1,3],[2,2],[3,1]], truckSize = 4
Output: 8
Explanation: There are:
- 1 box of the first type that contains 3 units.
- 2 boxes of the second type that contain 2 units each.
- 3 boxes of the third type that contain 1 unit each.
You can take all the boxes of the first and second types, and one box of the third type.
The total number of units will be = (1 * 3) + (2 * 2) + (1 * 1) = 8.
```
```
箱子装车，二维数组，boxTypes[i]，[numberOfBoxesi, numberOfUnitsPerBoxi]，i类箱数、每箱单元数。整数车载箱子最大数量，返车载单元最大数。
```

```
单元排序，遍箱，单元数、箱数，标加一，车箱箱数取小，车箱减小，总加单元乘小，返总
```

```Greedy```
```
public int maximumUnits(int[][] boxTypes, int truckSize) {

    Arrays.sort(boxTypes, (a,b) -> b[1] - a[1]);

    int totalSize = 0;
    int index = 0;

    while(truckSize > 0 && index < boxTypes.length) {

        int boxSize = boxTypes[index][1];
        int boxCount = boxTypes[index][0];
        index++;
        int canFit = Math.min(boxCount, truckSize);
        truckSize -= canFit;

        totalSize = totalSize + (boxSize * canFit);
    }

    return totalSize;
}
```

## Medium


## Hard