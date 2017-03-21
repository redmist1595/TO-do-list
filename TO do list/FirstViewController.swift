//
//  FirstViewController.swift
//  TO do list
//
//  Created by Abhinav Paliwal on 2/8/17.
//  Copyright © 2017 Abhinav Paliwal. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet var table: UITableView!
    
    var items: [String] = []

    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items.count
        
    }
    
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    
    {
        var cellLabel = " "
        
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "Cell")
        
        
        if let tempLabel = items[indexPath.row] as? String
        {
            
            cellLabel = tempLabel
        }
        
        cell.textLabel?.text = cellLabel
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    
    
        
        }
    
    override func viewDidAppear(_ animated: Bool)
    
    {
        let itemsObject = UserDefaults.standard.object(forKey: "items")
        
        
        
        if let tempitems = itemsObject as? [String]
        {
            
            
            items = tempitems
            
            }

        table.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete
        
        
            {
             items.remove(at: indexPath.row)
                
                table.reloadData()
                
                UserDefaults.standard.set(items, forKey: "items")
                
            }
    }
    
    
  /*  override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete {
            numbers.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    
    */
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

