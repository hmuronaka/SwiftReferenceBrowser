//
//  ViewController.swift
//  SwiftReferenceBrowser
//
//  Created by Muronaka Hiroaki on 2017/06/04.
//  Copyright © 2017年 Muronaka Hiroaki. All rights reserved.
//

import Cocoa
import ObjectMapper

class ViewController: NSViewController {

    @IBOutlet weak var searchField: NSSearchField!
    @IBOutlet weak var resultLabel: NSTextField!
    @IBOutlet weak var tableView: NSTableView!
    
    var selectedTypes = [SwiftType]()
    
    var collection:SwiftTypeCollection!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        searchField.delegate = self
        
        let basePath = "swiftdoc/backend/swift"
        collection = SwiftTypeCollection(contentsOfPath: basePath)
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

extension ViewController: NSSearchFieldDelegate {
    override func controlTextDidChange(_ obj: Notification) {
        resultLabel.stringValue = searchField.stringValue
        selectedTypes = collection.typeNames(pattern: searchField.stringValue)
        tableView.reloadData()
        print("selectedTypes.count: \(selectedTypes.count)")
    }
    
}

extension ViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return selectedTypes.count
    }
}

extension ViewController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        let cell = tableView.make(withIdentifier: "MyView", owner: self) as! NSTableCellView
        cell.textField?.stringValue = selectedTypes[row].titleContent
        print("\(selectedTypes[row].titleContent)")
        return cell
     }
}
