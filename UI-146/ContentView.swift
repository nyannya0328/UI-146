//
//  ContentView.swift
//  UI-146
//
//  Created by にゃんにゃん丸 on 2021/03/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        NavigationView{
       

            Home()
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
              
                
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
