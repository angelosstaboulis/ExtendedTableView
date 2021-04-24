//
//  ExtendedTableView.swift
//  ExtendedTableView
//
//  Created by Angelos Staboulis on 21/4/21.
//

import Foundation
import UIKit
protocol ExtendedTableViewProtcol:AnyObject{
    func expandRows(mainTableView:UITableView,indexPath:IndexPath)
    func changeRow(cell:ExtendedCell,indexPath:IndexPath,value:Int)
    func removeRow(mainTableView:UITableView,indexPath:IndexPath)
}
class ExtendedTableView:ExtendedTableViewProtcol{
    func expandRows(mainTableView: UITableView, indexPath: IndexPath)  {
        let cell:ExtendedCell = mainTableView.cellForRow(at: indexPath) as! ExtendedCell
        cell.accessoryType = .checkmark
        index.removeAll()
        for item in 0..<5{
            index.append(IndexPath(row: indexPath.row + (item+1), section:0))
            numbers.insert((item+1)*100, at: indexPath.row + (item+1))
            
        }
        mainTableView.beginUpdates()
        mainTableView.insertRows(at: index, with: .automatic)
        mainTableView.endUpdates()
       
    }
    func collapseRows(mainTableView: UITableView, indexPath: IndexPath)  {
        let cell:ExtendedCell = mainTableView.cellForRow(at: indexPath) as! ExtendedCell
        cell.accessoryType = .checkmark
        for item in 0..<index.count{
            index.append(IndexPath(row: indexPath.row + (item+1), section: 0 ))
            numbers.remove(at: indexPath.row  )
        }
        mainTableView.beginUpdates()
        mainTableView.deleteRows(at: index, with: .automatic)
        mainTableView.endUpdates()
    }
    var numbers:[Int]=[]
    var index:[IndexPath] = []
    init() {
        for item in 0..<5{
            numbers.append(item)
        }
    }
    func getNumbersCount()->Int{
        return numbers.count
    }
    func removeAll(mainTableView:UITableView){
        index.removeAll()
        for item in 0..<5{
            index.append(IndexPath(row: item, section: 0))
            numbers.removeAll()
        }
        mainTableView.beginUpdates()
        mainTableView.deleteRows(at: index, with: .automatic)
        mainTableView.endUpdates()
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
 
}
