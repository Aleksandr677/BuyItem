//
//  APICaller.swift
//  Test_App
//
//  Created by Христиченко Александр on 2022-08-29.
//

import Foundation

class APICaller {
    
    static let shared = APICaller()
    
    //hot phone section
    func getHotSalesPhone(complition: @escaping(Result<[HotSalesPhone], Error>) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(HomeStore.self, from: data)
                complition(.success(results.home_store))
            } catch {
                complition(.failure(error))
            }
        }
        task.resume()
    }
    
    //best phone section
    func getBestSellerPhone(complition: @escaping(Result<[BestSellerPhone], Error>) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/654bd15e-b121-49ba-a588-960956b15175") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(BestSeller.self, from: data)
                complition(.success(results.best_seller))
            } catch {
                complition(.failure(error))
            }
        }
        task.resume()
    }
    
    //product details section
    func getProductDetails(complition: @escaping(Result<DetailModel, Error>) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/6c14c560-15c6-4248-b9d2-b4508df7d4f5") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(DetailModel.self, from: data)
                complition(.success(results))
            } catch {
                complition(.failure(error))
            }
        }
        task.resume()
    }
    
    //user's cart info section
    func getMyCartInfo(complition: @escaping(Result<MyCartModel, Error>) -> Void) {
        guard let url = URL(string: "https://run.mocky.io/v3/53539a72-3c5f-4f30-bbb1-6ca10d42c149") else { return }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else { return }
            
            do {
                let results = try JSONDecoder().decode(MyCartModel.self, from: data)
                complition(.success(results))
            } catch {
                complition(.failure(error))
            }
        }
        task.resume()
    }
}
