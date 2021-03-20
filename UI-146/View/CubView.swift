//
//  CubView.swift
//  UI-146
//
//  Created by にゃんにゃん丸 on 2021/03/20.
//

import SwiftUI

struct CubView: View {
    
    var body: some View {
        TabView{
            
            ForEach(datas){data in
                
                
                GeometryReader{reader in
                    
                    ZStack{
                        
                        LinearGradient(gradient: .init(colors: [.red,.blue]), startPoint: .top, endPoint: .bottomTrailing)
                            .cornerRadius(10)
                        
                        Image(data.story)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .cornerRadius(10)
                            .padding(.horizontal)
                        
                        VStack(alignment: .leading, spacing: 15, content: {
                            ZStack(alignment: .leading, content: {
                                Capsule()
                                    .fill(Color.black.opacity(0.3))
                                    .frame(height: 2.5)
                                
                                Capsule()
                                    .fill(Color.white)
                                    .frame(width:data.offset,height: 2.5)
                                
                            })
                            
                            HStack{
                                
                                Image(data.story)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 30, height: 30)
                                    .clipShape(Circle())
                                
                                Text(data.name)
                                    .bold()
                                    .foregroundColor(.white)
                                
                                Text(data.time)
                                    .bold()
                                    .foregroundColor(.white)
                                    
                            }
                            Spacer()
                        })
                        .padding(.all)
                        
                    }
                    .frame(width: reader.frame(in: .global).width, height: reader.frame(in: .global).height)
                    .rotation3DEffect(
                        .degrees(getAngle(offset: reader.frame(in: .global).minX)),
                        axis: (x: 0.0, y: 1.0, z: 0.0),
                        anchor: reader.frame(in: .global).minX > 0 ? .leading : .trailing,
                        
                        perspective: 2.5
                    )
                }
               
                
                
                    
                
                
            
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        
        .background(Color.primary.opacity(0.02).edgesIgnoringSafeArea(.all))
        .navigationTitle("Cube")
    
    }
    func getAngle(offset:CGFloat)->Double{
        
        let tempAngle = offset / (getrect().width / 2)
        let rotatationDegree : CGFloat = 20
        
        return Double(tempAngle * rotatationDegree)
        
    }
}

struct CubView_Previews: PreviewProvider {
    static var previews: some View {
        CubView()
    }
}
extension View{
    
    func getrect()->CGRect{
        
        return UIScreen.main.bounds
    }
}
