//
//  SearchSalonsTableViewController.swift
//  Instalook-User
//
//  Created by jets on 5/23/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import UIKit

class SearchSalonsTableViewController: UITableViewController, SearchView {
    
    var dumyNameArray = ["bbbb","bbbb"]
    var dumyAddressArray = ["BBB","BBB"]
    var presenter : SearchPreseneter!
    
    func showIndicator()
    {
        
    }
    func hideIndicator(){
    }
    
    func fetchingDataSuccess(salon : Salon){
        
    }
    
    func showname(name: String){
        
    }
    
    func showError(error: String){}
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //********
                //********
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 118
        presenter = SearchPreseneter(view: self)
        // presenter.returnData()
        
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dumyNameArray.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SalonTableViewCell", for: indexPath) as! SalonCellTableViewCell
        cell.salonName.text = dumyNameArray[indexPath.row]
        cell.salonAddress.text = dumyAddressArray[indexPath.row]
        // presenter.showname(cell: cell, index: indexPath.row)
        
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
     // Delete the row from the data source
     tableView.deleteRows(at: [indexPath], with: .fade)
     } else if editingStyle == .insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
