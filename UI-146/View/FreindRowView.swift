//
//  FreindRowView.swift
//  UI-146
//
//  Created by にゃんにゃん丸 on 2021/03/20.
//

import SwiftUI

struct FreindRowView: View {
    var friend : Friend
    var body: some View {
        HStack(spacing:15){
            
            Image(friend.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 9, content: {
                Text(friend.name)
                    .font(.title2)
                    .bold()
                    .kerning(1.3)
                
                Text(friend.detail)
                    .font(.caption)
                    .fontWeight(.semibold)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)
                
                    
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "message.fill")
                    .foregroundColor(.yellow)
                    .padding()
                    .background(Color.yellow.opacity(0.2))
                    .clipShape(Circle())
            })
            .padding(.trailing,-5)
            
            Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                Image(systemName: "phone.fill")
                    .foregroundColor(.yellow)
                    .padding()
                    .background(Color.yellow.opacity(0.2))
                    .clipShape(Circle())
            })
            
            
            
            
            
            
        }
        .padding(.horizontal)
    }
}

struct FreindRowView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
