//
//  ChatRow.swift
//  WhatsAppDemo2
//
//  Created by 雷子康 on 2023/8/18.
//

import SwiftUI
/// 单行的聊天框显示画面
struct ChatRow: View {
    
    let chat: Chat
    
    var body: some View {
        HStack(spacing: 20){
            // MARK: - 图像
            Image(chat.person.imgString )
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70,height: 70)
                .clipShape(Circle())
            // MARK: - 其他信息，名字，消息内容，文字等
            ZStack{
                VStack(alignment: .leading, spacing: 5){
                    // 名字与日期
                    HStack{
                        // Name
                        Text(chat.person.name)
                            .bold()
                        
                        Spacer()
                        // 日期
                        Text(chat.message.last?.date.descriptiveSpring() ?? "")
                    }
                    // 消息
                    HStack{
                        
                        Text(chat.message.last?.text ?? "")
                            .foregroundColor(.gray)
                            .lineLimit(2)
                            .frame(height: 50, alignment: .top)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.trailing, 40)
                    }
                    
                }
                // MARK: - 未读消息小圆点
                Circle()
                    .foregroundColor(chat.hasUnreadMessage ? .blue : .clear)
                    .frame(width: 18, height: 18)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
        .frame(height: 80)
    }
}

struct ChatRow_Previews: PreviewProvider {
    static var previews: some View {
        ChatRow(chat: Chat.sampleChat[0]) //sampleChat只有0-6
    }
}
