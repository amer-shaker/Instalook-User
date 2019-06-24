//
//  SalonServicesTableViewController.swift
//  Instalook-User
//
//  Created by jets on 6/23/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import UIKit

class SalonServicesTableViewController: UITableViewController {
    var salonServices = [SalonService]()
    var flage:Int = 0
    var bookingviewDeleget:BookingViewDeleget!

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    func startAnimating()
    {
        indicator.startAnimating()
    }
    func stopAnimating()
    {
        indicator.stopAnimating()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return salonServices.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell", for: indexPath) as? UITableViewCell
        
        let serviceNameLabel:UILabel = cell!.viewWithTag(1) as! UILabel
        let serviceTypeLabel:UILabel = cell!.viewWithTag(2) as! UILabel
        let servicePriceLabel:UILabel = cell!.viewWithTag(3) as! UILabel
        
        serviceNameLabel.text = salonServices[indexPath.row].serviceName
        serviceTypeLabel.text = salonServices[indexPath.row].serviceType
        servicePriceLabel.text = "\(salonServices[indexPath.row].servicePrice!)"


        


       // cell.textLabel?.text = array[indexPath.row]

        // Configure the cell...

        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if flage != 0 {
            bookingviewDeleget.showServiceName(name: salonServices[indexPath.row].serviceName!)
            bookingviewDeleget.getIndexOfSalonService(index: indexPath.row)
            navigationController?.popViewController(animated: false)
        }
    }
}
