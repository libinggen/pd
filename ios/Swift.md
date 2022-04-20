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
| 结构: | struct结构名{成员} |  | 继承: | inherit |  | 创建对象: | 类/结构名(外参名:实参) |
| 枚举: | enum类型名{case 枚举值=值} |  | 接口: | protocol |  | 自身实例: | self |
| 类: | class类名{成员} inheric deinit() |  | 扩展: | extension |  |  |  |
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
| :- | :- | :- |
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

|**多线程**| Multi Thread |
| :- | :- |
| 并发读写: | 包单执 block SERIAL sync 、读多执 CONCURRENT sync、写多加等 barrier_async，GCD、block队列 |
| 全局队列 global: | background(后台操作)、utility(异步操作)、default(默认特殊)、user-Initiated(触发立返)、user-Interactive(主线阻塞)、unspecified(环境推断) |
| GCD方法: | dispatch_async(异步操作)、dispatch_once(访问一次)、dispatch_group(多任务完成) |
| Operation: | Operation(任务State Ready、Executing、Cancelled、finished)、BlockOperation(全局队列、并行多任务)、OperationQueue(多Op队列、maxConcurrentOperationCount)、取消(.cancle() :Operation{isCancelled})|

|**Codable**|  |
| :- | :- |
| UUID: |  | 

|**Database**|  |
| :- | :- |
| SQLite | 独立于服务器 零配置 多进程和线程下安全访问 在表中使用含有特殊数据类型的一列或多列存储数据 |
| FMDB | 很薄的封装，主要的类两个：FMDatabase和FMResultSet 在使用fmdb的时候还需要导入libsqlite3.0.dylib |
| CoreData | Entity Relationships visual 带图形化的Model编辑 强大的关联关系, 一对多，多对多。想怎么查询就怎么查询，可以写出很复杂的查询逻辑 强大的查询 比SQLite使用更多的内存 比SQLite使用更多的存储空间 比SQLite在取数据方面更快 允许用户使用代表实体和实体间关系的高层对象来操作数据 可以管理串行化的数据 提供对象生存期管理与object_graph 管理，包括存储 OC对象映射关系来实现数据和对象的管理，这样就无需任何的SQL语句来操作数据库 Core Data直接与Sqlite交互，避免开发者使用原本的SQL语句 |
| Realm | iOS Android easy 跨平台 绝对免费 快速，简单的使用 没有使用限制 为了速度和性能，运行在自己的持久化引擎上  .write({.add() .delete() = } .objects) |

|**Realse**|  |
| :- | :- |
| App ID |  |
| iTune Connect |  |
| archives |  |
| Application Loader |  |

