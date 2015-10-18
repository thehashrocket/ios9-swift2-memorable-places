//
//  LocationViewController.swift
//  memorable-places
//
//  Created by Jason Shultz on 10/18/15.
//  Copyright © 2015 HashRocket. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        titleLabel.text = places[activePlace]["name"]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}