//
//  ContentView.swift
//  WebAndCraft
//
//  Created by abbas m h on 15/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = HomeViewModel()
    @State var searchString: String = ""
    
    var body: some View {
        NavigationStack {
            HStack{
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Search", text: $searchString)
                        .bold()
                }
                
            }
            .padding()
            .background(Color(uiColor: .lightGray))
            .cornerRadius(8)
            
            ScrollView {
                ForEach(vm.homeCells, id: \.type) { cell in
                    switch cell.type{
                    case .category:
                        ScrollView(.horizontal,showsIndicators: false) {
                            HStack{
                                ForEach(cell.values ?? [],id: \.id) { rows in
                                        CategoryView(value: rows)
                                }
                            }
                        }
                    case .banners:
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                ForEach(cell.values ?? [],id: \.id) { rows in
                                    BannerView(value: rows)
                                }
                            }
                        }
                    case .products:
                        ScrollView(.horizontal,showsIndicators: false){
                            HStack{
                                ForEach(cell.values ?? [],id: \.id) { rows in
                                    ProductView(value: rows)
                                }
                            }
                        }
                    default:
                        EmptyView()
                    }
                }
            }
            
            
        }
        .onAppear(perform: {
            vm.getHomePageComponents()
        })
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
