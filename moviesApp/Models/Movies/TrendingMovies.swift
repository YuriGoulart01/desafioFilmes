import Foundation

struct TrendingMovies: Codable {
    
    var moviesResult: [Movies]
    
    enum CodingKeys:String, CodingKey {
        case moviesResult = "results"
    }
}
