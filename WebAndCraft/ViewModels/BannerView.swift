//
//  BannerView.swift
//  WebAndCraft
//
//  Created by abbas m h on 15/04/23.
//

import SwiftUI

struct BannerView: View {
    @StateObject var vm = CategoryViewModel()
    var value : Value?
    var body: some View {
        VStack{
            if let image = vm.categoryImage{
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 330,height: 180)
            }else{
                ProgressView()
            }
        }.onAppear {
            vm.getImage(imageUrl: value?.bannerURL ?? "")
        }
    }
}

struct BannerView_Previews: PreviewProvider {
    static var previews: some View {
        BannerView()
    }
}
