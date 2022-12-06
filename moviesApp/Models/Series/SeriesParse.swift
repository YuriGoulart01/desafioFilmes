import Foundation

protocol SeriesParseDelegate: AnyObject {
    func seriesList (_ seriesList: [Series])
    func seriesError (_ error: Error)
}

struct SeriesParse {
    
    let url = "https://api.themoviedb.org/3/trending/tv/week?api_key=d8ab08a45dfeb6ee6317a10b502a476a"
    weak var delegate: SeriesParseDelegate?
    
    func seriesParse () {
        
        let fullUrl = url
        
        if let fullUrl = URL(string: fullUrl) {
            let session = URLSession.shared
            let task = session.dataTask(with: fullUrl) {data, response, error in
                if let error = error {
                    delegate?.seriesError(error)
                    return
                }
                
                if let data = data, let series = self.seriesDecoder(data) {
                    self.delegate?.seriesList(series.seriesResult)
                }
            }
            task.resume()
        }
        
    }
    
    
    func seriesDecoder (_ seriesData: Data) -> TrendingSeries? {
        let decoder = JSONDecoder()
        
        do {
            let seriesDataDecoded = try decoder.decode(TrendingSeries.self, from: seriesData)
            return seriesDataDecoded
        } catch let error {
            delegate?.seriesError(error)
            return nil
        }
    }
}
