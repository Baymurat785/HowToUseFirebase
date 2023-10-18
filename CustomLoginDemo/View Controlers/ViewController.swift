//
//  ViewController.swift
//  CustomLoginDemo
//
//  Created by Baymurat Abdumuratov on 08/10/23.
//

import UIKit
import AVKit // we should use when we want to work with videos

class ViewController: UIViewController {

    
    var videoPlayer: AVPlayer?
    var videoPlayerLayer: AVPlayerLayer? // manages the visual output
    
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationController?.isNavigationBarHidden = true
        
        setUpElements()
    }
    
    override func viewWillAppear(_ animated: Bool) { // overriding view will appear. I guess You are already famliliar with life cycles
        // set up video in the background
        setUpVideo()
        
    }
    
    func setUpVideo(){
        
        // Get the path to the resource in the bundle
        let bundlePath = Bundle.main.path(forResource: "guess", ofType: "mp4")
        
        
        guard bundlePath != nil else{
            return
        }
        
        //Create a URL from it
        let url = URL(fileURLWithPath: bundlePath!)
        
        
        
        //Create the video player item
        let item = AVPlayerItem(url: url)
        
        //Create the player
        videoPlayer = AVPlayer(playerItem: item)
        
        //Create the layer
        
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        
        //adjust the size and frame
        
       videoPlayerLayer?.frame = CGRect(x: -self.view.frame.size.width*1.5, y: 0, width: self.view.frame.size.width*4, height: self.view.frame.size.height)
        
        //videoPlayerLayer?.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
        
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        
        //Add it to the view and play it
        videoPlayer?.playImmediately(atRate: 0.3)
        
        
        
        
        
        
        
        
        
    }

    func setUpElements() {
        Utilisties.styleFilledButton(signUpButton)
        Utilisties.styleHollowButton(loginButton)
    }
    

}

