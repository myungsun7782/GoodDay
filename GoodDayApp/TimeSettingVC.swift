//
//  TimeSettingVC.swift
//  GoodDayApp
//
//  Created by myungsun on 2022/03/07.
//

import UIKit

class TimeSettingVC: UIViewController {

    // UIButton
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var finishButton: UIButton!
    
    // UITextField
    @IBOutlet weak var wakeUpTimeTextField: UITextField!
    @IBOutlet weak var sleepTimeTextField: UITextField!
    
    // UIDatePicker
    var wakeUpTimePicker: UIDatePicker!
    var sleepTimePicker: UIDatePicker!
    
    // Variables
    var userName: String!
    var mbti: String!
    var wakeUpTime: Date!
    var sleepTime: Date!
    let userUid = UUID().uuidString
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI(){
        // UIButton
        configureFinishButton()
        validateFinishButton()
        
        // UIDatePicker
        configureTimePickers()
        
        // UITextField
        configureTimeTextFields()
        
    
    }
    
    func configureTimeTextFields(){
        wakeUpTimeTextField.addTarget(self, action: #selector(DidtextFieldChange(_:)), for: .editingChanged)
        sleepTimeTextField.addTarget(self, action: #selector(DidtextFieldChange(_:)), for: .editingChanged)
        
        wakeUpTimeTextField.font = FontManager.shared.getNanumSquareB(fontSize: 35)
        sleepTimeTextField.font = FontManager.shared.getNanumSquareB(fontSize: 35)
        
        wakeUpTimeTextField.textColor = ColorManager.shared.getTimeTextFieldColor()
        sleepTimeTextField.textColor = ColorManager.shared.getTimeTextFieldColor()
        
        wakeUpTimeTextField.textAlignment = .center
        sleepTimeTextField.textAlignment = .center
        
        wakeUpTimeTextField.inputView = wakeUpTimePicker
        sleepTimeTextField.inputView = sleepTimePicker
    }
    
    @objc private func DidtextFieldChange(_ textField: UITextField){
         validateFinishButton()
    }
    
    
    func configureFinishButton(){
        finishButton.layer.cornerRadius = 13
    }
    
    func configureTimePickers(){
        configureWakeUpTimePicker()
        configureSleepTimePicker()
    }
    
    func configureWakeUpTimePicker(){
        wakeUpTimePicker = UIDatePicker()
        
        wakeUpTimePicker.datePickerMode = .time
        wakeUpTimePicker.preferredDatePickerStyle = .wheels
        wakeUpTimePicker.addTarget(self, action: #selector(didWakeUpTimePickerValueChange(_:)), for: .valueChanged)
        
    }
    
    func configureSleepTimePicker(){
        sleepTimePicker = UIDatePicker()
        
        sleepTimePicker.datePickerMode = .time
        sleepTimePicker.preferredDatePickerStyle = .wheels
        sleepTimePicker.addTarget(self, action: #selector(didSleepTimePickerValueChange(_:)), for: .valueChanged)
    }
    
    @objc func didWakeUpTimePickerValueChange(_ timePicker: UIDatePicker){
        wakeUpTime = wakeUpTimePicker.date
        wakeUpTimeTextField.text = TimeManager.shared.dateToHourMinString(date: wakeUpTimePicker.date)
        wakeUpTimeTextField.sendActions(for: .editingChanged)
    }
    
    @objc func didSleepTimePickerValueChange(_ timePicker: UIDatePicker){
        sleepTime = sleepTimePicker.date
        sleepTimeTextField.text = TimeManager.shared.dateToHourMinString(date: sleepTimePicker.date)
        sleepTimeTextField.sendActions(for: .editingChanged)
    }
    

    
    func validateFinishButton(){
        finishButton.isEnabled = !(wakeUpTimeTextField.text?.isEmpty ?? true) &&
        !(sleepTimeTextField.text?.isEmpty ?? true)
//        finishButton.titleLabel?.font = FontManager.shared.getNanumSquareEB(fontSize: 20)
        
        if finishButton.isEnabled {
            finishButton.titleLabel?.textColor = ColorManager.shared.getWhite()
            finishButton.backgroundColor = ColorManager.shared.getThemeMain()
        }else{
            finishButton.backgroundColor = ColorManager.shared.getDisableColor()
        }
    }
    
  
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func tapFinishButton(_ sender: UIButton) {
        
    }
    
    
    // 유저가 화면을 터치했을 때 호출되는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 키보드를 내린다.
        self.view.endEditing(true)
    }
}
