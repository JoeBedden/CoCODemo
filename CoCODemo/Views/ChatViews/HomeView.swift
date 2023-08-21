//
//  HomeView.swift
//  WhatsAppDemo2
//
//  Created by 雷子康 on 2023/8/19.
//

import SwiftUI

struct HomeView: View {
    @State private var isActive = false
//    @State private var showTabBar = false
    @StateObject var viewModel = ChatsViewModel()
    
    // The search bar 变量
    @State private var query = ""
    
    var body: some View {
        
        NavigationView {
            
            List {
                ForEach(viewModel.getSortedFilteredChats(query: query )) { chat in
                    
                    VStack{
                        NavigationLink(destination: {
                            ChatView(chat: chat)
                                .environmentObject(viewModel)
//                                .toolbar(showTabBar ? .visible : .hidden, for: .tabBar)
//                                .onTapGesture {
//                                              withAnimation {
//                                                  showTabBar.toggle()
//                                              }
//                                          }
                        }) {
                            ChatRow(chat: chat)
                        }
                    }
                    .swipeActions(edge: .leading, allowsFullSwipe: true) {
                        Button(action: {
                            viewModel.markAsUnread(!chat.hasUnreadMessage, chat: chat)
                        }){
                            if chat.hasUnreadMessage {
                                Label("Read", systemImage: "text.bubble")
                            } else {
                                Label("UnRead", systemImage: "circle.fill")
                            }
                        }
                        .tint(.blue)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .searchable(text: $query)
            .navigationTitle("Chats")
            .navigationBarItems(trailing:
                                    NavigationLink(destination: AddFriends()){
                Image(systemName: "person.fill.badge.plus").font(.title3)
            }
//            Button(action: {
//                self.isActive = true
//            }){
//                Image(systemName: "person.fill.badge.plus").font(.title3)
//            }
            .padding()
            )
            
        }
    }
    
//    func GO() -> some View {
//        NavigationLink(destination: <#T##() -> _#>, label: <#T##() -> _#>)
//    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
