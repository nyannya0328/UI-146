//
//  Freind.swift
//  UI-146
//
//  Created by にゃんにゃん丸 on 2021/03/20.
//

import SwiftUI

struct Friend: Identifiable {
    var id = UUID().uuidString
    var name : String
    var detail : String
    var image : String
}

var friends = [
    Friend(name: "Kevin", detail: "I think many users are using google maps", image: "p1"),
    Friend(name: "Andy", detail: "I will keep running!", image: "p2"),
    Friend(name: "Hang", detail: "I apprreciate", image: "p3"),
    Friend(name: "King", detail: "Without hesitation", image: "p4"),
    Friend(name: "Miranda", detail: "I'm gonna have to call you back", image: "p5"),
    Friend(name: "Kerry", detail: "Untill the day our flame of life disappears will keep walking", image: "p6"),
    Friend(name: "Kevin", detail: "I don't konow the limits", image: "p1"),
    Friend(name: "Andy", detail: "I could never forget about it", image: "p2"),
    Friend(name: "Hang", detail: "I wished so badly I could feel it again", image: "p3"),
    Friend(name: "King", detail: "Tanking so many detours,over and over", image: "p4"),
    Friend(name: "Miranda", detail: "I'm look out the window", image: "p5"),
    Friend(name: "Kerry", detail: "I beleive in the oath of that day", image: "p6")
    
]
