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
    var image_count=0
    var imageArray=["bird.jpg","cat.jpg","monky.jpg","pig.jpg","puppy.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
       if self.timer != nil {
            self.timer.invalidate()
            self.timer=nil
            //スライドショー一時停止の時さ進む、戻るボタン表示
            nextbottun.isEnabled=true
            backbottun.isEnabled=true
        
         startstopbottun.setTitle("再生", for: .normal)
        }
   //segueから遷移先のResultVirwControllerを取得するコード
        let resultViewController:ResultViewController=segue.destination as! ResultViewController
        //imageview.imageは進む、戻るボタンのif内の＝から持ってきたもの
        resultViewController.image=imageview.image!
    }
   
    
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
         //ボタン名を停止とする
            startstopbottun.setTitle("一時停止", for: .normal)
            
        }else if self.timer != nil {
            self.timer.invalidate()
            self.timer=nil
            //スライドショー一時停止の時さ進む、戻るボタン表示
            nextbottun.isEnabled=true
            backbottun.isEnabled=true
            //ボタン名を再生とする
            //startstopbottunはアウトレット接続した時に定義したもの
            startstopbottun.setTitle("再生", for: .normal)
            
            
        }
        
    }
    
    
    
}
