//
//  LoginView.swift
//  HomeDemo
//
//  Created by 雷子康 on 2023/8/17.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var username = ""
    @State private var password = ""
    @State private var wrongUsername: Float = 0
    @State private var wrongPassword: Float  = 0
    @State private var showingLoginScreen = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.teal
                    .ignoresSafeArea()
                Circle()
                    .scale(1.7)
                    .foregroundColor(.white.opacity(0.15))
                Circle()
                    .scale(1.35)
                    .foregroundColor(.white)

                VStack {
                    Image("CoCO")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding()
                    HStack{
                        Text("Meet your friends on")
                            .font(.title3)
                            .foregroundColor(.black)
                        Text("CoCO")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor( Color("Color.CoCO"))
                          }
                    .padding()
                 
                    
//                    Text("Please Login")
//                        .font(.largeTitle)
//                        .bold()
//                        .padding()
                    VStack(spacing:10){
                        TextField("Username", text: $username)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                           
                            .cornerRadius(10)
                            .border(.red, width: CGFloat(wrongUsername))
                            
                        
                        SecureField("Password", text: $password)
                            .padding()
                            .frame(width: 300, height: 50)
                            .background(Color.black.opacity(0.05))
                            .cornerRadius(10)
                            .border(.red, width: CGFloat(wrongPassword))
                    }
                    .padding()
              
                    
                    Button(action:{
                        // 识别密码和用户名是否正确
                        authenticateUser(username: username, password: password)
                    }) {
                        HStack{
                            Text("LogIn")
            
                            Image(systemName: "arrow.right")
                        }
                        .fontWeight(.bold)
                        .buttonStyle(CapsuleButtonStyle())
                        .foregroundStyle(.white)
                       .padding(.vertical, 12)
                    .padding(.horizontal, 35)
//                        .foregroundStyle(.white)
//                        .fontWeight(.bold)
                    }
                    .padding(.top,20)
//                    .foregroundColor(.white)
//                    .frame(width: 300, height: 50)
                    .buttonStyle(CapsuleButtonStyle())
//                    .cornerRadius(10)
//                    .clipShape(Capsule())
                    
                    NavigationLink(destination: TabBar().navigationBarHidden(true), isActive: $showingLoginScreen) {
                        EmptyView()
                    }
                }
            }
        }
        .toolbar(.hidden, for: .tabBar)
        .toolbar(.hidden, for: .navigationBar)
    }
    // MARK: - 识别密码和用户名是否正确的函数
    func authenticateUser(username: String, password: String) {
        if username.lowercased() == "" {
            wrongUsername = 2
            if password.lowercased() == "" {
                wrongPassword = 2
                showingLoginScreen = false
            } else {
                wrongPassword = 0
                showingLoginScreen = true
            }
        } else {
            wrongUsername = 0
            showingLoginScreen = true
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
