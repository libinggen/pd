# Swift

|**基础语法**|  |
| :- | :- |
| 常量: | let 常量名: 类型=初值 |
| 变量: | var 变量 |
| 基本类型: | Int32 Int16 Int64 Int8 |
| 基本类型: | Double Float Bool Character |
| 字典: | ```Dictionary<键类型``` |
| Optional: | OK |

|**字符串、数组**|  |
| :- | :- |
| 嵌入值: | "\(表达式)" |
| 可变字符串: | var 变量名:String |
| 定常数组: | ```let 变量名:类型名[]={元素,}``` |
| 变长数组(列表): | ```var 变量名=类型名[]()``` |

|**属性**|  |
| :- | :- |
| 存储属性: | var 属性名: 类型=初始值 |
| 计算属性: | var 属性名: 类型{get{} set{}} |

|**实例、对象**|  |
| :- | :- |
| 创建对象: | 类/结构名(外参名:实参) |
| 自身实例: | self |

|**函数**|  |
| :- | :- |
| 函数定义: | func函数名(外参名 形参:参数类型=默认值)->返回类型{} |
| 函数调用: | 函数名(外参名:实参) |
| 可变参数: | func函数名(形参:参数类型...)->返回类型{} |
| 传出参数: | func函数名(inout形参:参数类型...)->返回类型{} |
| 函数类型: | (参数类型,)->返回类型 |
| 闭包: | {(形参:参数类型,)->返回类型 in 表达式 |

|**结构、枚举、类**|  |
| :- | :- |
| 结构: | struct结构名{成员} |
| 枚举: | enum类型名{case 枚举值=值} |
| 类: | class类名{成员} |
| 抽象类: | N/A |

|**继承、接口**|  |
| :- | :- |
| 继承: |  |
| 接口: | protocol |
| 扩展: | extension |

|**多线程**|  |
| :- | :- |
| 并发读写: | 包单执 SERIAL sync 、读多执 CONCURRENT sync、写多加等 barrier_async，GCD、block队列 |

|**流程控制**|  |
| :- | :- |
| 遍历: | for(变量 in 集合) |
| Switch: | no need break，多条件case合并，范围匹配 |
| Guard: | guard xx else{return} |

|**访问级别**|  |
| :- | :- |
| 访问级别: | public/internal/prvate/fileprivate |


  

 

 


高阶函数: ```sorted(by:)在前、map(_:)每个、filter(_:)选出、reduce(_:_:)初加``` ```快参$0 1 2 3```

闭包: ```{()->() in} [weak self]```

```mutating inout 修改``` ```willSet didSet``` 数组 JSON


