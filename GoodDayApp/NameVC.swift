//
//  NameVC.swift
//  GoodDayApp
//
//  Created by myungsun on 2022/03/04.
//

import UIKit

class NameVC: UIViewController {
    // Variables
    let VALID_ACTIVE_HINT = "사용 가능한 멋진 닉네임입니다."
    let VALID_DEACTIVE_HINT = "2글자에서 8글자 사이로 닉네임을 입력해주세요."
    
    // UITextField
    @IBOutlet weak var nameTextField: UITextField!
    
    // UILabel
    @IBOutlet weak var validationLabel: UILabel!
    
    // UIButton
    @IBOutlet weak var nextButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
    }
    
    func initUI() {
        // UITextField
        configureNameTextField()
        
        // UIButton
        configureNextButton()
    }
    
    func configureNextButton() {
        validateNextButton()
        nextButton.layer.cornerRadius = 13
    }
    
    func configureNameTextField() {
        nameTextField.font = UIFont(name: nameTextField.font!.fontName, size: 22)
        nameTextField.addTarget(self, action: #selector(nameTextFieldChange), for: .editingChanged)
        
    }
    
    @objc private func nameTextFieldChange(_ textField: UITextField) {
        validateNextButton()
    }
    
    func makeBottomBorder(borderColor: UIColor) {
        let border = CALayer()
        
        border.frame = CGRect(x: 0, y: nameTextField.frame.size.height - 7 , width: 329, height: 1)
        border.backgroundColor = borderColor.cgColor
        nameTextField.layer.addSublayer(border)
    }
    
    func validateNextButton() {
        // 버튼 활성화 조건
        // nameTextField가 2~8자 사이일 때 활성화
        nextButton.isEnabled = !(nameTextField.text?.isEmpty ?? true) &&
        (nameTextField.text?.count ?? 0 >= 2) &&
        (nameTextField.text?.count ?? 0 <= 8)
        
        // validationLabel.text = nextButton.isEnabled ? VALID_ACTIVE_HINT : VALID_DEACTIVE_HINT
        
        if nextButton.isEnabled {
            // UIButton
//            nextButton.titleLabel?.textColor = ColorManager.shared.getWhite()
//            nextButton.titleLabel?.font = .systemFont(ofSize: 18, weight: .semibold)
            nextButton.backgroundColor = ColorManager.shared.getThemeMain()
            
            // UILabel
            validationLabel.textColor = ColorManager.shared.getThemeMain()
            validationLabel.text = VALID_ACTIVE_HINT
            makeBottomBorder(borderColor: ColorManager.shared.getThemeMain())
        }else {
            // UIButton
            nextButton.backgroundColor = ColorManager.shared.getDisableColor()
            
            // UILabel
            validationLabel.text = VALID_DEACTIVE_HINT
            
            let validColor = nameTextField.text!.isEmpty ? ColorManager.shared.getDisableColor() : .red
            makeBottomBorder(borderColor: validColor)
            validationLabel.textColor = validColor
            
//            if ((nameTextField.text?.isEmpty) ?? true) {
//                makeBottomBorder(borderColor: ColorManager.shared.getDisableColor())
//                validationLabel.textColor = ColorManager.shared.getDisableColor()
//            }else {
//                makeBottomBorder(borderColor: .red)
//                validationLabel.textColor = .red
//            }
        }
            
    }
    
    @IBAction func tapNextButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "InitialSettingViews", bundle: nil)
        let mbtiSettingVC = storyboard.instantiateViewController(withIdentifier: "MbtiSettingVC") as! MbtiSettingVC
        
        mbtiSettingVC.userName = nameTextField.text
        mbtiSettingVC.modalPresentationStyle = .overFullScreen
        mbtiSettingVC.modalTransitionStyle = .crossDissolve
        self.present(mbtiSettingVC, animated: true, completion: nil)
    }
    
    
    
    // 유저가 화면을 터치했을 때 호출되는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 키보드를 내린다.
        self.view.endEditing(true)
    }
    
    


}
