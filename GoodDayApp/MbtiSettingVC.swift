//
//  MbtiSettingVC.swift
//  GoodDayApp
//
//  Created by myungsun on 2022/03/05.
//

import UIKit


enum MbtiPosition: Int {
    case first = 0
    case second = 1
    case third = 2
    case fourth = 3
}


class MbtiSettingVC: UIViewController {
    
    // UITextField
    @IBOutlet weak var firstMbtiTextField: UITextField!
    @IBOutlet weak var secondMbtiTextField: UITextField!
    @IBOutlet weak var thirdMbtiTextField: UITextField!
    @IBOutlet weak var fourthMbtiTextField: UITextField!
    
    // UIButton
    @IBOutlet weak var nextButton: UIButton!
    
    // UIPickerView
    var firstMbtiPicker: UIPickerView?
    var secondMbtiPicker: UIPickerView?
    var thirdMbtiPicker: UIPickerView?
    var fourthMbtiPicker: UIPickerView?
    
    // UIBarButtonItem
    var finishButton: UIBarButtonItem!
    
    // UIToolbar
    var toolbar: UIToolbar!

    // Variables
    let FONT_SIZE: CGFloat = 28
    var userName: String!
    var mbti: String!
    var mbtiPosition: MbtiPosition?
    let MBTI_LIST_SIZE = 2
    var mbtiTextFieldList: [UITextField] = []
    let mbtiList = [
        ["E", "I"],
        ["S", "N"],
        ["T", "F"],
        ["J", "P"]
    ]
    let firstMbtiList = ["E", "I"]
    let secondMbtiList = ["S", "N"]
    let thirdMbtiList = ["T", "F"]
    let fourthMbtiList = ["J", "P"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI(){
        // UIButton
        configureNextButton()
        
        // UITextField
        configureMbtiTextFields()
        
        // UIPickerView
        configureMbtiPicker()
        
        // UIBarButton
        configureFinishButton()
        
        // UIToolBar
        configureToolbar()
    }
    
    func configureNextButton(){
        validateNextButton()
        nextButton.layer.cornerRadius = 13
    }
    
    func configureMbtiTextFields() {
        firstMbtiTextField.addTarget(self, action: #selector(beginFirstTextField(_:)), for: .editingDidBegin)
        secondMbtiTextField.addTarget(self, action: #selector(beginSecondTextField(_:)), for: .editingDidBegin)
        thirdMbtiTextField.addTarget(self, action: #selector(beginThirdTextField(_:)), for: .editingDidBegin)
        fourthMbtiTextField.addTarget(self, action: #selector(beginFourthTextField(_:)), for: .editingDidBegin)
        
        firstMbtiTextField.font = UIFont(name: firstMbtiTextField.font!.fontName, size: FONT_SIZE)
        secondMbtiTextField.font = UIFont(name: secondMbtiTextField.font!.fontName, size: FONT_SIZE)
        thirdMbtiTextField.font = UIFont(name: thirdMbtiTextField.font!.fontName, size: FONT_SIZE)
        fourthMbtiTextField.font = UIFont(name: fourthMbtiTextField.font!.fontName, size: FONT_SIZE)
        
        firstMbtiTextField.textAlignment = .center
        secondMbtiTextField.textAlignment = .center
        thirdMbtiTextField.textAlignment = .center
        fourthMbtiTextField.textAlignment = .center
        
        makeBottomBorders()
        
        mbtiTextFieldList.append(firstMbtiTextField)
        mbtiTextFieldList.append(secondMbtiTextField)
        mbtiTextFieldList.append(thirdMbtiTextField)
        mbtiTextFieldList.append(fourthMbtiTextField)
    }
    
    @objc private func beginFirstTextField(_ textField: UITextField) {
        let isEmpty = textField.text?.isEmpty
        if isEmpty! {
            textField.text = "E"
        }
        mbtiPosition = .first
        firstMbtiTextField.inputView = firstMbtiPicker
        firstMbtiTextField.inputAccessoryView = toolbar
        validateNextButton()
    }
    
    @objc private func beginSecondTextField(_ textField: UITextField) {
        let isEmpty = textField.text?.isEmpty
        if isEmpty! {
            textField.text = "S"
        }
        mbtiPosition = .second
        secondMbtiTextField.inputView = secondMbtiPicker
        secondMbtiTextField.inputAccessoryView = toolbar
        validateNextButton()
    }
    
    @objc private func beginThirdTextField(_ textField: UITextField) {
        let isEmpty = textField.text?.isEmpty
        if isEmpty! {
            textField.text = "T"
        }
        mbtiPosition = .third
        thirdMbtiTextField.inputView = thirdMbtiPicker
        thirdMbtiTextField.inputAccessoryView = toolbar
        validateNextButton()
    }
    
    @objc private func beginFourthTextField(_ textField: UITextField){
        let isEmpty = textField.text?.isEmpty
        if isEmpty! {
            textField.text = "J"
        }
        mbtiPosition = .fourth
        fourthMbtiTextField.inputView = fourthMbtiPicker
        fourthMbtiTextField.inputAccessoryView = toolbar
        validateNextButton()
    }
    
    private func makeBottomBorders(){
        let firstBorder = CALayer()
        let secondBorder = CALayer()
        let thirdBorder = CALayer()
        let fourthBorder = CALayer()
        
        firstBorder.frame = CGRect(x: 0, y: self.firstMbtiTextField.frame.size.height - 5, width: firstMbtiTextField.frame.width, height: 1)
        secondBorder.frame = CGRect(x: 0, y: self.secondMbtiTextField.frame.size.height - 5, width: secondMbtiTextField.frame.width, height: 1)
        thirdBorder.frame = CGRect(x: 0, y: self.thirdMbtiTextField.frame.size.height - 5, width: thirdMbtiTextField.frame.width, height: 1)
        fourthBorder.frame = CGRect(x: 0, y: self.fourthMbtiTextField.frame.size.height - 5, width: fourthMbtiTextField.frame.width, height: 1)
        
        firstBorder.backgroundColor = UIColor.black.cgColor
        secondBorder.backgroundColor = UIColor.black.cgColor
        thirdBorder.backgroundColor = UIColor.black.cgColor
        fourthBorder.backgroundColor = UIColor.black.cgColor
        
        firstMbtiTextField.layer.addSublayer(firstBorder)
        secondMbtiTextField.layer.addSublayer(secondBorder)
        thirdMbtiTextField.layer.addSublayer(thirdBorder)
        fourthMbtiTextField.layer.addSublayer(fourthBorder)
    }
    
    func configureMbtiPicker(){
        firstMbtiPicker = UIPickerView()
        secondMbtiPicker = UIPickerView()
        thirdMbtiPicker = UIPickerView()
        fourthMbtiPicker = UIPickerView()
        
        
        firstMbtiPicker?.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.9)
        secondMbtiPicker?.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.9)
        thirdMbtiPicker?.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.9)
        fourthMbtiPicker?.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.9)
        
        firstMbtiPicker?.delegate = self
        firstMbtiPicker?.dataSource = self
        
        secondMbtiPicker?.delegate = self
        secondMbtiPicker?.dataSource = self
        
        thirdMbtiPicker?.delegate = self
        thirdMbtiPicker?.dataSource = self
        
        fourthMbtiPicker?.delegate = self
        fourthMbtiPicker?.dataSource = self
    }
    
    func configureFinishButton() {
        finishButton = UIBarButtonItem()
        finishButton.title = "완료"
        finishButton.target = self
        finishButton.action = #selector(closeMbtiPicker)
    }
    
    @objc func closeMbtiPicker(){
        self.validateNextButton()
        self.view.endEditing(true)
    }
    
    func configureToolbar(){
        toolbar = UIToolbar()
        toolbar.backgroundColor = .white
        toolbar.tintColor = ColorManager.shared.getThemeMain()
        toolbar.frame = CGRect(x: 0, y: 0, width: 0, height: 35)

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        toolbar.setItems([flexSpace, self.finishButton], animated: true)
    }
    
    
    
    
    func validateNextButton() {
        nextButton.isEnabled =
        !(firstMbtiTextField.text?.isEmpty ?? true) &&
        !(secondMbtiTextField.text?.isEmpty ?? true) &&
        !(thirdMbtiTextField.text?.isEmpty ?? true) &&
        !(fourthMbtiTextField.text?.isEmpty ?? true)
    
        // 버튼이 활성화 되어 있는 경우
        if nextButton.isEnabled {
            nextButton.titleLabel?.textColor = ColorManager.shared.getWhite()
            nextButton.backgroundColor = ColorManager.shared.getThemeMain()
        }else {
            nextButton.backgroundColor = ColorManager.shared.getDisableColor()
        }
            
    }
    
    func combineMbti() -> String {
        return firstMbtiTextField.text! + secondMbtiTextField.text! + thirdMbtiTextField.text! + fourthMbtiTextField.text!
    }
    
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func tapNextButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "InitialSettingViews", bundle: nil)
        let timeSettingVC = storyboard.instantiateViewController(withIdentifier: "TimeSettingVC") as! TimeSettingVC
        
        timeSettingVC.userName = userName
        timeSettingVC.mbti = combineMbti()
        timeSettingVC.modalTransitionStyle = .crossDissolve
        timeSettingVC.modalPresentationStyle = .overFullScreen
        self.present(timeSettingVC, animated: true, completion: nil)
    }
    
    // 유저가 화면을 터치했을 때 호출되는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 키보드를 내린다.
        self.view.endEditing(true)
        validateNextButton()
    }



}

extension MbtiSettingVC: UIPickerViewDelegate, UIPickerViewDataSource {
    // 한 뷰에 picker view가 몇 개 담겨져 있는지 반환(여러 picker뷰가 존재하면 가로로 정렬)
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    // pickerView의 선택지의 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return MBTI_LIST_SIZE
    }

    // pickerView에 들어가는 선택지의 값들을 설정
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var pickerTitle: String? = nil
        switch mbtiPosition {
        case .first:
            if row == 0 {
                pickerTitle = firstMbtiList[row] + " (외향형)"
            }else{
                pickerTitle = firstMbtiList[row] + " (내향형)"
            }
        case .second:
            if row == 0 {
                pickerTitle = secondMbtiList[row] + " (감각형)"
            }else {
                pickerTitle = secondMbtiList[row] + " (직관형)"
            }
        case .third:
            if row == 0 {
                pickerTitle = thirdMbtiList[row] + " (사고형)"
            }else {
                pickerTitle = thirdMbtiList[row] + " (감정형)"
            }
        case .fourth:
            if row == 0 {
                pickerTitle = fourthMbtiList[row] + " (판단형)"
            }else {
                pickerTitle = fourthMbtiList[row] + " (인식형)"
            }
        default:
            break
            
        }
        return pickerTitle
    }
    
    // pickerView에서 선택지 값이 선택된 후에 호출
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        // TODO
        mbtiTextFieldList[mbtiPosition!.rawValue].text = mbtiList[mbtiPosition!.rawValue][row]
        
//        switch mbtiPosition {
//        case .first:
//            firstMbtiTextField.text = firstMbtiList[row]
//        case .second:
//            secondMbtiTextField.text = secondMbtiList[row]
//        case .third:
//            thirdMbtiTextField.text = thirdMbtiList[row]
//        case .fourth:
//            fourthMbtiTextField.text = fourthMbtiList[row]
//        default:
//            break
//        }
    }
}

