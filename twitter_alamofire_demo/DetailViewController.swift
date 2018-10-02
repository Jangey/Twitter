//
//  DetailViewController.swift
//  twitter_alamofire_demo
//
//  Created by Jangey Lu on 10/2/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var tweet: Tweet?
    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var selectedIcon: UIImageView!
    @IBOutlet weak var screenname: UILabel!
    @IBOutlet weak var timestamp: UILabel!
    @IBOutlet weak var tweettext: UILabel!
    
    @IBOutlet weak var replyCount: UILabel!
    @IBOutlet weak var retweetCount: UILabel!
    @IBOutlet weak var favorCount: UILabel!
    
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favorButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            
        profilePicture.af_setImage(withURL: (tweet!.user?.profileURLPath)!)
        username.text = tweet!.user?.name
        screenname.text = "@\(tweet!.user!.screenname)"
        timestamp.text = tweet!.createdAtString!
        tweettext.text = tweet!.text
        /*
        if let count = tweet!.favoriteCount{
            favorCount.text = "\(String(count)) FAVORITES"
        }
        else{
            favorCount.text = String(0)
        }
        
        if let count = tweet!.retweetCount{
            retweetCount.text = "\(String(count)) RETWEENS"
        }
        else{
            retweetCount.text = String(0)
        }
        */
        
        navigationItem.title = username.text
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
