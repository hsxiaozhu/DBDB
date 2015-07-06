//
//  ViewController.swift
//  DBDB
//
//  Created by 大可立青 on 15/7/6.
//  Copyright © 2015年 大可立青. All rights reserved.
//

import UIKit

class ViewController: UIViewController,HttpProtocol {
    
    var eHttp:HTTPController = HTTPController()
    var songData:[JSON] = []
    var channelData:[JSON] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        eHttp.delegate = self
        eHttp.onSearch("http://www.douban.com/j/app/radio/channels")
        eHttp.onSearch("https://douban.fm/j/mine/playlist?type=n&channel=0&from=mainsite")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func didRecieveResults(results: AnyObject) {
        //print(result, appendNewline: false)
        let json = JSON(results)
        if let songs = json["song"].array{
            songData = songs
            print("歌曲数据：\(songData)")
        }else if let channles = json["channels"].array{
            channelData = channles
            print("频道数据：\(channelData)")
        }
    }


}

