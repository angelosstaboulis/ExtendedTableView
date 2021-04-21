//
//  ExtendedTableView.swift
//  ExtendedTableView
//
//  Created by Angelos Staboulis on 21/4/21.
//

import Foundation
import UIKit
class ExtendedTableView{
    var numbers:[Int]=[]
    var index:[IndexPath] = []
    init() {
        for item in 0..<100{
            numbers.append(item)
        }
    }
    func getNumbers()->Int{
        return numbers.count
    }
    func changeRow(cell:ExtendedCell,indexPath:IndexPath,value:Int){
        index.removeAll()
        index.append(indexPath)
        numbers.remove(at: indexPath.row)
        numbers.insert(value, at: indexPath.row)
        cell.lblDescription.text = String(value)
    }
    func removeRow(mainTableView:UITableView,indexPath:IndexPath){
        index.removeAll()
        index.append(indexPath)
        numbers.remove(at: indexPath.row)
        mainTableView.beginUpdates()
        mainTableView.deleteRows(at: index, with: .automatic)
        mainTableView.endUpdates()
    }
    func insertRow(mainTableView:UITableView,indexPath:IndexPath){
        let cell:ExtendedCell = mainTableView.cellForRow(at: indexPath) as! ExtendedCell
        cell.backgroundColor = .orange
        cell.accessoryType = .checkmark
        index.removeAll()
        for item in 0..<5{
            index.append(IndexPath(row: indexPath.row + (item+1), section: 0))
            numbers.insert(item+1, at: indexPath.row + (item+1))
        }
        mainTableView.beginUpdates()
        mainTableView.insertRows(at: index, with: .automatic)
        mainTableView.endUpdates()
    }
}
