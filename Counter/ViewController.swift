//
//  ViewController.swift
//  Counter
//
//  Created by Andrey Ulanov on 14.04.2023.
//

import UIKit

class ViewController: UIViewController {

    var counter = 0
    
    func getFormattedDate() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy HH:mm"
        return dateFormatter.string(from: date)
    }
    
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var plusButtonView: UIButton!
    @IBOutlet weak var counterLabelView: UILabel!
    
    @IBAction func handleReset(_ sender: UIButton) {
        counter = 0
        counterLabelView.text = "Значение счетчика: \(counter)"
        historyTextView.text.insert(contentsOf: "\n\(getFormattedDate()): значение сброшено",
                                    at: historyTextView.text.index(historyTextView.text.startIndex,
                                                                   offsetBy: 17)
        )
    }
    
    @IBAction func handleMinus(_ sender: UIButton) {
        if counter > 0 {
            counter -= 1
            counterLabelView.text = "Значение счетчика: \(counter)"
            historyTextView.text.insert(contentsOf: "\n\(getFormattedDate()): значение изменено на -1",
                                        at: historyTextView.text.index(historyTextView.text.startIndex,
                                                                       offsetBy: 17)
            )
        } else {
            historyTextView.text.insert(contentsOf: "\n\(getFormattedDate()): попытка уменьшить значение счётчика ниже 0",
                                        at: historyTextView.text.index(historyTextView.text.startIndex,
                                                                       offsetBy: 17)
            )
        }
    }
    
    @IBAction func handlePlus(_ sender: UIButton) {
        counter += 1
        counterLabelView.text = "Значение счетчика: \(counter)"
        historyTextView.text.insert(contentsOf: "\n\(getFormattedDate()): значение изменено на +1",
                                    at: historyTextView.text.index(historyTextView.text.startIndex,
                                                                   offsetBy: 17)
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

