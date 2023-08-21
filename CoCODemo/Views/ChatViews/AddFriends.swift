//
//  AddFriends.swift
//  WhatsAppDemo2
//
//  Created by 雷子康 on 2023/8/19.
//

import SwiftUI

struct AddFriends: View {
    
    @StateObject var viewModel = ChatsViewModel()
    
    // The search bar 变量
    @State private var query = ""
    
    var body: some View {
        VStack{
            List {
                ForEach(viewModel.getSortedFilteredChats(query: query )) { chat in
                    
                    VStack{
                            ChatRow(chat: chat)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .searchable(text: $query)
            .navigationTitle("Add Friends")
        }
    }
}

struct AddFriends_Previews: PreviewProvider {
    static var previews: some View {
        AddFriends()
    }
}
