//
//  ViewController.swift
//  AVPlayerRadio
//
//  Created by Артём Кармазь on 7/10/19.
//  Copyright © 2019 Артём Кармазь. All rights reserved.
//

import UIKit
import AVFoundation
import Alamofire
import AVKit

class ViewController: UIViewController {
    
    final private let audioUrl = URL(string: "https://audd.tech/example1.mp3")
    final private let videoUrl = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //        AVPlayer(url: audioUrl!).play()
        //        videoPlay()
        appleVideo()
    }
    
    private func videoPlay() {
        let player = AVPlayer(url: videoUrl!)
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.view.bounds
        view.layer.addSublayer(playerLayer)
        player.play()
        print(player.currentTime())
    }
    
    private func appleVideo() {
        
        guard let myUrl = URL(string: "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8") else { return }
        let player = AVPlayer(url: myUrl)
        
        let controller = AVPlayerViewController()
        
        controller.player = player
        present(controller, animated: true) {
            player.play()
            print("poeqjklqwjeklqwlejnqjweq")
        }
        
        
    }
    
    private func getRadioWithAlamo() {
        
    }
}
