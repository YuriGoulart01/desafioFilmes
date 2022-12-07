import Foundation

struct Actors: Codable {
    
    var name: String
    var popularity: Double
    var knownForDepartament: String?
    var KnowFor: [Movies]?
    var actorImage: String?
    var imageUrl: String = "https://image.tmdb.org/t/p/w500"
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case popularity = "popularity"
        case knownForDepartament = "known_for_department"
        case KnowFor = "known_for"
        case actorImage = "profile_path"
    }
}
