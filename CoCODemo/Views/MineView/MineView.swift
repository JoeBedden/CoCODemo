//
//  MineView.swift
//  DateDemo5
//
//  Created by 雷子康 on 2023/8/17.
//

import SwiftUI

struct MineView: View {
    @State private var showLogin = false
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                HStack {
                    Image("mine")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        
                        .frame(width: 60, height: 60)
                        .clipShape(Circle())
                        .padding()
                   
                    VStack(alignment: .leading){
                        Text("Mine")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .padding(2)
                        HStack{
                            Image(systemName: "mail")
                            Text("******@mail.com")
                        }
                        .font(.footnote)
                        .fontWeight(.light)
                        .padding(2)
                        HStack{
                            Image(systemName: "house")
                            Text("123 Main Street, New York")
                        }
                        .font(.footnote)
                        .fontWeight(.light)
                    }
                   
                    
                }
                .padding()
               
             Divider()
                List {
                    // MARK: - Bookmark
                    VStack(){
                        NavigationLink(destination: {
                            BookmarkView()
                        }, label: {
                            HStack(spacing: 25){
                                Image("书签")
                                    .resizable()
                                    .frame(width: 30.0,height: 30.0)
                                
                                Text("Bookmark")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.black)
                            }
                            
                        })
                        .padding()
                        
                    }
                    // MARK: - Feedback
                    VStack(){
                        NavigationLink(destination: {
                            FeedBackView()
                        }, label: {
                            HStack(spacing: 25){
                                Image("反馈信息")
                                    .resizable()
                                    .frame(width: 30.0,height: 30.0)
                                
                                Text(" FeedBack")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.black)
                            }
                            
                        })
                        .padding()
                        
                    }
                    // MARK: - Setting
                    VStack(){
                        NavigationLink(destination: {
                            SettingView()
                        }, label: {
                            HStack(spacing: 25){
                                Image("设置")
                                    .resizable()
                                    .frame(width: 25.0,height: 25.0)
                               
                                Text("  Setting")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.black)
                            }
                            
                        })
                        .padding()
                        
                    }
                    
                    // MARK: - Privacy
                    VStack(){
                        NavigationLink(destination: {
                            PrivacyView()
                        }, label: {
                            HStack(spacing: 30){
                                Image("隐私")
                                    .resizable()
                                    .frame(width: 30.0,height: 30.0)
                                
                                Text("Privacy")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.black)
                            }
                            
                        })
                        .padding()
                        
                    }
                    // MARK: - My Doc
                    VStack(){
                        NavigationLink(destination: {
                            DocView()
                        }, label: {
                            HStack(spacing: 31){
                                Image("文件")
                                    .resizable()
                                    .frame(width: 25.0,height: 25.0)
                                
                                Text(" My Doc")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.black)
                            }
                            
                        })
                        .padding()
                        
                    }
                    // MARK: - My Profile
                    VStack(){
                        NavigationLink(destination: {
                            ProfileView()
                        }, label: {
                            HStack(spacing: 30){
                                Image("用户信息")
                                    .resizable()
                                    .frame(width: 25.0,height: 25.0)
                                
                                Text(" My Profile")
                                    .font(.title3)
                                    .bold()
                                    .foregroundColor(.black)
                            }
                            
                        })
                        .padding()
                        
                    }
                    
                }
                .padding()
                .listStyle(PlainListStyle())
                .font(.title)
                .padding(.top, 10)
                
                VStack(alignment: .center){
                    HStack{
                        Spacer()
                        Button(role:.destructive,action: {
                            showLogin = true
                        }, label: {
                            HStack(spacing: 20) {
                                Text("Log Out")
                                
                                Image("退出 (1)")
                                    .resizable()
                                    .frame(width: 20,height: 20)
                            }
                            .fontWeight(.bold)
                            .foregroundStyle(.white)
                           .padding(.vertical, 12)
                        .padding(.horizontal, 35)

                            
                            NavigationLink(destination: LoginView(), isActive: $showLogin){
                                EmptyView()
                            }
                            
                        }) .buttonStyle(.borderedProminent)
                            .padding()
                        Spacer()
                    }
         
                }
                
                    
           
            }
        }
    }
}

struct MineView_Previews: PreviewProvider {
    static var previews: some View {
        MineView()
    }
}
