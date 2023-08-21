//
//  FindView.swift
//  WhatsAppDemo2
//
//  Created by 雷子康 on 2023/8/19.
//

import SwiftUI

struct FindView: View {
    var body: some View {
        NavigationView{
            ScrollView {
                VStack(alignment: .center, spacing: 20) {
                    /// 图片1
                    VStack{
                        Image("1")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                    }
                    
                    /// 图片2
                    VStack{
                        Image("2")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                           
                    }
                    /// 图片3
                    VStack{
                        Image("3")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                    }
                    /// 图片4
                    VStack{
                        Image("4")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                           
                    }
                    /// 图片5
                    VStack{
                        Image("5")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                    }
                    /// 图片6
                    VStack{
                        Image("6")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                           
                    }
                    /// 图片3
                    VStack{
                        Image("7")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                          
                    }
                    /// 图片8
                    VStack{
                        Image("8")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                    }
                    /// 图片9
                    VStack{
                        Image("9")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            
                            .clipShape(RoundedRectangle(cornerRadius: 15))
                            
                    }
                }
                .padding()
                .navigationTitle("Find")
            }
        }
    }
}

struct FindView_Previews: PreviewProvider {
    static var previews: some View {
        FindView()
    }
}
