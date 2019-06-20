//
//  ReservationsTVController.swift
//  Instalook-User
//
//  Created by jets on 5/29/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import UIKit

class ReservationsTVController: UITableViewController, ReservationView {
    var reservationPresenter: ReservationPresenter?
    let loadingView = UIView()
    let spinner = UIActivityIndicatorView()
    let loadingLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
         reservationPresenter = ReservationPresenter(reservationView: self)
        
    }

    override func viewWillAppear(_ animated: Bool) {
        print("view will appear")
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       // print("number of in cell : \(reservationPresenter?.getReservationsCount())")
      return (reservationPresenter?.getReservationsCount())!
        
        
    }

   
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reservationCell", for: indexPath) as! ReservationCell
       reservationPresenter?.configureCell(reservationCell: cell, index: indexPath.row)
       return cell
        
    }
    
    func showAlert(){}
    func showIndicator(){
        let width: CGFloat = 120
        let height: CGFloat = 30
        let x = (self.tableView.frame.width / 2)
        let y = (self.tableView.frame.height / 2) 
        loadingView.frame = CGRect(x: x, y: y, width: width, height: height)
        
        // Sets loading text
        loadingLabel.textColor = .gray
        loadingLabel.textAlignment = .center
        loadingLabel.text = "Loading..."
        loadingLabel.frame = CGRect(x: 0, y: 0, width: 140, height: 30)
        
        // Sets spinner
        spinner.activityIndicatorViewStyle = .gray
        spinner.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        spinner.startAnimating()
        
        // Adds text and spinner to the view
        loadingView.addSubview(spinner)
        loadingView.addSubview(loadingLabel)
        
        tableView.addSubview(loadingView)
    }
    func hideIndicator(){
        spinner.stopAnimating()
        spinner.isHidden = true
        loadingLabel.isHidden = true
    }
    func reloadViewData() {
        self.tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            reservationPresenter?.cancelReservation(index: indexPath.row)
            reloadViewData()
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
