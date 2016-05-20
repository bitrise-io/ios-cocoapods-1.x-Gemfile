//
//  DetailViewController.swift
//  CocoaPods1X
//
//  Created by Viktor Benei on 20/05/16.
//  Copyright © 2016 bitrise. All rights reserved.
//

import UIKit
import Alamofire

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    var detailItem: AnyObject? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    
    @IBAction func testButtonTouch(sender: AnyObject) {
        debugPrint("-- TEST button")
        
        Alamofire.request(.GET, "https://httpbin.org/get")
            .validate()
            .responseJSON { response in
                debugPrint(response)
        }
    }

    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let label = self.detailDescriptionLabel {
                label.text = detail.valueForKey("timeStamp")!.description
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

