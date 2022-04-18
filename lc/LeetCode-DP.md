# Dynamic Programming

## Easy

53. Maximum Subarray 最大子数组和

```
integer array nums, find contiguous subarray (containing at least one number) which has largest sum and return its sum.
subarray is contiguous part of array.

Input: nums = [-2,1,-3,4,-1,2,1,-5,4]
Output: 6
Explanation: [4,-1,2,1] has the largest sum = 6.
```

```
整数数组，找最大和连续子数组，至少一个元素，返回最大和。子数组连续。
```

```DP```
```
遍数，当数，现大当现，大大前现，返大
```
```
public int maxSubArray(int[] nums) {
    int c = nums[0];
    int m = nums[0];
    for (int i = 1; i < nums.length; i++) {
        int n = nums[i];
        c = Math.max(n, n + c);
        m = Math.max(m, c);
    }
    return m;
}
```

70. Climbing Stairs 爬楼梯

```
climbing staircase. takes n steps to reach top.
Each time either climb 1 or 2 steps. In how many distinct ways can climb to top?

Input: n = 3
Output: 3
Explanation: There are three ways to climb to the top.
1. 1 step + 1 step + 1 step
2. 1 step + 2 steps
3. 2 steps + 1 step
```
```
爬楼梯，n阶到楼顶，每次1或2阶，到楼顶有多少不同方法。
```

```DP```
```
0阶1案，1阶1案，遍阶，阶案前案加前前案，返n阶案
```
```
public int climbStairs(int n) {
    int[] dp = new int[n + 1];
    dp[0] = 1;
    dp[1] = 1;
    for (int i = 2; i <= n; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    return dp[n];
}
```

118. Pascal's Triangle 杨辉三角

```
integer numRows, return first numRows of Pascal's triangle.
In Pascal's triangle, each number is sum of two numbers directly above it.

Input: numRows = 5
Output: [[1],[1,1],[1,2,1],[1,3,3,1],[1,4,6,4,1]]
```
```
非负整数numRows，生成杨辉三角numRows行。杨辉三角，每个数是左上方和右上方的数和。
```

```DP```
```
初1，遍行，行加1，行加上左加上右，行加1，加行，返答
```
```
public List<List<Integer>> generate(int numRows) {
    List<List<Integer>> ans = new ArrayList<>();
    if (numRows == 0)return ans;
    ans.add(new ArrayList<>(Arrays.asList(1)));

    for (int i = 1; i < numRows; i++) {
        List<Integer> row = new ArrayList<>();
        row.add(1);
        for (int j = 1; j < i; j++) {
            int left = ans.get(i - 1).get(j - 1);
            int right = ans.get(i - 1).get(j);
            row.add(left + right);
        }
        row.add(1);
        ans.add(row);
    }
    return ans;
}
```

121. Best Time to Buy and Sell Stock 买卖股票最佳时机

```
array prices where prices[i] is price of stock on ith day.
maximize profit by choosing day to buy stock and choosing different day in future to sell stock.
Return maximum profit achieve from transaction. If cannot achieve any profit, return 0.

Input: prices = [7,1,5,3,6,4]
Output: 5
Explanation: Buy on day 2 (price = 1) and sell on day 5 (price = 6), profit = 6-1 = 5.
Note that buying on day 2 and selling on day 1 is not allowed because you must buy before you sell.
```
```
价格数组，prices[i]第i天股票价格，某天买，另某天卖，返最大利润或0
```
```DP```
```
遍价，更小价，更大利，返利
```
```
public int maxProfit(int[] prices) {
    int minPrice = Integer.MAX_VALUE;
    int maxProfit = 0;
    for (int i = 0; i < prices.length; i++) {
        if (prices[i] < minPrice) {minPrice = prices[i];}
        if (prices[i] - minPrice > maxProfit) {maxProfit = prices[i] - minPrice;}
    }
    return maxProfit;
}
```

509. Fibonacci Number 斐波那契数

```
Fibonacci numbers, commonly denoted F(n) form sequence, called the Fibonacci sequence, such that each number is sum of two preceding ones, starting from 0 and 1. That is,
F(0) = 0, F(1) = 1
F(n) = F(n - 1) + F(n - 2), for n > 1.
n, calculate F(n).

Input: n = 3
Output: 2
Explanation: F(3) = F(2) + F(1) = 1 + 1 = 2.
```
```
斐波那契数序列，F(n)表示，从0和1开始，后面每项数字是前两项数和。
```
```
数0、数1，遍N，数前数加前前数，返N数
```
```
public int fib(int N) {
    if (N <= 1) {return N;} 

    int[] dp = new int[N + 1];
    dp[1] = 1;
    for (int i = 2; i <= N; i++) {
        dp[i] = dp[i - 1] + dp[i - 2];
    }
    
    return dp[N];
}
```

## Medium


## Hard