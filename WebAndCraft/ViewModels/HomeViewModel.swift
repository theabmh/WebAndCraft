//
//  HomeViewModel.swift
//  WebAndCraft
//
//  Created by abbas m h on 15/04/23.
//

import Foundation
import Combine


class HomeViewModel : ObservableObject {
    
    @Published var isLoading = true
    @Published var homeCells: [HomeDatum] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    func getHomePageComponents(){
        
        let url = "https://run.mocky.io/v3/69ad3ec2-f663-453c-868b-513402e515f0"
        
        guard let url = URL(string:url) else { print("URL not found");return}
        URLSession.shared.dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global(qos: .background))
            .receive(on: DispatchQueue.main)
            .tryMap { (data, response) -> Data in
                guard let httpResponse = response as? HTTPURLResponse, 200...299 ~= httpResponse.statusCode else {
                    throw URLError(.badServerResponse)
                }
                return data
            }
            .decode(type: Home.self, decoder: JSONDecoder())
            .sink { completion in
                switch completion{
                case .finished:
                    print("Home Components Fetched Successfully")
                case .failure(let err):
                    print("Error :- \(err.localizedDescription)")
                }
            } receiveValue: {[weak self] home in
                self?.isLoading = false
                self?.homeCells = home.homeData ?? []
            }
            .store(in: &cancellables)
    }
    
    
}
