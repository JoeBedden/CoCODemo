//
//  ChatModel.swift
//  WhatsAppDemo2
//
//  Created by 雷子康 on 2023/8/18.
//

import Foundation

struct Chat: Identifiable {
    var id: UUID { person.id }
    let person: Person
    var message: [Message]
    var hasUnreadMessage = false
}
// MARK: - 定义Person包含3个元素：id name imgString（头像图片）
struct Person: Identifiable {
    let id = UUID()
    let name: String
    let imgString: String
}

// MARK: - 定义Message包含:id date text MessageType （MessageType状态：Sent/Receive）
struct Message: Identifiable {
    
    // 定义MessageType，两种状态，Sent和Receive
    enum MessageType {
    case Sent, Received
    }
    
    let id = UUID()
    let date: Date
    let text: String
    let type: MessageType
    
    init (_ text: String, type: MessageType, date: Date) {
        self.date =  date
        self.type = type
        self.text = text
    }
    
    init(_ text: String, type: MessageType) {
        self.init(text, type: type, date: Date())
    }
}

// MARK: - 聊天内容例子
extension Chat {
    
    static let sampleChat = [
        
    /// Person 1
    Chat(person: Person(name: "Rachel", imgString: "01"), message: [
        Message("Shall I compare thee to a summer's day?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 5)),
        Message("Thou art more lovely and more temperate.", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
        Message("Rough winds do shake the darling buds of May,", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 3)),
        Message("And summer's lease hath all too short a date.", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
        Message("Sometime too hot the eye of heaven shines,", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
        Message("And often is his gold complexion dimmed.", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 0.2)),
        Message("And every fair from fair sometime declines,", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 0.3)),
        Message("By chance or nature's changing course untrimmed.", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 0.4)),
        Message("But thy eternal summer shall not fade", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 0.5)),
        Message("Nor lose possession of that fair thou owest", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 0.6)),
        Message("Nor shall Death brag thou wanderest in his shade,", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 0.7)),
        Message("When in eternal lines to time thou growest:", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 0.8)),
        Message("So long as men can breathe or eyes can see,", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 0.9)),
        Message("So long lives this, and this gives life to thee.", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 0.91)),
    ],hasUnreadMessage: true),
    
    /// Person 2
    Chat(person: Person(name: "YangBo", imgString: "02"), message: [
        Message("Do not go gentle into that good night,", type: .Received, date: Date()),
        Message("Ok", type: .Sent, date: Date()),
        Message("Rage, rage against the dying of the light.", type: .Received, date: Date()),
        Message("Yes", type: .Sent, date: Date()),
        Message("Because their words had forked no lightning they", type: .Received, date: Date()),
        Message("Do not go gentle into that good night. ", type: .Sent, date: Date()),
        Message("Good men, the last wave by, crying how bright ", type: .Received, date: Date()),
        Message("Their frail deeds might have danced in a green bay, ", type: .Received, date: Date()),
        Message("Rage, rage against the dying of the light.", type: .Sent, date: Date()),
        Message("Wild men who caught and sang the sun in flight,", type: .Received, date: Date()),
        Message("And learn, too late, they grieved it on its way, ", type: .Received, date: Date()),
        Message("Do not go gentle into that good night.", type: .Received, date: Date()),
        Message("Grave men, near death, who see with blinding sight ", type: .Received, date: Date()),
        Message("Blind eyes could blaze like meteors and be gay,", type: .Received, date: Date()),
        Message("Rage, rage against the dying of the light.", type: .Received, date: Date()),
        Message("And you, my father, there on the sad height, ", type: .Received, date: Date()),
        Message("Curse, bless me now with your fierce tears, I pray.", type: .Received, date: Date()),
        Message("Do not go gentle into that good night. ", type: .Received, date: Date()),
        Message("Rage, rage against the dying of the light.", type: .Received, date: Date()),
    ],hasUnreadMessage: true),
    
    /// Person 3
    Chat(person: Person(name: "Danil", imgString: "03"), message: [
        Message("Shall I compare thee to a summer's day?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 5)),
        Message("Thou art more lovely and more temperate.", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
        Message("Rough winds do shake the darling buds of May,", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 3)),
        Message("And summer's lease hath all too short a date.", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
        Message("Sometime too hot the eye of heaven shines,", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
        Message("And often is his gold complexion dimmed.", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 0.2)),
        Message("And every fair from fair sometime declines,", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 0.3)),
        Message("By chance or nature's changing course untrimmed.", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 0.4)),
        Message("But thy eternal summer shall not fade", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 0.5)),
        Message("Nor lose possession of that fair thou owest", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 0.6)),
        Message("Nor shall Death brag thou wanderest in his shade,", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 0.7)),
        Message("When in eternal lines to time thou growest:", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 0.8)),
        Message("So long as men can breathe or eyes can see,", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 0.9)),
        Message("So long lives this, and this gives life to thee.", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 0.91)),
    ],hasUnreadMessage: true),
    
    /// Person 4
    Chat(person: Person(name: "Chirs", imgString: "04"), message: [
        Message("Do not go gentle into that good night,", type: .Received, date: Date()),
        Message("Old age should burn and rave at close of day;", type: .Sent, date: Date()),
        Message("Rage, rage against the dying of the light.", type: .Received, date: Date()),
        Message("Though wise men at their end know dark is right,", type: .Sent, date: Date()),
        Message("Because their words had forked no lightning they", type: .Received, date: Date()),
        Message("Do not go gentle into that good night. ", type: .Sent, date: Date()),
        Message("Good men, the last wave by, crying how bright ", type: .Received, date: Date()),
        Message("Their frail deeds might have danced in a green bay, ", type: .Sent, date: Date()),
        Message("Rage, rage against the dying of the light.", type: .Received, date: Date()),
        Message("Wild men who caught and sang the sun in flight,", type: .Sent, date: Date()),
        Message("And learn, too late, they grieved it on its way, ", type: .Received, date: Date()),
        Message("Do not go gentle into that good night.", type: .Sent, date: Date()),
        Message("Grave men, near death, who see with blinding sight ", type: .Received, date: Date()),
        Message("Blind eyes could blaze like meteors and be gay,", type: .Sent, date: Date()),
        Message("Rage, rage against the dying of the light.", type: .Received, date: Date()),
        Message("And you, my father, there on the sad height, ", type: .Sent, date: Date()),
        Message("Curse, bless me now with your fierce tears, I pray.", type: .Received, date: Date()),
        Message("Do not go gentle into that good night. ", type: .Sent, date: Date()),
        Message("Rage, rage against the dying of the light.", type: .Received, date: Date()),
    ],hasUnreadMessage: false),
    
    /// Person 5
    Chat(person: Person(name: "Emily", imgString: "05"), message: [
        Message("Do not go gentle into that good night,", type: .Received, date: Date()),
        Message("Old age should burn and rave at close of day;", type: .Sent, date: Date()),
        Message("Rage, rage against the dying of the light.", type: .Received, date: Date()),
        Message("Though wise men at their end know dark is right,", type: .Sent, date: Date()),
        Message("Because their words had forked no lightning they", type: .Received, date: Date()),
        Message("Do not go gentle into that good night. ", type: .Sent, date: Date()),
        Message("Good men, the last wave by, crying how bright ", type: .Received, date: Date()),
        Message("Their frail deeds might have danced in a green bay, ", type: .Sent, date: Date()),
        Message("Rage, rage against the dying of the light.", type: .Received, date: Date()),
        Message("Wild men who caught and sang the sun in flight,", type: .Sent, date: Date()),
        Message("And learn, too late, they grieved it on its way, ", type: .Received, date: Date()),
        Message("Do not go gentle into that good night.", type: .Sent, date: Date()),
        Message("Grave men, near death, who see with blinding sight ", type: .Received, date: Date()),
        Message("Blind eyes could blaze like meteors and be gay,", type: .Sent, date: Date()),
        Message("Rage, rage against the dying of the light.", type: .Received, date: Date()),
        Message("And you, my father, there on the sad height, ", type: .Sent, date: Date()),
        Message("Curse, bless me now with your fierce tears, I pray.", type: .Received, date: Date()),
        Message("Do not go gentle into that good night. ", type: .Sent, date: Date()),
        Message("Rage, rage against the dying of the light.", type: .Received, date: Date()),
    ],hasUnreadMessage: true),
    
    /// Person 6
    Chat(person: Person(name: "William", imgString: "06"), message: [
        Message("Do not go gentle into that good night,", type: .Received, date: Date()),
        Message("Old age should burn and rave at close of day;", type: .Sent, date: Date()),
        Message("Rage, rage against the dying of the light.", type: .Received, date: Date()),
        Message("Though wise men at their end know dark is right,", type: .Sent, date: Date()),
        Message("Because their words had forked no lightning they", type: .Received, date: Date()),
        Message("Do not go gentle into that good night. ", type: .Sent, date: Date()),
        Message("Good men, the last wave by, crying how bright ", type: .Received, date: Date()),
        Message("Their frail deeds might have danced in a green bay, ", type: .Sent, date: Date()),
        Message("Rage, rage against the dying of the light.", type: .Received, date: Date()),
        Message("Wild men who caught and sang the sun in flight,", type: .Sent, date: Date()),
        Message("And learn, too late, they grieved it on its way, ", type: .Received, date: Date()),
        Message("Do not go gentle into that good night.", type: .Sent, date: Date()),
        Message("Grave men, near death, who see with blinding sight ", type: .Received, date: Date()),
        Message("Blind eyes could blaze like meteors and be gay,", type: .Sent, date: Date()),
        Message("Rage, rage against the dying of the light.", type: .Received, date: Date()),
        Message("And you, my father, there on the sad height, ", type: .Sent, date: Date()),
        Message("Curse, bless me now with your fierce tears, I pray.", type: .Received, date: Date()),
        Message("Do not go gentle into that good night. ", type: .Sent, date: Date()),
        Message("Rage, rage against the dying of the light.", type: .Received, date: Date()),
    ],hasUnreadMessage: false),
    
    /// Person 7
    Chat(person: Person(name: "Olivia", imgString: "07"), message: [
        Message("Shall I compare thee to a summer's day?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 5)),
        Message("Thou art more lovely and more temperate.", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
        Message("Rough winds do shake the darling buds of May,", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 3)),
        Message("And summer's lease hath all too short a date.", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
        Message("Sometime too hot the eye of heaven shines,", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
        Message("And often is his gold complexion dimmed.", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 0.2)),
        Message("And every fair from fair sometime declines,", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 0.3)),
        Message("By chance or nature's changing course untrimmed.", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 0.4)),
        Message("But thy eternal summer shall not fade", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 0.5)),
        Message("Nor lose possession of that fair thou owest", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 0.6)),
        Message("Nor shall Death brag thou wanderest in his shade,", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 0.7)),
        Message("When in eternal lines to time thou growest:", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 0.8)),
        Message("So long as men can breathe or eyes can see,", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 0.9)),
        Message("So long lives this, and this gives life to thee.", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 0.91)),
    ],hasUnreadMessage: true),
    
    /// Person 8
    Chat(person: Person(name: "Tomas", imgString: "08"), message: [
        Message("Shall I compare thee to a summer's day?", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 5)),
        Message("Thou art more lovely and more temperate.", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 4)),
        Message("Rough winds do shake the darling buds of May,", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 3)),
        Message("And summer's lease hath all too short a date.", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 2)),
        Message("Sometime too hot the eye of heaven shines,", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 1)),
        Message("And often is his gold complexion dimmed.", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 0.2)),
        Message("And every fair from fair sometime declines,", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 0.3)),
        Message("By chance or nature's changing course untrimmed.", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 0.4)),
        Message("But thy eternal summer shall not fade", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 0.5)),
        Message("Nor lose possession of that fair thou owest", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 0.6)),
        Message("Nor shall Death brag thou wanderest in his shade,", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 0.7)),
        Message("When in eternal lines to time thou growest:", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 0.8)),
        Message("So long as men can breathe or eyes can see,", type: .Received, date: Date(timeIntervalSinceNow: -86400 * 0.9)),
        Message("So long lives this, and this gives life to thee.", type: .Sent, date: Date(timeIntervalSinceNow: -86400 * 0.91)),
    ],hasUnreadMessage: true),
    
    ]
}
