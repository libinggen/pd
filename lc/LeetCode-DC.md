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

108. Convert Sorted Array to Binary Search Tree 有序数组转二叉搜索树

```
integer array nums where elements are sorted in ascending order, convert to height-balanced binary search tree.
height-balanced binary tree is binary tree in which depth of two subtrees of every node never differs by more than one.

Input: nums = [-10,-3,0,5,9]
Output: [0,-3,9,-10,null,5]
Explanation: [0,-10,5,null,-3,null,9] is also accepted
```
```
整数数组，元素按升序排列，转为高度平衡二叉搜索树。高度平衡二叉树，每个节点左右子树高度差绝对值不超过1。
```

```DC```
```
左大右返空，中左根，左递左，右递右，返根
```
```
public TreeNode sortedArrayToBST(int[] nums) {
    return dc(nums, 0, nums.length - 1);
}

public TreeNode dc(int[] nums, int left, int right) {
    if (left > right) {return null;}

    int mid = (left + right) / 2;

    TreeNode root = new TreeNode(nums[mid]);
    root.left = dc(nums, left, mid - 1);
    root.right = dc(nums, mid + 1, right);
    return root;
}
```

169. Majority Element 多数元素

```
array nums of size n, return majority element.
majority element is element that appears more than ⌊n / 2⌋ times. assume that majority element always exists in array.

Input: nums = [2,2,1,1,1,2,2]
Output: 2
```
```
大小为n数组，找多数元素。多数元素，出现次数大于n/2元素。
```

```DC```
```
低高同返低数，取中、递分左右，左右同返左；
左计数左，右计数右，遍组，同数加1，返计；
左计大返左，返右；
```
```
public int majorityElement(int[] nums) {
    return dc(nums, 0, nums.length - 1);
}

private int dc(int[] nums, int lo, int hi) {
    if (lo == hi) {return nums[lo];}

    int mid = (hi - lo) / 2 + lo;
    int left = dc(nums, lo, mid);
    int right = dc(nums, mid + 1, hi);

    if (left == right) {return left;}
    int leftCount = cr(nums, left, lo, hi);
    int rightCount = cr(nums, right, lo, hi);

    if(leftCount > rightCount) return left;
    return right;
}

private int cr(int[] nums, int num, int lo, int hi) {
    int count = 0;
    for (int i = lo; i <= hi; i++) {
        if (nums[i] == num) {count++;}
    }
    return count;
}
```

```Sorting```
```
public int majorityElement(int[] nums) {
    Arrays.sort(nums);
    return nums[nums.length / 2];
}
```

190. Reverse Bits 颠倒二进制位

```
Reverse bits of 32 bits unsigned integer.
Java, there is no unsigned integer type. both input and output as signed integer type. integer's internal binary is same, whether it is signed or unsigned.
In Java, compiler represents signed integers using 2's complement notation. input represents signed integer -3 and output represents signed integer -1073741825.

Input: n = 00000010100101000001111010011100
Output:    964176192 (00111001011110000010100101000000)
Explanation: The input binary string 00000010100101000001111010011100 represents the unsigned integer 43261596, so return 964176192 which its binary representation is 00111001011110000010100101000000.
```
```
颠倒32位无符号整数二进制位。Java没有无符号整数类型，输入输出为有符号整数类型，有无符号整数内部二进制形式相同。Java编译器二进制补码表示有符号整数
```
```
掩码1-5555，2-3333，4-0f0f,8-00ff；
右移并掩或并掩左移，返右移或左移；
```
```
private static final int M1 = 0x55555555; // 01010101010101010101010101010101
private static final int M2 = 0x33333333; // 00110011001100110011001100110011
private static final int M4 = 0x0f0f0f0f; // 00001111000011110000111100001111
private static final int M8 = 0x00ff00ff; // 00000000111111110000000011111111

public int reverseBits(int n) {
    n = n >>> 1 & M1 | (n & M1) << 1;
    n = n >>> 2 & M2 | (n & M2) << 2;
    n = n >>> 4 & M4 | (n & M4) << 4;
    n = n >>> 8 & M8 | (n & M8) << 8;
    return n >>> 16 | n << 16;
}
```

```
遍n，倒序添加翻转结果，逻辑右移一位
```
```
public int reverseBits(int n) {
    int rev = 0;
    for (int i = 0; i < 32 && n != 0; ++i) {
        rev |= (n & 1) << (31 - i);
        n >>>= 1;
    }
    return rev;
}
```

## Medium


## Hard