# Architecture

| 技术逻辑 | 商业逻辑 |
| :-: | :-: |
| 闭合 | 开放 |
| Code | 配置 |

## MVVM、VIPER

RCV UI{.reload()}|VMPI|ME UIblock()
C .vms:VM,{associatedtype VmsType:VM} .ps:P,{associatedtype PsType:P} 

|**MVVM**|  |  |**VIPER**|  |
| :- | :- | :- | :- | :- |
| View: | C.v C.vms V.vm，C.界面跳转、UI操作、用户交互传VM，C.vms() C.select{.vms.load()} V.init{vm.func{.reload()} |  | View: | C.v C.ps weak .r V.p，UI操作、用户交互传P C.p() C.select{ps.load()} V.init{p.func{.reload()} |
| ViewModel: | .m weak .v，集合模型、收V交互 更新视图属性 修改模型数据 属性观察响应架构、.ini{.block={uiblock,}}.load{.m} |  | Presenter: | .i weak .r、 不改数据、响应交互调I .init{.i.blck={uiblock,}} .load{.i.load()} .r.present())|
| Model: |weak .vm，属性、初始化 didSet{vm.block()}|  | Enity: |weak .i、属性、初始化、Set/Get didSet{i.block()}||
|  |  |  | Interactor: | .m weak P，处理数据源，网络请求、数据传输、缓存、存储、实例 .load{.m} |
|  |  |  | Router: | .c，界面跳转、组件切换，prsent(){.c}|

## 面向协议
```
protocol P{
  associatedtype AType:P
  func(:Self)
  func(:AType)
}
```


|**SwiftUI + MVVM**|  |
| :- | :- |
| M: | :ObservableObject .发@Published 类属性 |
| V: | .收@ObservedObject 类:ObservableObject，@EnvironmentObject环境取 ObservableObject，.变@Statue $ struct属性 新实例 数变图变，@Binding子绑父得父值，@Environment环境数据 isPresented显示 .wrappedValue.dismiss()隐藏 |
| VM: | :ObservableObject 发@Published 类属性 |