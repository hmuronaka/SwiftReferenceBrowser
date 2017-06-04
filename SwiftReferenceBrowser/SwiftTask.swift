//
//  SwiftTask.swift
//  SwiftReferenceBrowser
//
//  Created by Muronaka Hiroaki on 2017/06/04.
//  Copyright © 2017年 Muronaka Hiroaki. All rights reserved.
//

import Cocoa
import ObjectMapper

struct SwiftTask: Mappable {
    
    var id:String = ""
    var role: String = ""
    var name: String = ""
    var displayName: String = ""
    var titleContent: String = ""
    var paths:[String] = [String]()
    var abstract: String = ""
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        id <- map["id"]
        role <- map["role"]
        name <- map["name"]
        displayName <- map["displayName"]
        titleContent <- map["title.content"]
        paths <- map["paths"]
        abstract <- map["abstract"]
    }
}
