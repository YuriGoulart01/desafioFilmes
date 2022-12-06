import Foundation

protocol MoviesParseDelegate: AnyObject {
    func moviesList (_ moviesList: [Movies])
    func moviesError (_ error: Error)
}

struct MoviesParse {
    
    let url = "https://api.themoviedb.org/3/trending/movie/week?api_key=d8ab08a45dfeb6ee6317a10b502a476a"
    weak var delegate: MoviesParseDelegate?
    
    func moviesParse () {
        
        let fullUrl = url
        
        if let fullUrl = URL(string: fullUrl) {
            let session = URLSession.shared
            let task = session.dataTask(with: fullUrl) {data, response, error in
                if let error = error {
                    delegate?.moviesError(error)
                    return
                }
                
                if let data = data, let movies = self.moviesDecoder(data) {
                    self.delegate?.moviesList(movies.moviesResult)
                }
            }
            task.resume()
        }
        
    }
    
    
    func moviesDecoder (_ moviesData: Data) -> TrendingMovies? {
        let decoder = JSONDecoder()
        
        do {
            let moviesDataDecoded = try decoder.decode(TrendingMovies.self, from: moviesData)
            return moviesDataDecoded
        } catch let error {
            delegate?.moviesError(error)
            return nil
        }
    }
}
