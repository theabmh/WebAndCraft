//
//  CategoryView.swift
//  WebAndCraft
//
//  Created by abbas m h on 15/04/23.
//

import SwiftUI

struct CategoryView: View {
    var value : Value?
    @StateObject var vm = CategoryViewModel()
    var body: some View {
        ZStack{
            VStack{
                if let image = vm.categoryImage{
                    
                    Image(uiImage: image)
                        .resizable()
                        .frame(width: 50,height: 50)
                }else{
                    Spacer()
                }
                Text(value?.name ?? "")
                    .font(.system(size: 13))
                    .fontWeight(.medium)
            }.frame(width: 70,height: 88)
        }.onAppear {
            vm.getImage(imageUrl: value?.imageURL ?? "")
        }
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
