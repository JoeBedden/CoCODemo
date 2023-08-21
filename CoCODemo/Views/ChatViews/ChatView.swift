//
//  ChatView.swift
//  WhatsAppDemo2
//
//  Created by 雷子康 on 2023/8/19.
//

import SwiftUI

struct ChatView: View {
    
    @EnvironmentObject var viewModel: ChatsViewModel
    
    let chat: Chat
//    @State private var showTabBar = false
    @State private var text = ""
    @FocusState private var isFocused
    
    // 自动上滑需要用到的函数
    @State private var messageIDToScroll: UUID?
    
    var body: some View {
        VStack(spacing : 0) {
            /// - 消息图
            GeometryReader { reader in
                ScrollView {
                    ScrollViewReader { scrollReader in
                        getMessagesView(viewWidth: reader.size.width)
                            .padding(.horizontal)
                            .onChange(of: messageIDToScroll) { _ in
                                if let messageID = messageIDToScroll{
                                    scrollTo(messageID: messageID, shouldAnimate: true, scrollReader: scrollReader)
                                }
                            }
                            .onAppear{
                                if let messageID = chat.message.last?.id {
                                    scrollTo(messageID: messageID,anchor: .bottom , shouldAnimate: false, scrollReader: scrollReader)
                                }
                            }
                    }
                }
            }
            .padding(.bottom, 5)
//            .background(Color.yellow)
            /// - 输入栏和按钮
            toolbarView()
            
        }
//        .toolbar(showTabBar ? .visible : .hidden, for: .tabBar)
//        .onTapGesture {
//                       withAnimation {
//                           showTabBar.toggle()
//                       }
//                   }
        .padding(.top, 1)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading: LeftBtn, trailing: RightBtn)
        .onAppear {
            viewModel.markAsUnread(false, chat: chat)
        }
    }
    //MARK: - 下面是函数
    
    // 顶部人物显示栏按钮
    var LeftBtn: some View{
        Button(action:{}){
            HStack{
                Image(chat.person.imgString)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 40, height: 40)
                    .clipShape(Circle())
                
                Text(chat.person.name)
                    .bold()
            }
            .foregroundColor(.black)
        }
    }
    // 视频和电话按钮
    var RightBtn: some View{
        Button(action:{}) {
            HStack{
                Button(action:{}){
                    Image(systemName: "video")
                }
                
                Button(action:{}){
                    Image(systemName: "phone")
                }
            }
        }
    }
    // 发消息自动下滑
    func scrollTo(messageID: UUID, anchor: UnitPoint? = nil, shouldAnimate: Bool, scrollReader: ScrollViewProxy) {
        DispatchQueue.main.async {
            withAnimation(shouldAnimate ? Animation.easeIn: nil) {
                scrollReader.scrollTo(messageID, anchor: anchor)
            }
        }
    }
    
    // MARK: - 输入栏
    func toolbarView() -> some View {
        VStack{
            let height: CGFloat = 37
            HStack{
                // 文字输入框
                TextField("Message ...", text: $text)
                    .padding(.horizontal, 10)
                    .frame(height: height)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 13))
                    .focused($isFocused)
                
               // 发送按钮
                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(.white)
                        .frame(width: height, height: height)
                        .background(
                        Circle()
                            .foregroundColor(text.isEmpty ? .gray : .blue)
                        )
                }
                .disabled(text.isEmpty)
            }
            .frame(height: height)
        }
        .padding(.vertical)
        .padding(.horizontal)
        .background(.thickMaterial)
    }
    //MARK: - 发送信息的函数
    func sendMessage() {
        if let message = viewModel.sendMessage(text, in: chat) {
            text = ""
            messageIDToScroll = message.id
        }
    }
    
    let columns = [GridItem(.flexible(minimum: 10))]
    // MARK: - 显示信息内容和格式的函数
    func getMessagesView(viewWidth: CGFloat) -> some View {
        LazyVGrid(columns: columns, spacing: 0) {
            ForEach(chat.message) { message in
                let isReceived = message.type == .Received
                HStack{
                    // ZStack中显示的是单个Text，只不过ForEach函数将其循环了，所以视图上显示了所有的text，这里的.padding是修饰的每个Vstack所以有添加句子间距效果
                    ZStack{
                        Text(message.text)
                        // 设置text的modifer，两个.padding用来修饰边距，用.background来设置透明度(.opacity)达到将.Received和.sent的消息分开的效果
                            .padding(.horizontal)
                            .padding(.vertical, 12)
                            .background(isReceived ? Color.black.opacity(0.2) : .blue.opacity(0.9))
                            .cornerRadius(13)
                    }
                    .frame(width: viewWidth * 0.7, alignment: isReceived ? .leading : .trailing) // 设置横向间距的同时分开.Received和.sent的text
                    .padding(.vertical) //添加文字横向间距
//                    .background(Color.blue)
                }
                // 通过frame将isReceived的消息和其他消息（sent）分到左右两边
                .frame(maxWidth: .infinity, alignment: isReceived ? .leading : .trailing)
                .id(message.id) // important for automatic scrolling later!
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ChatView( chat: Chat.sampleChat[0])
                .environmentObject(ChatsViewModel())
        }
    }
}
