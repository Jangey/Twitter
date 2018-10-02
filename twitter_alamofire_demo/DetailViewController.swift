//
//  DetailViewController.swift
//  twitter_alamofire_demo
//
//  Created by Jangey Lu on 10/2/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var tweet: Tweet!
    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var selectedIcon: UIImageView!
    @IBOutlet weak var screenname: UILabel!
    @IBOutlet weak var timestamp: UILabel!
    @IBOutlet weak var tweettext: UILabel!
    
    @IBOutlet weak var retweetCount: UILabel!
    @IBOutlet weak var favorCount: UILabel!
    
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favorButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
            
        profilePicture.af_setImage(withURL: (tweet.user?.profileURLPath)!)
        username.text = tweet.user?.name
        screenname.text = "@\(tweet.user!.screenname)"
        timestamp.text = tweet.createdAtString!
        tweettext.text = tweet.text
        
        if let count = tweet.favoriteCount{
            favorCount.text = "\(String(count)) FAVORITES"
        }
        else{
            favorCount.text = String(0)
        }
        
        if let count = tweet.retweetCount{
            retweetCount.text = "\(String(count)) RETWEENS"
        }
        else{
            retweetCount.text = String(0)
        }
        
        
        navigationItem.title = username.text
    }
    

    @IBAction func didTapFavor(_ sender: Any) {
        if(!(tweet.favorited!)){
            let image = UIImage(named: "favor-icon-red")
            favorButton.setImage(image, for: UIControlState.normal)
            tweet.favorited = true
            
            APIManager.shared.favorite(tweet) { (ntweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error favoriting tweet: \(error.localizedDescription)")
                } else if let ntweet = ntweet {
                    print("Successfully favorited the following Tweet")
                    let count = ntweet.favoriteCount!
                    self.favorCount.text = String(count)
                }
            }
        }else {
            let image = UIImage(named: "favor-icon")
            favorButton.setImage(image, for: UIControlState.normal)
            tweet.favorited = false
            APIManager.shared.unfavorite(tweet) { (ntweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error unfavoriting tweet: \(error.localizedDescription)")
                } else if let ntweet = ntweet {
                    print("Successfully unfavorited the following Tweet")
                    let count = ntweet.favoriteCount!
                    self.favorCount.text = String(count)
                }
            }
        }
    }
    
    @IBAction func didTapRetweet(_ sender: Any) {
        if(!(tweet.retweeted)){
            let image = UIImage(named: "retweet-icon-green")
            retweetButton.setImage(image, for: UIControlState.normal)
            
            tweet.retweeted = true
            APIManager.shared.retweet(tweet) { (ntweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error retweet tweet: \(error.localizedDescription)")
                } else if let ntweet = ntweet {
                    print("Successfully retweet the following Tweet")
                    let count = ntweet.retweetCount
                    self.retweetCount.text = String(count!)
                }
            }
        }else {
            let image = UIImage(named: "retweet-icon")
            retweetButton.setImage(image, for: UIControlState.normal)
            
            tweet.retweeted = false
            APIManager.shared.unretweet(tweet) { (ntweet: Tweet?, error: Error?) in
                if let  error = error {
                    print("Error unretweet tweet: \(error.localizedDescription)")
                } else if let ntweet = ntweet {
                    print("Successfully unretweet the following Tweet")
                    let count = ntweet.retweetCount
                    self.retweetCount.text = String(count!)
                }
            }
        }
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
