# Swift

|**流程控制**|  |
| :- | :- |
| 遍历: | for(变量 in 集合) |
| Switch: | no need break，多条件case合并，范围匹配 |
| Guard: | guard xx else{return} |

|**基础语法**|  |
| :- | :- |
| 常量: | let 常量名: 类型=初值 |
| 变量: | var 变量 |
| 基本类型: | Int32 Int16 Int64 Int8 |
| 基本类型: | Double Float Bool Character |
| 字典: | ```Dictionary<键类型 JSON``` |
| Optional: | OK |

|**字符串、数组**|  |
| :- | :- |
| 嵌入值: | ```"\(表达式)"``` |
| 可变字符串: | var 变量名:String |
| 定常数组: | ```let 变量名:类型名[]={元素,}``` |
| 变长数组(列表): | ```var 变量名=类型名[]()``` |

|**结构、枚举、类**|  |  |**继承、接口**|  |  |**实例、对象**|  |
| :- | :- | :- | :- | :- | :- | :- | :- |
| 结构: | struct结构名{成员} |  | 继承: |  |  | 创建对象: | 类/结构名(外参名:实参) |
| 枚举: | enum类型名{case 枚举值=值} |  | 接口: | protocol |  | 自身实例: | self |
| 类: | class类名{成员} |  | 扩展: | extension |  |  |  |
| 抽象类: | N/A |  |  |  |

|**属性**|  |  |**函数**|  |
| :- | :- | :- | :- | :- |
| 存储属性: | var 属性名: 类型=初始值 |  | 函数定义: | mutating func函数名(外参名 形参:参数类型=默认值)->返回类型{} |
| 计算属性: | var 属性名: 类型{get{} set{}} |  | 函数调用: | 函数名(外参名:实参) |
| 属性观察: | willSet didSet oldValue newValue |  | 可变参数: | func函数名(形参:参数类型...)->返回类型{} |
| 属性包装器: | @Published @Statue @Binding @EnvironmentObject @ObservedObject @Environment |  | 传出参数: | func函数名(inout形参:参数类型...)->返回类型{} |
| 惰性属性: | lazy |  | 函数类型: | (参数类型,)->返回类型 |
| 类型属性: | static let 同类实例共享，override class、static let |  | 闭包: | ```{(形参:参数类型,)->(返回类型) in [weak self] 表达式``` |
|  |  |  | 高阶函数: | ```sorted(by:)在前、map(_:)每个、filter(_:)选出、reduce(_:_:)初加``` |
|  |  |  | 快参: | ```$0 1 2 3``` |

|**访问级别**| 可见 | 继承 |
| :- | :- |
| open: | 本模块、引模块 | 本模块、引模块 |
| public: | 本模块、引模块 | 本模块 |
| internal默认: | 本模块 | 本模块 |
| fileprivate: | 本文件 | 本文件  |
| prvate: | 本作用域  | 本作用域 |

|**生命周期**|  |
| :- | :- |
|  |  |

|**内存管理**|  |
| :- | :- |
|  |  |

|**多线程**|  |
| :- | :- |
| 并发读写: | 包单执 SERIAL sync 、读多执 CONCURRENT sync、写多加等 barrier_async，GCD、block队列 |
| 全局队列 global: | background(后台操作)、utility(异步操作)、default(默认特殊)、user-Initiated(触发立返)、user-Interactive(主线阻塞)、unspecified(环境推断) |
| GCD方法: | dispatch_async(异步操作)、dispatch_once(访问一次)、dispatch_group(多任务完成) |
| Operation: | Operation(任务 Ready、Executing、Cancelled、finished)、BlockOperation(全局队列、并行多任务)、OperationQueue(多Op队列、maxConcurrentOperationCount)、取消(.cancle() :Operation{isCancelled})|
