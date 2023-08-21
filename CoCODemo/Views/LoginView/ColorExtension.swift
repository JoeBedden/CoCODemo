//
//  ColorExtension.swift
//  DateDemo
//
//  Created by 雷子康 on 2023/8/15.
//

import SwiftUI

struct AppColors {
    struct Key: EnvironmentKey {
        static let defaultValue: AppColors = AppColors()
    }
    
    var appYellow: Color {
        Color("appYellow")
    }
}

extension EnvironmentValues {
    var appColors: AppColors {
        get { self[AppColors.Key.self] }
        set { self[AppColors.Key.self] = newValue }
    }
}

