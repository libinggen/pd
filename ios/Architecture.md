# Architecture

| 技术逻辑 | 商业逻辑 |
| :-: | :-: |
| 闭合 | 开放 |
| Code | 配置 |

## MVVM、VIPER

RCV|VMPI|EM

|**MVVM**|  |  |**VIPER**|  |
| :- | :- | :- | :- | :- |
| View: | UI操作、用户交互传VM |  | View: | UI操作、用户交互传P |
| ViewModel: | weak V、集合模型、收V交互 更新视图属性 修改模型数据 属性观察响应架构 |  | Presenter: | weak V 不改数据、响应交互调I |
| Model: | 属性、初始化 |  | Enity: | 初始化、Set/Get |
|  |  |  | Interactor: | weak P 处理数据源，网络请求、数据传输、缓存、存储、实例 |
|  |  |  | Router: | 界面跳转、组件切换 |

## 面向协议
```
protocol P{
  associatedtype AType:P
  func(:Self)
  func(:AType)
}
```
