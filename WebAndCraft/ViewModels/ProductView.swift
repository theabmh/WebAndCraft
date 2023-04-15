//
//  ProductView.swift
//  WebAndCraft
//
//  Created by abbas m h on 15/04/23.
//

import SwiftUI

struct ProductView: View {
    
    @StateObject var vm = CategoryViewModel()
    var value : Value?
    
    var body: some View {
        VStack{
            HStack{
                if value?.offer ?? 0 > 0{
                    Text("\(value?.offer ?? 0) % OFF")
                        .foregroundColor(.white)
                        .bold()
                        .font(.system(size: 10))
                        .padding(3)
                        .background(.red)
                        .frame(height: 12)
                }
                Spacer()
                Image(systemName: "heart.fill")
                    .frame(height: 12)
                    .foregroundColor(.gray)
                    .padding(.horizontal)
            }
            HStack{
                if let image = vm.categoryImage{
                    Image(uiImage: image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 90,height: 90)
                }else{
                    ProgressView()
                        .frame(width: 90,height: 90)
                }
            }
            VStack(alignment: .leading){
                if value?.isExpress ?? false{
                    Text("🚚")
                        .font(.system(size: 10))
                        .padding(3)
                        .background(.yellow)
                        .cornerRadius(2)
                    
                }else{
                    Text("")
                        .font(.system(size: 10))
                        .padding(3)
                        .frame(height: 10)
                }
                if value?.actualPrice !=  value?.offerPrice{
                    Text("\(value?.actualPrice ?? "")")
                        .fontWeight(.medium)
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                        .strikethrough()
                }else{
                    Text("")
                        .fontWeight(.medium)
                        .font(.system(size: 12))
                        .foregroundColor(.secondary)
                }
                
                Text("\(value?.offerPrice ?? "")")
                    .fontWeight(.bold)
                    .font(.system(size: 15))
                    .bold()
                Text(value?.name ?? "Tostitos Scoops Sp")
                    .font(.system(size: 14))
                    .lineLimit(2)
                    .frame(width: 137,height:35,alignment: .leading)
                
            }.frame(width: 140)
            
            Button {
                print("Add")
            } label: {
                Text("ADD")
                    .foregroundColor(.white)
                    .bold()
                    .frame(width: 115,height: 30)
                    .background(.green)
                    .cornerRadius(4)
            }.padding(.top)
            
        }
        .frame(width: 160,height: 285)
        .overlay(content: {
            RoundedRectangle(cornerRadius: 5).stroke(.gray)
        })
        
        .onAppear {
            vm.getImage(imageUrl: value?.image ?? "")
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
