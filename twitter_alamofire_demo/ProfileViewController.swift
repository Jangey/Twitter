//
//  ProfileViewController.swift
//  twitter_alamofire_demo
//
//  Created by Jangey Lu on 10/6/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var backgroundPicture: UIImageView!
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var screenname: UILabel!
    
    @IBOutlet weak var tweetCount: UILabel!
    @IBOutlet weak var followingCount: UILabel!
    @IBOutlet weak var followerCount: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        backgroundPicture.af_setImage(withURL: (User.current?.backgroundURLPath)!)
        profilePicture.af_setImage(withURL: (User.current?.profileURLPath)!)
        username.text = User.current?.name
        screenname.text = "@\(User.current!.screenname)"
        tweetCount.text = String(User.current!.tweets!)
        followingCount.text = String(User.current!.following!)
        followerCount.text = String(User.current!.followers!)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
