import Foundation

protocol ActorsParseDelegate: AnyObject {
    func actorsList (_ actorsList: [Actors])
    func ActorsError (_ error: Error)
}

struct ActorsParse {
    
    let url = "https://api.themoviedb.org/3/trending/person/week?api_key=d8ab08a45dfeb6ee6317a10b502a476a"
    weak var delegate: ActorsParseDelegate?
    
    func actorsParse () {
        
        let fullUrl = url
        
        if let fullUrl = URL(string: fullUrl) {
            let session = URLSession.shared
            let task = session.dataTask(with: fullUrl) {data, response, error in
                if let error = error {
                    delegate?.ActorsError(error)
                    return
                }
                
                if let data = data, let actors = self.actorsDecoder(data) {
                    self.delegate?.actorsList(actors.actorsResult)
                }
            }
            task.resume()
        }
        
    }
    
    
    func actorsDecoder (_ actorsData: Data) -> TrendingActors? {
        let decoder = JSONDecoder()
        
        do {
            let actorsDataDecoded = try decoder.decode(TrendingActors.self, from: actorsData)
            return actorsDataDecoded
        } catch let error {
            delegate?.ActorsError(error)
            return nil
        }
    }
}
