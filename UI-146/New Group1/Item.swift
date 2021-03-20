//
//  Item.swift
//  UI-146
//
//  Created by にゃんにゃん丸 on 2021/03/20.
//

import SwiftUI

struct Item: Identifiable {
    
    var id = UUID().uuidString
    var name : String
    var image : String
   
    var offset : CGFloat
    
}

var items = [

    Item(name: "Baby", image: "a1", offset: 0),
    Item(name: "Girl", image: "a2", offset: 0),
    Item(name: "Boy", image: "a3", offset: 0),
    Item(name: "Moai", image: "a4", offset: 0),
    Item(name: "Birid", image: "a5", offset: 0),
    Item(name: "Girl", image: "a6", offset: 0),
   

]
