//
//  ViewController.swift
//  NewAnniversaryProject
//
//  Created by Carki on 2022/07/16.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet var dDayLabelCollection: [UILabel]!
    @IBOutlet weak var standardDateLabel: UILabel!
    @IBOutlet var calcuDateLabelCollection: [UILabel]!
    @IBOutlet var imageViewCollection: [UIImageView]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nowDate(pickLabel: standardDateLabel)
        datePicker.datePickerMode = .date
        if #available(iOS 14.0, *) {
            datePicker.preferredDatePickerStyle = .inline
        }else {
            datePicker.preferredDatePickerStyle = .wheels
        }
        dDayDesign(dDay: dDayLabelCollection)
        imageViewDesign(imageView: imageViewCollection)
        calDateDesign(dateLabel: calcuDateLabelCollection)
        standardLabelDesign(dateLabel: standardDateLabel)
        
    }
    
    func nowDate(pickLabel: UILabel) {
        let now = Date()
        let nowDataFormatter = DateFormatter()
        nowDataFormatter.dateFormat = "yyyy년 MM월 dd일"
        let realDate = "현재날짜: " + nowDataFormatter.string(from: now)
        
        pickLabel.text = realDate
        
    }
    func standardLabelDesign(dateLabel: UILabel) {
        dateLabel.font = .boldSystemFont(ofSize: 10)
    }

    func dDayDesign(dDay: [UILabel]) {
        let dateArr = ["D+100", "D+200", "D+300", "D+400"]
        let count: Int = dateArr.count
        
        for i in 0...(count - 1) {
            dDay[i].text = "\(dateArr[i])"
            dDay[i].font = .boldSystemFont(ofSize: 24)
            dDay[i].textColor = .white
        }
    }
    
    func imageViewDesign(imageView: [UIImageView]) {
        let count: Int = imageView.count
        
        for i in 0...(count - 1) {
            imageView[i].layer.cornerRadius = 10
            imageView[i].clipsToBounds = true
        }
    }
    
    func calDateDesign(dateLabel: [UILabel]) {
        let count: Int = dateLabel.count
        
        for i in 0...(count - 1) {
            dateLabel[i].textColor = .white
        }
    }
    
    @IBAction func datePickAction(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        let formatter2 = DateFormatter()
        formatter.dateFormat = "yyyy년 \nMM월 dd일"
        formatter2.dateFormat = "yyyy년 MM월 dd일"
        
        standardDateLabel.text = "선택날짜: " + formatter2.string(from: datePickerView.date)
        
        
    }
    

}

