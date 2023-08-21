//
//  CapsuleButtonStyle.swift
//  DateDemo
//
//  Created by 雷子康 on 2023/8/15.
//



//struct CapsuleButtonStyle: View {
//    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
//    }
//}
import SwiftUI

struct CapsuleButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            //.padding()
            .background(
                LinearGradient(gradient: Gradient(colors: [.yellow, .orange, .red]), startPoint: .top, endPoint: .bottom)
                    .clipShape(Capsule())
            )
//            .foregroundColor(.white)
//            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
//            .fontWeight(.bold)
//                    .foregroundStyle(.white)
//                   .padding(.vertical, 12)
//                .padding(.horizontal, 35)
    }
}



struct CapsuleButtonStyle_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
