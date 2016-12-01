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
        //randomFunc(rnCount == 0 ? 10 : rnCount)
        theFastRandomNumber(rnCount == 0 ? 10 : rnCount)
        showArr(label: RandomNumLabel)
    }
    //亂數取值不重覆改良版
    func theFastRandomNumber(_ count :Int){
        var array = [count]
        //首先做出0~count的陣列
        for i in 0...count - 1 {
            array.append(i)
        }
        //取值, 刪值
        while rnArr.count != count {
            var catchNum = Int(arc4random_uniform(UInt32(array.count)))
            rnArr.append(array[catchNum])
            array.remove(at: catchNum)
        }
    }
    
    
//    func randomFunc(_ count: Int){
//        for i in 0...count - 1 {
//            var TF = true   //表示重覆
//            var temp = Int(arc4random_uniform(UInt32(count)))
//            while TF == true && i > 0 {
//                TF = false
//                for j in 0...i - 1 {
//                    if rnArr[j] == temp{
//                        TF = true
//                        temp = Int(arc4random_uniform(UInt32(count)))
//                        break
//                    }
//                }
//            }
//            rnArr.append(temp)
//        }
//    }
    
    @IBAction func SortAction(_ sender: UIButton) {
        //rnArr.count != 0 ? BBSort() : randomFunc(rnCount == 0 ? 10 : rnCount)
        rnArr.count != 0 ? BBSort() : theFastRandomNumber(rnCount == 0 ? 10 : rnCount)
    }
    //排序方法
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
    //交換方法
    func swap(a: inout Int, b: inout Int){
        var temp:Int
        temp = a
        a = b
        b = temp
    
    }
    //顯示方法
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

