//
//  ViewController.swift
//  PragmaticTweets
//
//  Created by Chris Adamson on 10/19/14.
//  Copyright (c) 2014 Pragmatic Programmers, LLC. All rights reserved.
//

import UIKit
import Social

public class ViewController: UIViewController {
	
  @IBOutlet public weak var twitterWebView: UIWebView!
	
  override public func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
		self.reloadTweets()
  }
  
  override public func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
	

 @IBAction func handleTweetButtonTapped(sender: UIButton) {
    if SLComposeViewController.isAvailableForServiceType(SLServiceTypeTwitter) {
      let tweetVC = SLComposeViewController (forServiceType: SLServiceTypeTwitter)
			let message = NSLocalizedString(
				"I just finished the first project in iOS 8 SDK Development. #pragsios8",
				comment:"")
				tweetVC.setInitialText(message)
			self.presentViewController(tweetVC, animated: true, completion: nil)
    } else {
      println ("Can't send tweet")
    }
  }

	@IBAction func handleShowMyTweetsButtonTapped(sender : UIButton) {
		self.reloadTweets()
	}
	
	func reloadTweets() {
		let url = NSURL (string:"http://www.twitter.com/pragprog")
		let urlRequest = NSURLRequest (URL: url!)
		self.twitterWebView.loadRequest(urlRequest)
	}

	
	
}

