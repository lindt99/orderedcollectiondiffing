//
//  ViewController.swift
//  diffRed
//
//  Created by 本田彩 on 2020/10/19.
//  Copyright © 2020 本田彩. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var textLabel: UILabel!
    
    @IBAction func startButton(_ sender: UIButton){
        let modelarr:[String] = ["Hello", "world", "is", "the", "first", "step", "to", "coding",]
        let voicestr = "Hello word is is was the first step to coating"
        let voicearr:[String] = voicestr.components(separatedBy: " ")
        
        let voicearrlength = voicearr.count - 1
        
        //ordered collection diffing
        let diff = voicearr.difference(from: modelarr)
        
        var word:[NSAttributedString] = []
        
        for voicearrword in 0...voicearrlength{
            word.append(NSAttributedString(string: (voicearr[voicearrword])))
            //print("voicearrword: " + String(voicearrword) + "voicearrklen: " + String(voicearrlength) )
        }
        
        print("word:")
        print(word)
        
        //赤文字設定
        let redAttribute:[NSAttributedString.Key:Any]=[
            .foregroundColor: UIColor.red
        ]
        
        //赤文字変更後の文字列
        let coloredString = NSMutableAttributedString()
        
        for change in diff{
            switch change{
            case .remove(let offset, let element, _):
                print("remove index:" + String(offset) + "word:" + element)
            case .insert(let offset, let element, _):
                //余計な単語を赤文字にする
                word[offset] = NSAttributedString(string:element, attributes: redAttribute)
                print("offset: " + String(offset) + " string:" + element)
            }
            
        }
        
        var space = " "
        for i in 0...voicearrlength{
        coloredString.append(word[i])
        coloredString.append(NSAttributedString(string:space))
        }
        //赤文字変更後をラベルに表示
        textLabel.attributedText = coloredString
        
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

