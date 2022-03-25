# DesignPattern

## 对象

| &nbsp; &nbsp; &nbsp; 设计模式 &nbsp; &nbsp; | &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 特征 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | 实现 |
| :- | :- | :- |
| 对象模板 | 封装、索引无关 | 变量名，初始化 - T.M(T.D) |
| 原型 | 复制对象、免初始化 | 复制原始对象，浅复引用、深复对象，=S，C:NSObject,NSCopying，init(){super.init()}，func copyWithZone(){return (self)}，.copy() as，数组 copyItems:true，@NSCopying |
| 单例 | 一类一例、同一数据 | 添加返回、执行返回，全局变量、let = ()、final class{private init()}，class var :T{struct {static let =}return S.singleton}、包单执 SERIAL sync 、读多执 CONCURRENT sync、写多加等 barrier_async，GCD、block队列 |

## 结构


## 行为
