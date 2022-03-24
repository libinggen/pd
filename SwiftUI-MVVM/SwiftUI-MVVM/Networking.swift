//
//  Networking.swift
//  SwiftUI-MVVM
//
//  Created by LiBinggen on 2022/3/24.
//

import Foundation
import Alamofire
import SwiftyJSON


public class Networking {
    
    public class func request(url:String,
                              method: HTTPMethod = .post,
                              parameters: [String: String] = [:],
                              successBlock: @escaping (_ type: String, _ result: JSON, _ msg: String) -> Void){
        AF.request("http://localhost:8080/cancelTest.php").response { response in
            debugPrint(response)
            switch response.result {
            case .success(let data):
                let json = JSON(data!)
                debugPrint(json)
                successBlock(method.rawValue,json,"")
            case .failure(let error):
                debugPrint(error)
            }
        }
    }
}

class Category {
    
    var id:String
    var enName:String
    var name:String
    var rank:Int
    
    init(jsonData:JSON) {
        id = jsonData["_id"].string!
        enName = jsonData["en_name"].string!
        name = jsonData["name"].string!
        rank = jsonData["rank"].int!
    }
    
}
