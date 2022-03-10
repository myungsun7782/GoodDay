//
//  TimeManager.swift
//  GoodDayApp
//
//  Created by myungsun on 2022/03/04.
//

import Foundation
import SwiftDate

class TimeManager {
    static let shared = TimeManager()
    
    private init() {}
    
    func dateToHourMinString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: date)
    }
}
