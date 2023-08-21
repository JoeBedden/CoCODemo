//
//  ContactRow.swift
//  WhatsAppDemo2
//
//  Created by 雷子康 on 2023/8/19.
//

import SwiftUI

struct ContactRow: View {
    let chat: Chat
    
    var body: some View {
        HStack(){
            // MARK: - 图像
            Image(chat.person.imgString )
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70,height: 70)
                .clipShape(Circle())
            // MARK: - 名字
            ZStack{
                VStack(alignment: .trailing, spacing: 5){
                    // 名字与日期
                    HStack{
                        // Name
                        Text(chat.person.name)
                            .bold()
                        
                        Spacer()
                    }
                }
            }
            .font(.title3)
            .padding()
        }
        .frame(height: 80)
    }
}

struct ContactRow_Previews: PreviewProvider {
    static var previews: some View {
        ContactRow(chat: Chat.sampleChat[0])
    }
}
