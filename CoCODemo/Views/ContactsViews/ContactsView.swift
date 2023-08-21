//
//  ContactsView.swift
//  WhatsAppDemo2
//
//  Created by 雷子康 on 2023/8/19.
//

import SwiftUI

struct ContactsView: View {
    
    @State private var isActive = false
    
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
                        }) {
                            ContactRow(chat: chat)
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
            .navigationTitle("Contacts")
            .listStyle(PlainListStyle())
            .searchable(text: $query)
        }
       
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactsView()
    }
}
