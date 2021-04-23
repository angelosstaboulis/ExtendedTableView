//
//  ExtendedTableViewController.swift
//  ExtendedTableView
//
//  Created by Angelos Staboulis on 20/4/21.
//

import UIKit
protocol TableProtocol:AnyObject{
    func setupView()
    func setupCell(cell:ExtendedCell,indexPath:IndexPath)->ExtendedCell
}
class ExtendedTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    @IBOutlet var mainTableView: UITableView!
    var extended:ExtendedTableView!
    var isExpanded:Bool!=false
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
extension ExtendedTableViewController{
    func setupView(){
        mainTableView.dataSource = self
        mainTableView.delegate = self
        mainTableView.register(UINib(nibName: "ExtendedCell", bundle: nil), forCellReuseIdentifier: "cell")
        extended = ExtendedTableView.init()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return extended.getNumbersCount()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50.0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ExtendedCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ExtendedCell
        return setupCell(cell: cell, indexPath: indexPath)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isExpanded {
            extended.collapseRows(mainTableView: tableView, indexPath: indexPath)
            isExpanded = false
            
        }
        else{
            extended.expandRows(mainTableView: tableView, indexPath: indexPath)
            isExpanded = true
        }
    }
    
    func setupCell(cell:ExtendedCell,indexPath:IndexPath)->ExtendedCell{
        let extendedCell = cell
        if indexPath.row < extended.getNumbersCount() || isExpanded {
            extendedCell.lblDescription.text = String(extended.numbers[indexPath.row])
            extendedCell.lblDescription.textColor = .white
        }
        else{
            extendedCell.lblDescription.text = String(extended.numbers[indexPath.row])
            extendedCell.lblDescription.textColor = .white
        }
        return extendedCell
    }
}
