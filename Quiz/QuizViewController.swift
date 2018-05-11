//
//  QuizViewController.swift
//  Quiz
//
//  Created by MauTsujimura on 2018/01/07.
//  Copyright © 2018年 MauTsujimura. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizArray = [Any]()
    
    var correctAnswer: Int = 0
    
    @IBOutlet var quizTextView: UITextView!
    
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
    var tmpArray = [Any]()
        
    tmpArray.append(["グミの人気ランキング1位はどれ？","つぶグミ","フェットチーネグミ","果汁グミ",3])
    tmpArray.append(["ガムの人気ランキング1位はどれ？","オレンジフーセンガム","Fits(グレープ)","XYLISH",1])
    tmpArray.append(["クッキーの人気ランキング1位はどれ？","カントリーマアム","オレオ","ムーンライト",1])
    tmpArray.append(["チョコの人気ランキング1位はどれ？","MeltyKiss","乳酸菌ショコラ","クランキー",2])
    tmpArray.append(["チップスの人気ランキング1位はどれ？","じゃがりこ(サラダ)","ポテトチップス(のり塩)","チップスター(うすしお)",1])
    tmpArray.append(["アイスの人気ランキング1位はどれ？","パピコ(チョココーヒー)","クーリッシュ(バニラ)","チョコモナカジャンボ",3])
        
    while (tmpArray.count > 0) {
        let index = Int(arc4random()) % tmpArray.count
        quizArray.append(tmpArray[index])
        tmpArray.remove(at: index)
        
        }
        choiceQuiz()
    }
    
    func choiceQuiz(){
        
        let tmpArray = quizArray[0] as! [Any]
        quizTextView.text = tmpArray[0] as! String
        
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
    }
    
    @IBAction func choiceAnswer(sender: UIButton) {
        
        let tmpArray = quizArray[0] as! [Any]
        
        if tmpArray[4] as! Int == sender.tag{
            
            correctAnswer = correctAnswer + 1
        }
        quizArray.remove(at: 0)
        
        if quizArray.count == 0 {
            performSegueToResult()
        } else {
            choiceQuiz()
        }
        
    }
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnswer
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
