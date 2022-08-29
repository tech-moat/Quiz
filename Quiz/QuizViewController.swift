//
//  QuizViewController.swift
//  Quiz
//
//  Created by 堀弘昌 on 2022/08/29.
//

import UIKit

class QuizViewController: UIViewController {
    
    var quizArray = [Any]()
    
    var correctAnser: Int = 0
    
    @IBOutlet var quizTextView: UITextView!
    
    @IBOutlet var choiceButton1: UIButton!
    @IBOutlet var choiceButton2: UIButton!
    @IBOutlet var choiceButton3: UIButton!
    @IBOutlet var choiceButton4: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        quizArray.append(["「麻雀」において、子のマンガンは何点でしょう？", "12000点", "8000点", "4000点", "10000点", 2])
        quizArray.append(["「カタン」において、道を作るのに必要な資材は何と何でしょう？", "木とレンガ", "石と木", "羊とレンガ", "木と藁", 1])
        quizArray.append(["「カルカソンヌ」において、修道院は1つにつき最大何点獲得できるでしょう？", "7点", "8点", "9点", "10点", 3])
        quizArray.append(["「テキサスホールデム」において、プリフロップで最初にアクションを行うポジションのことを何というでしょう？", "ハイジャック", "ビッグブラインド", "カットオフ", "アンダーザガン", 4])
        quizArray.append(["「ドミニオン」において、最初の山札に銅貨は何枚入っているでしょう？", "5枚", "6枚", "7枚", "8枚", 3])
        
        quizArray.shuffle()
        
        choiceQuiz()
    }
    
    func choiceQuiz() {
        let tmpArray = quizArray[0] as! [Any]
        
        quizTextView.text = tmpArray[0] as? String
        
        choiceButton1.setTitle(tmpArray[1] as? String, for: .normal)
        choiceButton2.setTitle(tmpArray[2] as? String, for: .normal)
        choiceButton3.setTitle(tmpArray[3] as? String, for: .normal)
        choiceButton4.setTitle(tmpArray[4] as? String, for: .normal)
    }
    
    func performSegueToResult() {
        performSegue(withIdentifier: "toResultView", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toResultView" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.correctAnswer = self.correctAnser
        }
    }

    @IBAction func choiceAnswer(sender: UIButton) {
        let tmpArray = quizArray[0] as! [Any]
        
        if tmpArray[5] as! Int == sender.tag {
            correctAnser = correctAnser + 1
        }
        
        quizArray.remove(at: 0)
        
        if quizArray.count == 0 {
            performSegueToResult()
        }
        else {
            choiceQuiz()
        }
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
