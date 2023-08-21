//
//  Date+Helper.swift
//  WhatsAppDemo2
//
//  Created by 雷子康 on 2023/8/18.
//

import Foundation

/// 用于判断日期的函数

extension Date {
    func descriptiveSpring(dateStyle: DateFormatter.Style = .short) -> String {
        
        let formatter = DateFormatter()
        formatter.dateStyle = dateStyle
        
        let daysBetween = self.daysBetween(date: Date())
        
        if daysBetween == 0 {
            return "Today"
        }
        else if daysBetween < 5 {
            let weekdaysIndex = Calendar.current.component(.weekday, from: self) - 1
            return formatter.weekdaySymbols[weekdaysIndex]
        }
        return formatter.string(from: self)
      
    }
    
    func daysBetween(date: Date) -> Int {
        let calendar = Calendar.current
        let date1 = calendar.startOfDay(for: self)
        let date2 = calendar.startOfDay(for: date)
        if let daysBetween = calendar.dateComponents([.day], from: date1, to: date2).day {
            return daysBetween
        }
        return 0
    }
}

