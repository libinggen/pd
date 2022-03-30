# LeetCode

https://leetcode.com

## Java

```
整形类型，最大值Integer.MAX_VALUE 2147483647，最小值Integer.MIN_VALUE -2147483648。
越界
Integer.MAX_VALUE + 1 = Integer.MIN_VALUE
Math.abs(Integer.MIN_VALUE) = Integer.MIN_VALUE
```

## Easy

1. Two Sum
```
public int[] twoSum(int[] nums, int target) {
    Map<Integer,Integer> map = new HashMap<>();
    for(int i=0;i<nums.length;i++) {
        if(map.containsKey(target-nums[i])){return new int[]{map.get(target-nums[i]),i};}
        map.put(nums[i],i);
    }
    return new int[0];
}
```

53. Maximum Subarray
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

345. Reverse Vowels of a String
```
public String reverseVowels(String s) {
    char carr[] = s.toCharArray();
    String vs = "aeiouAEIOU";
    int left = 0, right = s.length()-1;
    while(left<right){
        while(left<right && !vs.contains(carr[left]+""))left++;
        while(left<right && !vs.contains(carr[right]+""))right--;
        char temp = carr[left];
        carr[left] = carr[right];
        carr[right] = temp;
        left++;
        right--;
    }
    return new String(carr);
}
```

543. Diameter of Binary Tree 二叉树直径

```
二叉树，直径长度，两结点路径长度最大值，边数
```
```
root of binary tree, length of diameter of tree.
length of longest path two nodes in tree.
number of edges.

Input: root = [1,2,3,4,5]
Output: 3
Explanation: 3 is the length of the path [4,2,1,3] or [5,2,1,3].
```
```
边0，递节，返边；
节空边0，递左，递右，边大边左右，返大左右1
```
```
private int diameter;
public int diameterOfBinaryTree(TreeNode root) {
    diameter = 0;
    longestPath(root);
    return diameter;
}
private int longestPath(TreeNode node){
    if(node == null) return 0;
    int leftPath = longestPath(node.left);
    int rightPath = longestPath(node.right);

    diameter = Math.max(diameter, leftPath + rightPath);
    return Math.max(leftPath, rightPath) + 1;
}
```

938. Range Sum of BST

二叉搜索树根结点，范围结点和

root node of a binary search tree, sum of values of all nodes in the inclusive range
```
Input: root = [10,5,15,3,7,null,18], low = 7, high = 15
Output: 32
```

```BST 左<节<右```

深度优先 递左右 插底

```节空0，节高递左，节低递右，节递左右```

```
public int rangeSumBST(TreeNode root, int low, int high) {
    if(root == null){return 0;};
    if(root.val > high){return rangeSumBST(root.left,low,high);};
    if(root.val < low){return rangeSumBST(root.right,low,high);};
    return root.val + rangeSumBST(root.left,low,high) + rangeSumBST(root.right,low,high);
}
```

广度优先 加左右 横扫

```总0，建队，队加节，队非空，队头节，节空过，节高加左，节低加右，总加节，队加左右，返总```

```
public int rangeSumBST(TreeNode root, int low, int high) {
    int sum = 0;
    Queue<TreeNode> q = new LinkedList<TreeNode>();
    q.offer(root);
    while (!q.isEmpty()){
        TreeNode node = q.poll();
        if(node == null){continue;};
        if(node.val > high){q.offer(node.left);}else
        if(node.val < low){q.offer(node.right);}else
        {sum += node.val;q.offer(node.left);q.offer(node.right);}
    }
    return sum;
}
```
