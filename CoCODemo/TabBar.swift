//
//  TabBar.swift
//  WhatsAppDemo2
//
//  Created by 雷子康 on 2023/8/19.
//

import SwiftUI

struct TabBar: View {
    /// 隐藏TabBar
    @State private var isTabBarHidden = false
    
    var body: some View {
        TabView {
            
            HomeView().tabItem(){
                Image(systemName: "message")
                Text("Chats")
            }
            
            ContactsView().tabItem(){
                Image (systemName: "person.2.fill")
                Text("Contacts")
            }
            
            FindView().tabItem(){
                Image(systemName: "circle.hexagongrid")
                Text("Find")
            }
            
            MineView().tabItem(){
                Image(systemName: "gearshape.fill")
                Text("Setting")
            }
        }
        
    }
    
    struct TabBar_Previews: PreviewProvider {
        static var previews: some View {
            TabBar()
        }
    }
}
