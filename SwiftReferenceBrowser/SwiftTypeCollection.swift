//
//  SwiftTypeCollection.swift
//  SwiftReferenceBrowser
//
//  Created by Muronaka Hiroaki on 2017/06/04.
//  Copyright © 2017年 Muronaka Hiroaki. All rights reserved.
//

import Cocoa
import ObjectMapper

struct SwiftTypeCollection {
    
    var swiftTypes: [SwiftType] = [SwiftType]()
    
    
    init?(contentsOfPath basePath: String) {
        for any in FileManager.default.enumerator(atPath: basePath)! {
            if let filename = any as? String, filename.hasSuffix(".json") {
                let filePath = "\(basePath)/\(filename)"
                print(filePath)
                let content = try! String(contentsOfFile: filePath)
                let swiftType = Mapper<SwiftType>().map(JSONString: content)!
                swiftTypes.append(swiftType)
            }
        }
    }
    
    func typeNames(pattern: String) -> [SwiftType] {
        guard pattern.characters.count >= 2 else {
            return [SwiftType]()
        }
        
        let p = pattern.characters.map{ "\($0).*" }.joined()
        
        return self.swiftTypes.filter {
            print($0.titleContent)
            return $0.titleContent.range(of: p, options: [.regularExpression, .caseInsensitive]) != nil
        }
    }

}
