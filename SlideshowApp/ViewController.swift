//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 藤原拓也 on 2019/11/28.
//  Copyright © 2019 takuya.fujihara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBAction func unwind(_ segue:UIStoryboardSegue){
        
    }
    //imageViewをアウトレット接続
    @IBOutlet weak var imageview: UIImageView!
    //進むボタンをアウトレット接続
    @IBOutlet weak var nextbottun: UIButton!
    //戻るボタンをアウトレット接続
    @IBOutlet weak var backbottun: UIButton!
    //再生、停止ボタンをアウトレット接続
    @IBOutlet weak var startstopbottun: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    //はじめの画像を０とする
    var image_count=0
    var imageArray=["bird.jpg","cat.jpg","monky.jpg","pig.jpg","puppy.jpg"]
    //進むボタン
    @IBAction func next(_ sender: Any) {
        if (image_count==0){
            image_count=1
            imageview.image=UIImage(named:"bird.jpg")
        }else if (image_count==1){
            image_count=2
            imageview.image=UIImage(named:"cat.jpg")
        }else if (image_count==2){
            image_count=3
            imageview.image=UIImage(named:"monky.jpg")
        }else if (image_count==3){
            image_count=4
            imageview.image=UIImage(named:"pig.jpg")
        }else if (image_count==4){
            image_count=0
            imageview.image=UIImage(named:"puppy.jpg")
        }
        
        print(image_count)
        
        
    }
    //戻るボタン
    @IBAction func back(_ sender: Any) {
        if (image_count==0){
            image_count=4
            imageview.image=UIImage(named:"pig.jpg")
        }else if (image_count==4){
            image_count=3
            imageview.image=UIImage(named:"monky.jpg")
        }else if (image_count==3){
            image_count=2
            imageview.image=UIImage(named:"cat.jpg")
        }else if (image_count==2){
            image_count=1
            imageview.image=UIImage(named:"bird.jpg")
        }else if (image_count==1){
            image_count=0
            imageview.image=UIImage(named:"puppy.jpg")
        }
        print(image_count)
    }
    
    //タイマー
    var timer:Timer!
    //タイマー用の時間ための変数
    var timer_sec: Float=0
    //タイマーを設定（2.0秒ごと）
    @objc func updateTimer(_ timer:Timer){
        self.timer_sec+=2.0
        if (image_count==0){
            image_count=1
            imageview.image=UIImage(named:"bird.jpg")
        }else if (image_count==1){
            image_count=2
            imageview.image=UIImage(named:"cat.jpg")
        }else if (image_count==2){
            image_count=3
            imageview.image=UIImage(named:"monky.jpg")
        }else if (image_count==3){
            image_count=4
            imageview.image=UIImage(named:"pig.jpg")
        }else if (image_count==4){
            image_count=0
            imageview.image=UIImage(named:"puppy.jpg")
        }
        
        print(image_count)
        
        
    }
    //再生と停止ボタン
    @IBAction func startstop(_ sender: Any) {
        //2秒で進むように設定
        if self.timer == nil { self.timer=Timer.scheduledTimer(timeInterval:2.0,target:self,selector:#selector(updateTimer(_:)),userInfo:nil,repeats:true)
            //再生、停止ボタンタップ時に進む、戻るボタン非表示
            nextbottun.isEnabled=false
            backbottun.isEnabled=false
        }else if self.timer != nil {
            self.timer.invalidate()
            self.timer=nil
            nextbottun.isEnabled=true
            backbottun.isEnabled=true
            
        }
        
    }
    
    
    
}
