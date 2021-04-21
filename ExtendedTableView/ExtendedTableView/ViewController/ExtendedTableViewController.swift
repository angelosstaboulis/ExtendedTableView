//
//  ExtendedTableViewController.swift
//  ExtendedTableView
//
//  Created by Angelos Staboulis on 20/4/21.
//

import UIKit

class ExtendedTableViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    @IBOutlet var mainTableView: UITableView!
    var numbers:[Int]=[]
    var extended:ExtendedTableView!
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
        return extended.getNumbers()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(50.0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:ExtendedCell = tableView.dequeueReusableCell(withIdentifier: "cell") as! ExtendedCell
        return setupCell(cell: cell, indexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
    
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        extended.insertRow(mainTableView: tableView, indexPath: indexPath)
    }
    
    func setupCell(cell:ExtendedCell,indexPath:IndexPath)->ExtendedCell{
        let extendedCell = cell
        extendedCell.accessoryType = .checkmark
        if indexPath.row < extended.getNumbers() {
            extendedCell.lblDescription.text = String(extended.numbers[indexPath.row])
        }
        return extendedCell
    }
}
