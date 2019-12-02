//
//  ResultViewController.swift
//  SlideshowApp
//
//  Created by 藤原拓也 on 2019/12/01.
//  Copyright © 2019 takuya.fujihara. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var imageviewNext: UIImageView!
    
    var image:UIImage!

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //imageは上のvarで定義したもの
        let result=image
        //imageviewNextはviewController.swiftでアウトレット接続した時に定義したもの
       imageviewNext.image=image
    
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
