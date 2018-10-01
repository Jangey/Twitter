//
//  TweetCell.swift
//  twitter_alamofire_demo
//
//  Created by Jangey Lu on 10/1/18.
//  Copyright © 2018 Charles Hieger. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class TweetCell: UITableViewCell {
    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var selectedIcon: UIImageView!
    @IBOutlet weak var screenname: UILabel!
    @IBOutlet weak var timestamp: UILabel!
    @IBOutlet weak var tweetText: UILabel!
    
    @IBOutlet weak var replyButton: UIButton!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favorButton: UIButton!
    @IBOutlet weak var messageButton: UIButton!
    
    
    @IBOutlet weak var replayCount: UILabel!
    @IBOutlet weak var retweetCount: UILabel!
    @IBOutlet weak var favorCount: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    var tweet: Tweet!{
        didSet{
            tweetText.text = tweet.text
            username.text = tweet.user?.name
            screenname.text = "@\(tweet.user!.screenname) \(tweet.createdAtString!)"
            //            timestamp.text = tweet.createdAtString
            if let cnt = tweet.favoriteCount{
                favorCount.text = String(cnt)
            }
            else{
                favorCount.text = String(0)
            }
            
            if let cnt = tweet.retweetCount{
                retweetCount.text = String(cnt)
            }
            else{
                retweetCount.text = String(0)
            }
            
            profilePicture.af_setImage(withURL: (tweet.user?.profileURLPath)!)
            
        
        }
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
    

    
    //@IBAction func didTapRetweet(_ sender: Any) {
    //}
    
    
}
