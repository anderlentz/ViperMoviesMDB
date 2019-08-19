//
//  FetchMovieData.swift
//  ViperMoviesssDB
//
//  Created by Luiz Pedro Franciscatto Guerra on 19/08/19.
//  Copyright © 2019 Luiz. All rights reserved.
//

import Foundation

class FetchPopularMovieData: FetchPopularMooviesProtocol {
    
    func fetchData() {
        
        guard let url = URL(string: "https://api.themoviedb.org/3/movie/popular?api_key=e7874dc70ec5827126c27e68c1c85962&language=en-US&page=1") else { return }
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                guard let jsonAsString = String(data: data, encoding: .utf8)?.data(using: .utf8) else { return }
                do {
                    let pr = try JSONDecoder().decode(PopularMoviesResult.self, from: jsonAsString)
                    print(pr)
                } catch {
                    print("error")
                }
            }
            }.resume()
        
    }
    
}