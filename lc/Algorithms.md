# Algorithms

| **思想** | **数据结构** | **字符串** | **排序** | **查找** | **图** | **动态规划** |
| :- | :- | :- | :- | :- | :- | :- |
| 基分 | 数组 | 排序 | 初级 | 符号表 | 有无向 | 背包 |
| 递归 |  | 查找 | 归并 | 二叉树 | 最小树 | 子串 |
| 递推 |  | 正则 | 快速 | 平衡树 | 最短路 |  |
|  |  | 压缩 | 优队 |  | 最小割 |  |

# 递归其分、改查数组、增删链表、组链散列、散列记图

# &nbsp; &nbsp; &nbsp; &nbsp; BFS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DJS &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; DFS

| **步骤** | **操作** |  | **步骤** | **操作** |  | **步骤** | **操作** |
| :- | :- | :- | :- | :- | :- | :- | :- |
| 1. | 队列 |  | 1. | 节边图 |  | 1. | 节空返0 |
| 2. | 加节 |  | 2. | 成本图 |  | 2. | 节高递左 |
| 3. | 记组 |  | 3. | 记处组 |  | 3. | 节低递右 |
| 4. | 队空 |  | 4. | 未小节 |  | 4. | 节递左右 |
| 4.1. | 弹节 |  | 5. | 节非空 |
| 4.2. | 未处 |  | 5.1. | 节成本 |
| 4.2.1. | 判正 |  | 5.2. | 节邻居 |
| 4.2.1. | 判正 |  | 5.3. | 遍邻居 |
| 4.2.1.1. | 返值 |  | 5.3.1. | 节邻本 |
| 4.2.2. | 判非 |  | 5.3.2. | 节邻小 |
| 4.2.2.1. | 加节 |  | 5.3.2.1. | 邻新本 |
| 4.2.2.2. | 记处 |  | 5.3.2.2. | 邻父节 |
| 5. | 返错 |  | 5.4. | 记处节 |
|  |  |  | 5.5. | 未小节 |

# 算法、数据结构、BigO

| **算法** | **题量** | **数据结构** | **特征** | **题量** | **BigO** | **概率** | **解法** |
| :- | :- | :- | :- | :- | :- | :- | :- |
| 字符串 处理String | 20 | 数组 Array | O(1) 改查弹，O(n) 增删 |  | O(1) |  | 数学题 |
| 排序算法 Sorting 快速、归并 | 2 | 链表 LinkedList | O(1) 增删，O(n) 改查 | 20 | O(lgn) | 90% | 二分法 |
| 双指针算法 TwoPointers | 20 | 二叉树 BinarySearch | 最坏O(n)增删改查，二叉树高度O(n) | 20 |  | 10% | 信增法(每次x2)，快速幂(求x^n)，欧几里得算法(求最大公约数) |
| 二分法 BinarySearch | 10 | 堆 Heap | O(lgn) 增删弹，O(1) 顶 | 5 | O(vn) | 99% | 因数分解 Factoriztion |
| 分治法 Divide&Conquer | 10 | 哈希表 HashTable | O(1) 增删改查，key字符串 O(L字符串长度) | 10 |  | 1% | 分块检索(n区间)vn个vn大小区间 区间单独维护统计数据 |
| 广度优先搜索 BFS | 5 | 并查表 UnionFind | O(1) 查并 isConneted getSize | 3 | O(n) | 50% | 双指针 TwoPointers(同相背向 合并) |
| 深度优先搜索 DFS/递归 Recursion | 20 | 字典树 Trie | O(L字符串长度) 增删改查 | 3 |  | 20% | 二叉树遍历 BinaryTree，分治 Divide&Conquer |
| 二叉树遍历算法 Trarerral | 20 | 红黑树 RB-Tree | O(lgn) 增删改查，O(1) Max Min LowerUpperBound | 1 |  | 10% | n次O(1)操作 每次操作O(1) 数据结构(HashMap UnionFind) |
| 动态规划 Dynamic Programing | 50 | (不)线段树 SegmentTree | O(lgn) 增删改查 rangeMaxMin LowerUpperBound，O(1) Max Min Sum，万能结构 | 3 |  | 10% | 单调栈 MonotonicStack，单调队列 MonotonicQueue |
| 拓朴排序算法 Topological Order | 3 | (不)树状数组 BinaryIndexedTree | O(lgn) rangeSum | 2 |  | 10% | 枚举法 Enumeration(for循环数组) |
|  |  | (不)跳跃表 SkipList | O(lgn) 增删改查 LowerUpperBound，O(1) Max Min | 1 | O(nlgn) | 60% | n次O(lgn)操作，lgn二分法，lgn数据结构 |
|  |  |  |  |  |  | 20% | lgn次O(n)操作，二分答案 O(n)时间检测答案偏大偏小 |
|  |  |  |  |  |  | 20% | 排序 + O(n)，O(nlogn)算法 |
|  |  |  |  |  | O(nlgk) | 50% | n次O(lgk)操作 |
|  |  |  |  |  |  | 50% | 类归并排序，分治k区间 每层O(n) lgk层 |
|  |  |  |  |  | O(n+m)点边 | 100% | BFS |
|  |  |  |  |  | O(n^2) O(n^3)... | 50% | O(n)枚举某参数 降维后用其他算法 |
|  |  |  |  |  |  | 30% | 动态规划 |
|  |  |  |  |  |  | 20% | nm矩阵，BFS |
|  |  |  |  |  | O(2^n) | 100% | 组合，深度优先搜索 |
|  |  |  |  |  | O(n!) | 100% | 排列，深度优先搜索 |


# 二叉树前中后序遍历 节位
| **前序** | **中序** | **后序** | 
| :- | :- | :- |
| 节左右 | 左节右 | 左右节 |
