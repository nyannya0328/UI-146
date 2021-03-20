//
//  data.swift
//  UI-146
//
//  Created by にゃんにゃん丸 on 2021/03/20.
//

import SwiftUI

struct data : Identifiable {
    var id = UUID().uuidString
    var story : String
    var name : String
    var time : String
    var offset : CGFloat
    var color : Color
}

var datas = [

    data(story: "a1", name: "What?", time: "1H", offset: 100, color: .blue),
    data(story: "a2", name: "2020", time: "2H", offset: 200, color: .red),
    data(story: "a3", name: "Tokyo", time: "3h", offset: 50, color: .purple),
    data(story: "a4", name: "Cool", time: "4h", offset: 250, color: .green),
    data(story: "a5", name: "にゃ〜", time: "5H", offset: 80, color: .orange),
    data(story: "a6", name: "にゃ〜", time: "5H", offset: 80, color: .orange),
    data(story: "a7", name: "にゃ〜", time: "5H", offset: 80, color: .orange),
    data(story: "a8", name: "にゃ〜", time: "5H", offset: 80, color: .orange),

]
