//
//  Home.swift
//  UI-146
//
//  Created by にゃんにゃん丸 on 2021/03/20.
//

import SwiftUI

struct Home: View {
    @State var searchQuery = ""
    @State var offset : CGFloat = 0
    @State var startoffset : CGFloat = 0
    
    @State var titleoffset : CGFloat = 0
    
    @State var titleBarHeight : CGFloat = 0
    
    @Environment(\.colorScheme) var scheme
    
    var body: some View {
        ZStack(alignment:.top){
            VStack{
            
           
            
                if searchQuery == ""{
                    HStack{
                        
                        NavigationLink(
                            destination: CubView(),
                            label: {
                                
                                Image(systemName: "star.fill")
                                    .font(.title2)
                                    .foregroundColor(.primary)
                               
                            })
                        
                       
                           
                    
                        
                        Spacer()
                        
                       NavigationLink(
                        destination: DragDown(),
                        label: {
                            Image(systemName: "plus")
                                .font(.title2)
                                .foregroundColor(.primary)
                            
                        })
                           
                        
                    }
                    .padding()
                    HStack{
                        
                        (
                        Text("My ")
                            .bold()
                            .foregroundColor(.primary)
                            
                            +
                            
                            Text("Freinds")
                           
                            .foregroundColor(.gray)
                        
                        
                        )
                        .font(.largeTitle)
                        .overlay(
                        
                        
                            GeometryReader{reader -> Color in
                                let maxX = reader.frame(in:.global).maxX
                                
                                DispatchQueue.main.async {
                                    
                                    if titleoffset == 0{
                                        
                                        titleoffset = maxX
                                    }
                                    
                                }
                                
                                return Color.clear
                                
                            }
                            .frame(width: 0, height: 0)
                            
                        )
                        .padding()
                        .scaleEffect(getScale())
                        .offset(getoffset())
                        
                        Spacer()
                        
                    }
                }
            
            
            VStack{
                HStack(spacing:15){
                    
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 25, weight: .bold))
                    
                    
                    TextField("Search", text: $searchQuery)
                    
                    
                }
                .padding(.vertical,10)
                .padding(.horizontal)
                .background(Color.primary.opacity(0.03))
                .cornerRadius(10)
                .padding()
                
                if searchQuery == ""{
                    HStack{
                        
                        Text("RECENT")
                            .font(.caption)
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        RoundedRectangle(cornerRadius: 0.3)
                            .stroke(Color.black.opacity(0.3),lineWidth: 4)
                        .frame(height: 0.5)
                            
                        
                    }
                    .padding()
                }
            }
            .offset(y: offset > 0 && searchQuery == "" ? (offset <= 95 ? -offset : -95) : 0)
                
            }
            .zIndex(1)
            
            .padding(.bottom,searchQuery == "" ? getoffset().height : 0)
            .background(
            
            
                ZStack{
                    
                   let  color = scheme == .dark ? Color.black : Color.white
                    
                    LinearGradient(gradient: .init(colors: [color,color,color,color,color,color.opacity(0.3)]), startPoint: .top, endPoint: .bottom)
                    
                }
                .ignoresSafeArea()
            )
            .overlay(
            
                GeometryReader{reader -> Color in
                    
                    let Maxy = reader.frame(in: .global).maxY
                    
                    DispatchQueue.main.async {
                        if titleBarHeight == Maxy{
                            
                        titleBarHeight = Maxy
                        }
                        titleBarHeight = Maxy - (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0)
                    }
                    
                    return Color.clear
                }
            )
            .animation(.easeInOut,value: searchQuery != "")
        
            
            ScrollView(.vertical, showsIndicators: false, content: {
                VStack(spacing:15){
                    
                    ForEach(searchQuery == "" ? friends : friends.filter{$0.name.lowercased().contains(searchQuery.lowercased())
                    } + friends.filter{$0.detail.lowercased().contains(searchQuery.lowercased())}){friend in
                        
                       FreindRowView(friend: friend)
                    }
                }
                .padding(.top,10)
                .padding(.top,searchQuery == "" ? titleBarHeight : 90)
                .overlay(
                    
                    GeometryReader{proxy -> Color in
                        
                        let miny = proxy.frame(in: .global).minY
                        
                        DispatchQueue.main.async {
                            if startoffset == 0{
                                
                                startoffset = miny
                                
                            }
                            offset = startoffset - miny
                            
                        
                        }
                        
                        return Color.clear
                        
                    }
                    .frame(width: 0, height: 0)
                    ,alignment: .top
                
                
                
                )
                
            })
            
            
            
        }
       
    }

    func getoffset()->CGSize{
        
        let ScreenWith = UIScreen.main.bounds.width / 2
        
        var size : CGSize = .zero
        
        size.width = offset > 0 ? (offset * 1.5 <= (ScreenWith - titleoffset) ? offset * 1.5 : (ScreenWith - titleoffset)) : 0
        size.height = offset > 0 ? (offset <= 75 ? -offset : -75) : 0
        return size
    }
    
    func getScale()->CGFloat{
        if offset > 0{
            
            let screenWith = UIScreen.main.bounds.width
            
            let progress = 1 - (getoffset().width / screenWith)
            
            return progress >= 0.9 ? progress : 0.6
            
        }
        else{
            return 1
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
