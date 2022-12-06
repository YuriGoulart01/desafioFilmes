import Foundation

struct Series: Codable {
    
    var title: String
    var voteAverage: Double
    var voteCount: Int
    var imageLinkId: String
    var releaseDate: String
    var resume: String
    var imageUrl: String = "https://image.tmdb.org/t/p/w500/"
    
    enum CodingKeys: String, CodingKey {
        
        case title = "name"
        case releaseDate = "first_air_date"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case resume = "overview"
        case imageLinkId = "poster_path"
        
    }
}
