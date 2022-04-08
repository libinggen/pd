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

## Medium


## Hard