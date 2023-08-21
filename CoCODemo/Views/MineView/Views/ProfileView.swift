//
//  ProfileView.swift
//  Mine3
//
//  Created by 雷子康 on 2023/8/17.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack{
         Image("bc")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
