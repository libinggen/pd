# Divide and Conquer

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

```DC```
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

## Medium


## Hard