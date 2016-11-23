//
//  ViewController.swift
//  swift-BaseMethod
//
//  Created by CK on 2016/11/23.
//  Copyright © 2016年 CK. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    @IBOutlet weak var RandomNumLabel: UILabel!
    @IBOutlet weak var SortedNumLabel: UILabel!
    @IBOutlet weak var RandomButton: UIButton!
    @IBOutlet weak var SortButton: UIButton!
    @IBOutlet weak var countOfNumber: UITextField!
    
    var rnCount: Int = 0
    var rnArr = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func RandomAction(_ sender: UIButton) {
        rnArr = [Int]()
        rnCount = Int(countOfNumber.text!)!
        randomFunc(rnCount == 0 ? 10 : rnCount)
        showArr(label: RandomNumLabel)
    }
    
    func randomFunc(_ count: Int){
        for i in 0...count - 1 {
            var TF = true   //表示重覆
            var temp = Int(arc4random_uniform(UInt32(count)))
            while TF == true && i > 0 {
                TF = false
                for j in 0...i - 1 {
                    if rnArr[j] == temp{
                        TF = true
                        temp = Int(arc4random_uniform(UInt32(count)))
                        break
                    }
                }
            }
            rnArr.append(temp)
        }
    }

    @IBAction func SortAction(_ sender: UIButton) {
        rnArr.count != 0 ? BBSort() : randomFunc(rnCount == 0 ? 10 : rnCount)
        
    }
    
    func BBSort(){
        for i in 0...rnArr.count - 1 {
            for j in 0...i{
                
                if rnArr[i] > rnArr[j] {
                    swap(a: &rnArr[i], b: &rnArr[j])
                }
            }
        }
        showArr(label: SortedNumLabel)
    }
    
    func swap(a: inout Int, b: inout Int){
        var temp:Int
        temp = a
        a = b
        b = temp
    
    }
    
    func showArr(label: UILabel){
        label.text = ""
        for i in rnArr{
            label.text?.append("\(i), ")
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

