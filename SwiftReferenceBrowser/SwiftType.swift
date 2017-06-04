//
//  SwiftType.swift
//  SwiftReferenceBrowser
//
//  Created by Muronaka Hiroaki on 2017/06/04.
//  Copyright © 2017年 Muronaka Hiroaki. All rights reserved.
//

import Cocoa
import ObjectMapper

struct SwiftType: Mappable {
    
    var id: String = ""
    var titleContent: String = ""
    var abstract: String = ""
    var kind: String = ""
    //var availability: String = ""
    var _adoptedBy: [[String:Any]] = [[String:Any]]()
    var _inheritedBy: [[String:Any]] = [[String:Any]]()
    var _inheritance: [[String: Any]] = [[String:Any]]()
    var declatationContent: String = ""
    var pid:String = ""
    var tasks:[SwiftTask] = [SwiftTask]()
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        titleContent <- map["title.content"]
        abstract <- map["abstract"]
        kind <- map["kind"]
        _adoptedBy <- map["adoptedBy"]
        _inheritedBy <- map["inheritedBy"]
        _inheritance <- map["inheritance"]
        declatationContent <- map["declaration.content"]
        pid <- map["pid"]
        tasks <- map["tasks"]
    }

}
