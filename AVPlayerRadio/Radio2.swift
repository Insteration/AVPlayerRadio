//
//  Radio2.swift
//  AVPlayerRadio
//
//  Created by Артём Кармазь on 7/11/19.
//  Copyright © 2019 Артём Кармазь. All rights reserved.
//

import UIKit
//import AVFoundation
import AVKit
import Alamofire

class Radio: UIViewController {
    let rabbitPath = "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4"
    let urlWatch = "https://devstreaming-cdn.apple.com/videos/streaming/examples/bipbop_adv_example_hevc/master.m3u8"
    let urlFM = "http://main.inf.fm:9103"
    
    
    static var player = AVPlayer()
    
    let myButton: UIButton = {
        let button = UIButton()
        button.frame = CGRect(x: 30, y: 30, width: 40, height: 40)
        button.setTitle("GO!", for: .normal)
        button.titleLabel?.textColor = .red
        button.backgroundColor = .green
        
        button.addTarget(self, action: #selector(getAlamoFire), for: .touchDown)
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(myButton)
        //        getRabbitInNora()
        getController()
        
    }
    
    
    func getRabbitInNora() {
        guard let rabbitUrl = URL(string: rabbitPath) else {print("error URL"); return}
        let player = AVPlayer(url: rabbitUrl)
        print("player = \(player.description)")
        let layer = AVPlayerLayer(player: player)
        
        layer.frame = self.view.bounds
        self.view.layer.addSublayer(layer)
        player.play()
        
    }
    
    @objc func getController() {
        
        guard URL(string: urlFM) != nil else { return }
        
        Radio.player = AVPlayer(url: URL(string: urlFM)!)
        
        //        let playerLayer = AVPlayerLayer(player: player)
        //        playerLayer.frame = self.view.bounds
        //        self.view.layer.addSublayer(playerLayer)
        
        let controller = AVPlayerViewController()
        controller.player = Radio.player
        
        present(controller, animated: true) {
            Radio.player.play()
        }
        
    }
    
    @objc func getAlamoFire() {
        
        let informator = AVPlayer(url: URL(string: "http://main.inf.fm:9103")!)
        informator.play()
        
    }
}
