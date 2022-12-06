import Foundation

struct TrendingSeries: Codable {
    
    var seriesResult: [Series]
    
    enum CodingKeys:String, CodingKey {
        case seriesResult = "results"
    }
}
