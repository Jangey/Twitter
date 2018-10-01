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
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var selectedIcon: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var timestamp: UILabel!
    @IBOutlet weak var tweetText: UILabel!
    
    @IBOutlet weak var replyIcon: UIImageView!
    @IBOutlet weak var replayCount: UILabel!
    @IBOutlet weak var retweetIcon: UIImageView!
    @IBOutlet weak var retweetCount: UILabel!
    @IBOutlet weak var favorIcon: UIImageView!
    @IBOutlet weak var favorCount: UILabel!
    @IBOutlet weak var messageIcon: UIImageView!
    

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
            screenName.text = "@\(tweet.user!.screenName) \(tweet.createdAtString!)"
            //            timestamp.text = tweet.createdAtString
            if let cnt = tweet.favoriteCount{
                favorCount.text = String(cnt)
            }
            else{
                favorCount.text = String(0)
            }
            /*
            if let cnt = tweet.retweetCount{
                retweetCount.text = String(cnt)
            }
            else{
                retweetCount.text = String(0)
            }
            */
            profilePicture.af_setImage(withURL: (tweet.user?.profileURLPath)!)
            
        
        }
    }

}
