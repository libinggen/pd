# DesignPattern

## 对象

| **设计模式** &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | **特征** &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | **实现** |
| :- | :- | :- |
| 对象模板 | 封装、索引无关 | 变量名，初始化 - T.M(T.D) |
| 原型 | 复制对象、免初始化 | 复制原始对象，浅复引用、深复对象，=S，class:NSObject,NSCopying，init{super.init()}，func copyWithZone{return (self)}，.copy() as，数组 copyItems:true，@NSCopying |
| 单例 | 一类一例、同一数据 | 添加返回、执行返回，全局变量、let = ()、final class{private init{}}，class var:class{struct {static let =}return S.singleton}、包单执 SERIAL sync 、读多执 CONCURRENT sync、写多加等 barrier_async，GCD、block队列 |
| 对象池 | 有限对象 | Array、semaphore_create wait signal，final class{private init{}}、private class var:{struct {static let =}return S.singleton}，SERIAL syn{remove} async{append} |
| 工厂方法 | 选实现类 | 全局工厂方法 func{switch case () return}，基类 class{class func{switch case () return}}、class:{private init{super.init}}，class{class func{switch case T.self return class func()}}、class:{private convenience init{self.init} private override init{super.init} override class func{}}，单例 class:{override singleton} |
| 抽象工厂 | 选工厂 | 抽象工厂class{final class func{switch case factory() return}，封装初始化init(type){getFactory(type)}}，单例class{final class func{switch case T.self return singleton}、class:Factory{override singleton}，原型@objc protocol{var{get} class func()->()}、class:P{func copyWithZone{return ()}}、class:{private override init{}、class func{return singleton.copy() as}} |
| 建造者 | 默认值、返初始 | class Builder{private var= func set(:){if(){self.=}} func buildObject()->T{return (self.)}}，工厂class Builder{class func getBuilder(type)->Builder{switch case () return}}、class:Builder{private override init{} override func{}} | 

## 结构

| **设计模式** &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | **特征** &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; | **实现** |
| :- | :- | :- |
| 适配器 | 返回方法 | 扩展extension:{var:{return func()} func{return func()}}，类class:{private let: init{=} var:{return func()} func{return func()}}，双向适配class:,{var: func{.func()} var:{return .}、class var:{get{struct{static let=}return .}}} |
| 桥接 | 抽象分离、集中派发 | class Bridge:,{private var: init(:){self.=} func(:){}}，工厂class{class func(type){switch case return()}、class Bridge:,{init(:C.E){self.= class func(type)} func(:){}}} |

## 行为
