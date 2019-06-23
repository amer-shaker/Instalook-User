//
//  SalonBarbersTableViewController.swift
//  Instalook-User
//
//  Created by jets on 6/23/19.
//  Copyright © 2019 Instalook. All rights reserved.
//

import UIKit

class SalonBarbersTableViewController: UITableViewController {
    var barbers = [Barber]()
    var flage:Int = 0
    var bookingviewDeleget:BookingViewDeleget!

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    func startAnimating()
    {
        indicator.startAnimating()
    }
    func stopAnimating()
    {
        indicator.stopAnimating()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
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
        return barbers.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "barbercell", for: indexPath)as! UITableViewCell
        
        
        var barberImageView:UIImageView = cell.viewWithTag(1) as! UIImageView
        var barberNameLabel:UILabel = cell.viewWithTag(2) as! UILabel
        var isAvailableLumb:UILabel = cell.viewWithTag(3) as! UILabel
        var isAvailableText:UILabel = cell.viewWithTag(4) as! UILabel
       barberImageView =  Utils.customizeProfileImage(borderImage: 1.0, cornerRedius: barberImageView.frame.height/2,imageView: barberImageView) as! UIImageView
        isAvailableLumb =  Utils.customizeProfileImage(borderImage: 0.0, cornerRedius: isAvailableLumb.frame.height/2,imageView: isAvailableLumb) as! UILabel
        if barbers[indexPath.row].isAvailable == 1 {
            isAvailableLumb.backgroundColor = UIColor.green
            isAvailableText.text = "AVAILABLE"
        }else{
             isAvailableLumb.backgroundColor = UIColor.red
            isAvailableText.text = "NOT AVAILABLE"

        }
        
        
        barberNameLabel.text = barbers[indexPath.row].firstName! + " " + barbers[indexPath.row].lastName!

        // Configure the cell...

        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if flage != 0 {
            bookingviewDeleget.showBarberName(name: barbers[indexPath.row].firstName! + " " + barbers[indexPath.row].lastName!)
            bookingviewDeleget.getIndexOfBarber(index: indexPath.row)
            
            self.navigationController?.popViewController(animated: false)
        }
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
