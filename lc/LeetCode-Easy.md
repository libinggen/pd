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

```DC```
```
左大右返最小值，取中，遍左、加总、大左大前加总，遍右、加总、大右大前加总，中加大左右，递左，递右，大大合大左右半
```
```
public int maxSubArray(int[] nums) {
    return findMaxSubArray(0, nums.length - 1, nums);
}

private int findMaxSubArray(int left, int right, int[] numsArray) {
    if (left > right) {return Integer.MIN_VALUE;}

    int mid = Math.floorDiv(left + right, 2);
    int curr = 0;
    int maxLeftSum = 0;
    int maxRightSum = 0;

    for (int i = mid - 1; i >= left; i--) {
        curr += numsArray[i];
        maxLeftSum = Math.max(maxLeftSum, curr);
    }
    curr = 0;
    for (int i = mid + 1; i <= right; i++) {
        curr += numsArray[i];
        maxRightSum = Math.max(maxRightSum, curr);
    }

    int maxCombinedSum = numsArray[mid] + maxLeftSum + maxRightSum;
    int leftHalf = findMaxSubArray(left, mid - 1, numsArray);
    int rightHalf = findMaxSubArray(mid + 1, right, numsArray);
    return Math.max(maxCombinedSum, Math.max(leftHalf, rightHalf));
}
```

```
public class Status {
    public int lSum, rSum, mSum, iSum;

    public Status(int lSum, int rSum, int mSum, int iSum) {
        this.lSum = lSum;
        this.rSum = rSum;
        this.mSum = mSum;
        this.iSum = iSum;
    }
}

public int maxSubArray(int[] nums) {
    return getInfo(nums, 0, nums.length - 1).mSum;
}

public Status getInfo(int[] a, int l, int r) {
    if (l == r) {
        return new Status(a[l], a[l], a[l], a[l]);
    }
    int m = (l + r) >> 1;
    Status lSub = getInfo(a, l, m);
    Status rSub = getInfo(a, m + 1, r);
    return pushUp(lSub, rSub);
}

public Status pushUp(Status l, Status r) {
    int iSum = l.iSum + r.iSum;
    int lSum = Math.max(l.lSum, l.iSum + r.lSum);
    int rSum = Math.max(r.rSum, r.iSum + l.rSum);
    int mSum = Math.max(Math.max(l.mSum, r.mSum), l.rSum + r.lSum);
    return new Status(lSum, rSum, mSum, iSum);
}
```

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
0数1案，1级1案，遍阶，阶案前案加前前案，返n阶案
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

94. Binary Tree Inorder Traversal 二叉树中序遍历

```
root of binary tree, return inorder traversal of nodes' values.

Input: root = [1,null,2,3]
Output: [1,3,2]
```
```
二叉树根节点，中序遍历。左节右。
```

```DFS```
```
递根；
节空返，递左，加节值，递右；
```
```
public List<Integer> inorderTraversal(TreeNode root) {
    List<Integer> res = new ArrayList<>();
    dfs(root, res);
    return res;
}

public void dfs(TreeNode node, List<Integer> res) {
    if (node == null) return;
    dfs(node.left, res);
    res.add(node.val);
    dfs(node.right, res);
}
```

100. Same Tree 相同树

```
roots of two binary trees p and q, they are the same or not.
structurally identical, and nodes have same value.

Input: p = [1,2], q = [1,null,2]
Output: false
```
```
两棵二叉树根节点，检验是否相同。结构相同，节点同值。
```

```DFS```
```
空且空真，空或空假，返递左且递右
```
```
public boolean isSameTree(TreeNode p, TreeNode q) {
    return dfs(p, q);
}

public boolean dfs(TreeNode p, TreeNode q) {
    if (p == null && q == null) {return true;}
    else if (p == null || q == null) {return false;}
    else if (p.val != q.val) {return false;}
    else {return dfs(p.left, q.left) && dfs(p.right, q.right);}
}
```

```BFS```
```
空且空真，空或空假，队加节；
队非空，队弹节，不同值假，左右不同空假，加左右；
空且空真
```
```
public boolean isSameTree(TreeNode p, TreeNode q) {
    if (p == null && q == null) {return true;}
    else if (p == null || q == null) {return false;}

    Queue<TreeNode> queP = new LinkedList<TreeNode>();
    Queue<TreeNode> queQ = new LinkedList<TreeNode>();
    queP.offer(p);
    queQ.offer(q);

    while (!queP.isEmpty() && !queQ.isEmpty()) {
        TreeNode nodeP = queP.poll();
        TreeNode nodeQ = queQ.poll();
        if (nodeP.val != nodeQ.val) {return false;}

        TreeNode leftP = nodeP.left, rightP = nodeP.right;
        TreeNode leftQ = nodeQ.left, rightQ = nodeQ.right;
        if (leftP == null ^ leftQ == null) {return false;}
        if (rightP == null ^ rightQ == null) {return false;}
        if (leftP != null) {queP.offer(leftP);}
        if (rightP != null) {queP.offer(rightP);}
        if (leftQ != null) {queQ.offer(leftQ);}
        if (rightQ != null) {queQ.offer(rightQ);}
    }
    return queP.isEmpty() && queQ.isEmpty();
}
```

101. Symmetric Tree 对称二叉树

```
root of binary tree, check mirror of itself (symmetric around center).

Input: root = [1,2,2,3,4,4,3]
Output: true
```
```
二叉树根节点，轴对称
```

```DFS```
```
递根根；
空且空真，空或空假，值等递左右
```
```
public boolean isSymmetric(TreeNode root) {
    return dfs(root, root);
}

public boolean dfs(TreeNode t1, TreeNode t2) {
    if (t1 == null && t2 == null) return true;
    if (t1 == null || t2 == null) return false;
    return (t1.val == t2.val)
        && dfs(t1.right, t2.left)
        && dfs(t1.left, t2.right);
}
```

```BFS```
```
队加左右，队非空；
队弹左右，空且空过，空或空、值不等假，队加左右、队加右左；
返真；
```
```
public boolean isSymmetric(TreeNode root) {
    return bfs(root, root);
}

public boolean bfs(TreeNode u, TreeNode v) {
    Queue<TreeNode> q = new LinkedList<TreeNode>();
    q.offer(u);
    q.offer(v);
    while (!q.isEmpty()) {
        u = q.poll();
        v = q.poll();
        if (u == null && v == null) {continue;}
        if ((u == null || v == null) || (u.val != v.val)) {return false;}

        q.offer(u.left);
        q.offer(v.right);

        q.offer(u.right);
        q.offer(v.left);
    }
    return true;
}
```


104. Maximum Depth of Binary Tree 二叉树最大深度

```
root of binary tree, return maximum depth.
binary tree's maximum depth is number of nodes along longest path from root node down to farthest leaf node.

Input: root = [3,9,20,null,null,15,7]
Output: 3
```
```
二叉树根节点，找最大深度。二叉树深度为根节点到最远叶子节点的最长路径节点数。叶子节点是没有子节点。
```
```DFS```
```
空返0，递左，递右，大左右加1
```
```
public int maxDepth(TreeNode root) {
    if (root == null) {return 0;} 
    else {
        int leftHeight = maxDepth(root.left);
        int rightHeight = maxDepth(root.right);
        return Math.max(leftHeight, rightHeight) + 1;
    }
}
```
```BFS```
```
空返0，队加根，深0，队非空；
队长大0，弹节，左右非空加队，队长减1；
深加1，返深；
```
```
public int maxDepth(TreeNode root) {
    if (root == null) {return 0;}
    Queue<TreeNode> queue = new LinkedList<TreeNode>();
    queue.offer(root);
    int ans = 0;
    while (!queue.isEmpty()) {
        int size = queue.size();
        while (size > 0) {
            TreeNode node = queue.poll();
            if (node.left != null) {queue.offer(node.left);}
            if (node.right != null) {queue.offer(node.right);}
            size--;
        }
        ans++;
    }
    return ans;
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

125. Valid Palindrome 验证回文串

```
phrase is palindrome if, after converting all uppercase letters into lowercase letters and removing all non-alphanumeric characters, it reads same forward and backward. Alphanumeric characters include letters and numbers.
string s, return true if it is palindrome, or false otherwise.

Input: s = "A man, a plan, a canal: Panama"
Output: true
Explanation: "amanaplanacanalpanama" is a palindrome.
```
```
字符串，验证回文串。字母和数字，忽略大小写。
```

```
遍串，字母数字加小，反串，返原反等
```
```
public boolean isPalindrome(String s) {
    StringBuffer sgood = new StringBuffer();
    int length = s.length();
    for (int i = 0; i < length; i++) {
        char ch = s.charAt(i);
        if (Character.isLetterOrDigit(ch)) {
            sgood.append(Character.toLowerCase(ch));
        }
    }
    StringBuffer sgood_rev = new StringBuffer(sgood).reverse();
    return sgood.toString().equals(sgood_rev.toString());
}
```

```Two Pointers```
```
遍串，字母数字加；
遍串，左右小不等返假，左加右减，返真；
```
```
public boolean isPalindrome(String s) {
    StringBuffer sgood = new StringBuffer();
    int length = s.length();
    for (int i = 0; i < length; i++) {
        char ch = s.charAt(i);
        if (Character.isLetterOrDigit(ch)) {
            sgood.append(Character.toLowerCase(ch));
        }
    }
    int n = sgood.length();
    int left = 0, right = n - 1;
    while (left < right) {
        if (Character.toLowerCase(sgood.charAt(left)) != Character.toLowerCase(sgood.charAt(right))) {
            return false;
        }
        ++left;
        --right;
    }
    return true;
}
```

```
遍串，非字母数字左加右减，左小右左右小不等返假，左加右减，返真
```
```
public boolean isPalindrome(String s) {
    int n = s.length();
    int left = 0, right = n - 1;
    while (left < right) {
        while (left < right && !Character.isLetterOrDigit(s.charAt(left))) {
            ++left;
        }
        while (left < right && !Character.isLetterOrDigit(s.charAt(right))) {
            --right;
        }
        if (left < right) {
            if (Character.toLowerCase(s.charAt(left)) != Character.toLowerCase(s.charAt(right))) {
                return false;
            }
            ++left;
            --right;
        }
    }
    return true;
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

226. Invert Binary Tree 翻转二叉树

```
root of binary tree, invert tree, return its root.

Input: root = [4,2,7,1,3,6,9]
Output: [4,7,2,9,6,3,1]
```
```
二叉树根节点，翻转二叉树，返根节点
```

```DFS```
```
递根；
节空返空，左递右，右递左，左右换，返节；
```
```
public TreeNode invertTree(TreeNode root) {
    return dfs(root);
}
public TreeNode dfs(TreeNode node) {
    if (node == null) {return null;}
    TreeNode right = dfs(node.right);
    TreeNode left = dfs(node.left);
    node.left = right;
    node.right = left;
    return node;
}
```

```BFS```
```
根空返，队加根，队非空；
队弹节，左右换，非空队加左右；
```
```
public TreeNode invertTree(TreeNode root) {
    if (root == null) return null;
    Queue<TreeNode> queue = new LinkedList<TreeNode>();
    queue.add(root);
    while (!queue.isEmpty()) {
        TreeNode current = queue.poll();
        TreeNode temp = current.left;
        current.left = current.right;
        current.right = temp;
        if (current.left != null) queue.add(current.left);
        if (current.right != null) queue.add(current.right);
    }
    return root;
}
```

235. Lowest Common Ancestor of a Binary Search Tree 二叉搜索树的最近公共祖先

```
binary search tree (BST), find lowest common ancestor (LCA) of two nodes in BST.

According to definition of LCA on Wikipedia: “lowest common ancestor is defined between two nodes p and q as lowest node in T that has both p and q as descendants (node to be a descendant of itself).”

Input: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
Output: 6
Explanation: The LCA of nodes 2 and 8 is 6.
```
```
二叉搜索树，两个节点最近公共祖先。最近公共祖先，两节点都是子节点的最近点。
```

```DFS```
```
节值大返递左，节值小返递右，返节
```
```
public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
    return dfs(root, p.val, q.val);
}

public TreeNode dfs(TreeNode node, int pVal, int qVal) {
    int nodeVal = node.val;
    if (pVal < nodeVal && qVal < nodeVal) {return dfs(node.left, pVal, qVal);}
    if (pVal > nodeVal && qVal > nodeVal) {return dfs(node.right, pVal, qVal);}
    return node;
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

270. Closest Binary Search Tree Value 最接近的二叉搜索树值

```
root of binary search tree and target value, return value in BST that is closest to target.

Input: root = [4,2,5,1,3], target = 3.714286
Output: 4
```
```
二叉搜索树，目标值，返回最接近目标的二叉搜索树值。
```

```DFS```
```
节空返值，节近节值，节小递右，节大递左
```
```
public int closestValue(TreeNode root, double target) {
    return dfs(root, target, root.val);
}
    
private int dfs(TreeNode node, double target, int val) {
    if (node == null) return val;
    if (Math.abs(node.val - target) < Math.abs(val - target)) val = node.val;
    if (node.val < target) val = dfs(node.right, target, val);
    else if (node.val > target) val = dfs(node.left, target, val);
    return val;
}
```

344. Reverse String 反转字符串

```
reverses string. string is array of characters s.
modifying input array in-place with O(1) extra memory.

Input: s = ["h","e","l","l","o"]
Output: ["o","l","l","e","h"]

```
```
字符串反转，字符数组，原地修改输入数组，O(1)额外空间
```
```

```
```

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

392. Is Subsequence 判断子序列

```
two strings s and t, return true if s is subsequence of t, or false otherwise.

subsequence of string is new string that is formed from original string by deleting some (can be none) of characters without disturbing relative positions of remaining characters. (i.e., "ace" is a subsequence of "abcde" while "aec" is not).

Input: s = "abc", t = "ahbgdc"
Output: true
```
```
两字符串s和t，判断s是否t的子序列。字符串子序列是原始字符串删除一些字符不改变剩余字符相对位置形成新字符串。
```
```
public boolean isSubsequence(String s, String t) {
    if (s.isEmpty()) return true;
    int ind = 0;
    char[] sca = s.toCharArray();
    for (char tChar : t.toCharArray()) {
        if (ind < sca.length && sca[ind] == tChar) ind ++;
    }
    return ind == sca.length;
}
```
```
public boolean isSubsequence(String s, String t) {
    if(s.length() == 0) return true;
    if(t.length() == 0) return false;
    int sDex = 0;
    for(char ch : t.toCharArray()){
        char sCh = s.charAt(sDex);
        if(sCh == ch) sDex++;
        if(sDex == s.length()) return true;
    }
    return false;
}
```
```
public boolean isSubsequence(String s, String t) {
    int n = s.length(), m = t.length();

    int[][] f = new int[m + 1][26];
    for (int i = 0; i < 26; i++) {
        f[m][i] = m;
    }

    for (int i = m - 1; i >= 0; i--) {
        for (int j = 0; j < 26; j++) {
            if (t.charAt(i) == j + 'a') {f[i][j] = i;}
            else {f[i][j] = f[i + 1][j];}
        }
    }
    int add = 0;
    for (int i = 0; i < n; i++) {
        if (f[add][s.charAt(i) - 'a'] == m) {return false;}
        add = f[add][s.charAt(i) - 'a'] + 1;
    }
    return true;
}
```
```
class Solution {
    public boolean isSubsequence(String s, String t) {
        if("".equals(s)){
            return true;
        }
        if(s.length() > t.length()){
            return false;
        }
        boolean[][] dp = new boolean[s.length()][t.length()];
        boolean flag =false;
        for(int i = 0 ; i < t.length(); i++){
            if(flag){
                dp[0][i] = true;
                continue;
            }
            if(s.charAt(0) == t.charAt(i)){
                dp[0][i] = true;
                flag = true;
            }
            
        }


        for(int i = 1; i < dp.length; i++){
            boolean flag1 = false;
            for(int j = 1; j < dp[0].length; j++ ){
                if(flag1){
                    dp[i][j] = true;
                    continue;
                }

                if(s.charAt(i) == t.charAt(j)){
                    dp[i][j] = dp[i-1][j-1];
                    if(dp[i][j]){flag1 = true;}
                }

            }
        }

        return dp[s.length()-1][t.length()-1];
    }
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

463. Island Perimeter 岛屿周长

```
row x col grid map, grid[i][j] = 1 land, grid[i][j] = 0 water.

Grid cells connected horizontally/vertically (not diagonally). grid surrounded water, one island (one or more connected land cells).

island doesn't have "lakes", water inside isn't connected to water around island. One cell square with side length 1. grid rectangular, width and height don't exceed 100. Determine perimeter of island.

Input: grid = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]
Output: 16
```
```
二维网格，1陆0水，格水平垂直相连，水包围，只一岛，岛无湖，格边1，网长方，宽高不过100，岛周长。
```

```DFS```
```
遍行，遍列，岛递行列；
超界加，水加，标过0，标2，递上下左右
```
```
public int islandPerimeter(int[][] grid) {
    for (int r = 0; r < grid.length; r++) {
        for (int c = 0; c < grid[0].length; c++) {
            if (grid[r][c] == 1) {return dfs(grid, r, c);}
        }
    }
    return 0;
}

int dfs(int[][] grid, int r, int c) {
    if (!(0 <= r && r < grid.length && 0 <= c && c < grid[0].length)) {return 1;}
    if (grid[r][c] == 0) {return 1;}
    if (grid[r][c] != 1) {return 0;}
    grid[r][c] = 2;
    return dfs(grid, r - 1, c)
        + dfs(grid, r + 1, c)
        + dfs(grid, r, c - 1)
        + dfs(grid, r, c + 1);
}
```

```BFS```
```
遍行，遍列，岛；
上右下左，超界、水加，加总，返总；
```
```
static int[] dx = {0, 1, 0, -1};
static int[] dy = {1, 0, -1, 0};

public int islandPerimeter(int[][] grid) {
    int n = grid.length, m = grid[0].length;
    int ans = 0;
    for (int i = 0; i < n; ++i) {
        for (int j = 0; j < m; ++j) {
            if (grid[i][j] == 1) {
                int cnt = 0;
                for (int k = 0; k < 4; ++k) {
                    int tx = i + dx[k];
                    int ty = j + dy[k];
                    if (tx < 0 || tx >= n || ty < 0 || ty >= m || grid[tx][ty] == 0) {
                        cnt += 1;
                    }
                }
                ans += cnt;
            }
        }
    }
    return ans;
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

543. Diameter of Binary Tree 二叉树直径

```
root of binary tree, length of diameter of tree.
length of longest path two nodes in tree.
number of edges.

Input: root = [1,2,3,4,5]
Output: 3
Explanation: 3 is the length of the path [4,2,1,3] or [5,2,1,3].
```
```
二叉树，直径长度，两结点路径长度最大值，边数
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

617. Merge Two Binary Trees 合并二叉树

```
two binary trees root1 and root2.
put one of them to cover other, some nodes of two trees are overlapped while others are not. merge two trees into a new binary tree. merge rule is if two nodes overlap, then sum node values up as new value of merged node. Otherwise, NOT null node will be used as node of new tree.
Return merged tree.
merging process must start from the root nodes of both trees.

Input: root1 = [1,3,2,5], root2 = [2,1,3,null,4,null,7]
Output: [3,4,5,5,4,null,7]
```
```
两二叉树，合并新树，节点重叠，值相加，不空新节，返回新树。合并从根开始。
```
```DFS```
```
1空返2，2空返1，1值加2值；
1左递左左，1右递右右，返1；
```
```
public TreeNode mergeTrees(TreeNode t1, TreeNode t2) {
    return dfs(t1, t2);
}n2
public TreeNode dfs(TreeNode n1, TreeNode n2) {
    if (n1 == null)return n2;
    if (n2 == null)return n1;
    n1.val += n2.val;
    n1.left = dfs(n1.left, n2.left);
    n1.right = dfs(n1.right, n2.right);
    return n1;
}
```

```BFS```
```
1空返2，2空返1，队加12；
队非空，队弹12，1加2，12左非空队加12左，1左空2左，12右非空队加12右，1右空2右；
```
```
public TreeNode mergeTrees(TreeNode t1, TreeNode t2) {
	if(t1==null) {return t2;}
    if(t2==null) {return t1;}
	Queue<TreeNode> queue = new LinkedList<TreeNode>();
	queue.add(t1);
	queue.add(t2);
	while(!queue.isEmpty()) {
		TreeNode n1 = queue.poll();
		TreeNode n2 = queue.poll();
		n1.val += n2.val;
		if(n1.left!=null && n2.left!=null){queue.add(n1.left);queue.add(n2.left);}
		else if(n1.left==null) {n1.left = n2.left;}
		if(n1.right!=null && n2.right!=null) {queue.add(n1.right);queue.add(n2.right);}
		else if(n1.right==null) {r1.right = n2.right;}
	}
	return t1;
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

733. Flood Fill 图像渲染

```
m x n integer grid image, image[i][j] represents pixel value of image.
three integers sr, sc, and newColor. perform flood fill on image starting from pixel image[sr][sc].
consider starting pixel, plus any pixels connected 4-directionally to starting pixel of the same color as starting pixel, plus any pixels connected 4-directionally to those pixels with same color. Replace color of all of aforementioned pixels with newColor.
Return modified image flood fill.

Input: image = [[1,1,1],[1,1,0],[1,0,1]], sr = 1, sc = 1, newColor = 2
Output: [[2,2,2],[2,2,0],[2,0,1]]
Explanation: From the center of the image with position (sr, sc) = (1, 1) (i.e., the red pixel), all pixels connected by a path of the same color as the starting pixel (i.e., the blue pixels) are colored with the new color.
Note the bottom corner is not colored 2, because it is not 4-directionally connected to the starting pixel.
```
```
二维网格图，image[i][j]像素值颜色，始点sr、sc，新色newColor，始点上下左右同值点改为newColor。
```
```DFS```
```
存始值，非新递始；
同始值，改新值，递上下左右；
```
```
public int[][] floodFill(int[][] image, int sr, int sc, int newColor) {
    int color = image[sr][sc];
    if (color != newColor) dfs(image, sr, sc, color, newColor);
    return image;
}
public void dfs(int[][] image, int r, int c, int color, int newColor) {
    if (image[r][c] == color) {
        image[r][c] = newColor;
        if (r >= 1) dfs(image, r-1, c, color, newColor);
        if (c >= 1) dfs(image, r, c-1, color, newColor);
        if (r+1 < image.length) dfs(image, r+1, c, color, newColor);
        if (c+1 < image[0].length) dfs(image, r, c+1, color, newColor);
    }
}
```
```BFS```
```
存始值，同新返，长宽、队加始点，始更值，队非空；
弹点，横纵，遍四方；
上下左右，界内、队加点、点更值；
```
```
int[] dx = {1, 0, 0, -1};
int[] dy = {0, 1, -1, 0};

public int[][] floodFill(int[][] image, int sr, int sc, int newColor) {
    int currColor = image[sr][sc];
    if (currColor == newColor) {return image;}
    int n = image.length, m = image[0].length;
    Queue<int[]> queue = new LinkedList<int[]>();
    queue.offer(new int[]{sr, sc});
    image[sr][sc] = newColor;
    while (!queue.isEmpty()) {
        int[] cell = queue.poll();
        int x = cell[0], y = cell[1];
        for (int i = 0; i < 4; i++) {
            int mx = x + dx[i], my = y + dy[i];
            if (mx >= 0 && mx < n && my >= 0 && my < m && image[mx][my] == currColor) {queue.offer(new int[]{mx, my});image[mx][my] = newColor;}
        }
    }
    return image;
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

```Two Pointer```
```
1有退计退标减，2有退计退标减，无退相同标减，无退不同出，反相同
```
```
public boolean backspaceCompare(String S, String T) {
    int i = S.length() - 1, j = T.length() - 1, back;
    while (true) {
        back = 0;
        while (i >= 0 && (back > 0 || S.charAt(i) == '#')) {
            back += S.charAt(i) == '#' ? 1 : -1;
            i--;
        }
        back = 0;
        while (j >= 0 && (back > 0 || T.charAt(j) == '#')) {
            back += T.charAt(j) == '#' ? 1 : -1;
            j--;
        }
        if (i >= 0 && j >= 0 && S.charAt(i) == T.charAt(j)) {
            i--;
            j--;
        } else {
            break;
        }
    }
    return i == -1 && j == -1;
}
```

938. Range Sum of BST

```
root node of a binary search tree, sum of values of all nodes in the inclusive range

Input: root = [10,5,15,3,7,null,18], low = 7, high = 15
Output: 32
```
```
二叉搜索树根结点，范围结点和，BST 左<节<右
```
```深度优先 递左右 插底```

```
节空0，节高递左，节低递右，节递左右
```

```
public int rangeSumBST(TreeNode root, int low, int high) {
    if(root == null){return 0;};
    if(root.val > high){return rangeSumBST(root.left,low,high);};
    if(root.val < low){return rangeSumBST(root.right,low,high);};
    return root.val + rangeSumBST(root.left,low,high) + rangeSumBST(root.right,low,high);
}
```

```广度优先 加左右 横扫```

```
总0，建队，队加节，队非空；
队头节，节空过，节高加左，节低加右，总加节，队加左右；
返总
```

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

997. Find the Town Judge 找小镇法官

```
In town, n people labeled from 1 to n. one of people is town judge.
town judge trusts nobody.
Everybody (except for town judge) trusts town judge.
exactly one person that satisfies properties 1 and 2.
array trust where trust[i] = [ai, bi] representing person labeled ai trusts person labeled bi.
Return label of town judge if town judge exists and can be identified, or return -1 otherwise.

Input: n = 3, trust = [[1,3],[2,3]]
Output: 3
```
```
n人，从1到n。法官不信任任何人，除法官都信法官，只有一人满足前二项。数组，i、ai信bi。有返法官号，无返-1。
```
```
边不足返-1；
遍信，信0出度加，信1入度加；
遍入出度，入度N-1、出度0，法官；
返-1；
```
```
public int findJudge(int N, int[][] trust) {
    if (trust.length < N - 1) {return -1;}

    int[] indegrees = new int[N + 1];
    int[] outdegrees = new int[N + 1];

    for (int[] relation : trust) {
        outdegrees[relation[0]]++;
        indegrees[relation[1]]++; 
    }

    for (int i = 1; i <= N; i++) {
        if (indegrees[i] == N - 1 && outdegrees[i] == 0) {return i;}
    }
    return -1;
}
```

1022. Sum of Root To Leaf Binary Numbers 从根到叶的二进制数和

```
root of binary tree where each node has value 0 or 1. Each root-to-leaf path represents binary number starting with most significant bit.
path is 0 -> 1 -> 1 -> 0 -> 1, represent 01101 in binary, which is 13.
all leaves in the tree, consider numbers represented by path from root to leaf. Return sum of numbers.
answer fits in 32-bits integer.

Input: root = [1,0,1,0,1,0,1]
Output: 22
Explanation: (100) + (101) + (110) + (111) = 4 + 5 + 6 + 7 = 22
```
```
二叉树，结点值0或1，从根到叶路径代表从最高有效位开始二进数，每叶根路径数字，返回和。32位整数。
```

```DFS```
```
递根0；
节空返0，值2加节值，左等右返值，返递左值加递右值；
```
```
public int sumRootToLeaf(TreeNode root) {
    return dfs(root, 0);
}

public int dfs(TreeNode node, int val) {
    if (node == null) return 0;
    val = val * 2 + node.val;
    if (node.left == node.right) return val;
    return dfs(node.left, val) + dfs(node.right, val);
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

1791. Find Center of Star Graph 找出星型图的中心节点

```
undirected star graph consisting of n nodes labeled from 1 to n. star graph is graph where there is one center node and exactly n - 1 edges that connect center node with every other node.
2D integer array edges where each edges[i] = [ui, vi] indicates that there is edge between nodes ui and vi. Return center of star graph.

Input: edges = [[1,2],[2,3],[4,2]]
Output: 2
Explanation: As shown in the figure above, node 2 is connected to every other node, so 2 is the center.
```
```
无向星型图，节点1到n。星型图1中心节点，有n-1边连其它节点。二维整数边数组，i边顶点ui、vi连边。返回星型图中心节点。
```
```Graph```
```
1等返1，返2
```
```
public int findCenter(int[][] edges) {
    if(edges[0][0] == edges[1][0] || edges[0][0] == edges[1][1]) return edges[0][0];
    return edges[0][1];
}
```
```
遍边，1顶加度、2顶加度，遍边n-1度边返顶
```
```
public int findCenter(int[][] edges) {
    int n = edges.length + 1;
    int[] degrees = new int[n + 1];
    for (int[] edge : edges) {
        degrees[edge[0]]++;
        degrees[edge[1]]++;
    }
    for (int i = 1; ; i++) {
        if (degrees[i] == n - 1) {return i;}
    }
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

1971. Find if Path Exists in Graph 寻找图中是否存在路径

```
bi-directional graph with n vertices, where each vertex is labeled from 0 to n - 1 (inclusive). edges in graph are represented as 2D integer array edges, where each edges[i] = [ui, vi] denotes bi-directional edge between vertex ui and vertex vi. Every vertex pair is connected by at most one edge, and no vertex has an edge to itself.
determine if there is valid path that exists from vertex source to vertex destination.
edges and integers n, source, and destination, return true if there is valid path from source to destination, or false otherwise.

Input: n = 3, edges = [[0,1],[1,2],[2,0]], source = 0, destination = 2
Output: true
Explanation: There are two paths from vertex 0 to vertex 2:
- 0 → 1 → 2
- 0 → 2
```
```
n顶点双向图，顶点标从0到n-1。二维整数边数组，i边顶点ui、vi双向边。顶点对一边，无自连边。从始到终有效路径。边数组、整数n、始终点，有返真，无返假。
```

```Graph```
```
置假，始终等真；
遍边，节邻、邻节双向顶点，递始终；
始访真找真返，始访真，遍始邻，邻终等真，未访递邻；
```
```
boolean found;
public boolean validPath(int n, int[][] edges, int start, int end) {
    found = false;

    if(start == end) return true;

    Map<Integer,List<Integer>> graph = new HashMap();
    boolean[] visited = new boolean[n];

    for(int i = 0 ; i < n ; i++){
        graph.put(i, new ArrayList());
    }
    for(int[] edge : edges){
       graph.get(edge[0]).add(edge[1]);
       graph.get(edge[1]).add(edge[0]);
    }

    dfs(graph,visited,start,end);
   
    return found;
}

private void dfs(Map<Integer,List<Integer>> graph,boolean[] visited, int start, int end){
    if(visited[start] || found) return;
    visited[start] = true;
    for(int nei : graph.get(start)){
        if(nei == end){found = true;break;}
        if(!visited[nei]) dfs(graph, visited, nei, end);
    }
}
```

```
始终等真，路组假，始路真，有下真；
终路假且有下真，有下假，遍边，顶1真、顶2假有下真顶2真，顶2真有下真顶1真；
```
```
public boolean validPath(int n, int[][] edges, int source, int destination) {
    if(source == destination) return true;

    boolean[] path = new boolean[n];
    path[source] = true;
    boolean hasNext = true;

    while(!path[destination] && hasNext) {
        hasNext = false;
        for(int[] edge : edges) {
            if(path[edge[0]]) {
                if(!path[edge[1]]) {hasNext = true;path[edge[1]] = true;}
            }
            else if(path[edge[1]]) {hasNext = true;path[edge[0]] = true;}
        }
    }

    return path[destination];
}
```