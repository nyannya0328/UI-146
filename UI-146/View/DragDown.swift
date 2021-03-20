//
//  DragDown.swift
//  UI-146
//
//  Created by にゃんにゃん丸 on 2021/03/20.
//

import SwiftUI

struct DragDown: View {
    @Environment(\.presentationMode) var present
    var body: some View {
        VStack{
            
            HStack{
                
                
                Button(action: {
                    present.wrappedValue.dismiss()
                    
                }, label: {
                    Image(systemName: "line.horizontal.3.decrease")
                        .font(.title)
                       
                        
                })
                
                Text("DRAG DOWN")
                    .font(.title)
                    .fontWeight(.bold)
                    .kerning(1.3)
                
                Spacer()
                
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Image(systemName: "gear")
                        .font(.title)
                        
                        
                })
                
                
                
                
                
                
            }
            .foregroundColor(.black)
            .shadow(color: Color.black.opacity(0.05), radius: 5, x: 5, y: 5)
            .shadow(color: Color.white.opacity(0.05), radius: 5, x: -8, y: -8)
            .padding()
            
            GeometryReader{reader in
                
                
                ZStack{
                    ForEach(items.reversed()){item in
                        
                        itemView(item: item, rect: reader.frame(in: .global))
                        
                        
                        
                    }
                }
            }
            .padding([.horizontal,.bottom])
            
        }
        .background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.all))
        .navigationBarHidden(true)
    }
}

struct itemView : View {
    @State var item : Item
   
    var rect : CGRect
    var body: some View{
        
        ZStack(alignment: .bottom, content: {
            Image(item.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: rect.width, height: rect.height)
            
            ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content: {
                
                (item.offset > 0 ? Color.red : Color.blue)
                    .opacity(item.offset != 0 ? 0.7 : 0)
                
                HStack{
                    
                    
                    if item.offset < 0{
                        
                        Spacer(minLength: 0)
                        
                        
                    }
                    
                    Text(item.offset == 0 ? "" : (item.offset > 0 ? "Like" : "Good"))
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top,25)
                        .padding(.horizontal)
                        
                    if item.offset > 0{Spacer(minLength: 0)}
                }
                
            })
                
            LinearGradient(gradient: .init(colors: [Color.red.opacity(0.3),Color.green.opacity(0.3)]), startPoint: .center, endPoint: .top)
            
            VStack(spacing:35){
                
                HStack{
                    
                    
                    VStack(alignment: .leading, spacing: 15, content: {
                        Text(item.name)
                            .font(.title)
                            .bold()
                    })
                    .foregroundColor(.white)
                    Spacer(minLength: 0)
                }
                
                HStack{
                    
                    Spacer()
                    
                    Button(action: {
                        
                        withAnimation(Animation.easeIn(duration: 0.8)){
                            
                            
                            item.offset = -1000
                        }
                        
                    }, label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .padding(20)
                            .background(Color.green)
                            .clipShape(Circle())
                    })
                    
                    Button(action: {
                        
                        withAnimation(Animation.easeIn(duration: 0.8)){
                            
                            
                            item.offset = +1000
                        }
                        
                    }, label: {
                        Image(systemName: "checkmark")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                            .padding(20)
                            .background(Color.green)
                            .clipShape(Circle())
                    })
                    Spacer()
                }
                .padding()
                
            }
        })
        .cornerRadius(20)
        .offset(x: item.offset)
        .rotationEffect(.init(degrees: item.offset == 0 ? 0 : (item.offset > 0 ? 12 : -12)))
        .gesture(DragGesture().onChanged({ (value) in
            withAnimation(.default){
                
                
                item.offset = value.translation.width
            }
            
        }).onEnded({ (value) in
            withAnimation(Animation.easeIn(duration: 0.3)){
                
                if item.offset > 150 {item.offset = 1000}
                else if item.offset < -150{item.offset = -1000}
                else{item.offset = 0}
            }
            
        }))
        
        
        
    }
}

struct DragDown_Previews: PreviewProvider {
    static var previews: some View {
        DragDown()
    }
}
