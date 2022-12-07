import Foundation

struct TrendingActors: Codable {
    
    var actorsResult: [Actors]
    
    enum CodingKeys:String, CodingKey {
        case actorsResult = "results"
    }
}
