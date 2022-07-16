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
        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "yyyy년 \nMM월 dd일"
        
        let datePickerView = sender
        calcuDateLabelCollection[0].text = myDateFormatter.string(from: datePickerView.date)//여기에 100일이 더해져야됨
        //계산된 결과가 ""의 안에 들어오도록
        
        
        let date = datePickerView.date
        let calendar = Calendar.current
        let component1 = calendar.date(byAdding: .day, value: 99, to: date)
        let component2 = calendar.date(byAdding: .day, value: 199, to: date)
        let component3 = calendar.date(byAdding: .day, value: 299, to: date)
        let component4 = calendar.date(byAdding: .day, value: 399, to: date)
        
        calcuDateLabelCollection[0].text = myDateFormatter.string(from: component1!)
        calcuDateLabelCollection[1].text = myDateFormatter.string(from: component2!)
        calcuDateLabelCollection[2].text = myDateFormatter.string(from: component3!)
        calcuDateLabelCollection[3].text = myDateFormatter.string(from: component4!)
       
    }
    

}

