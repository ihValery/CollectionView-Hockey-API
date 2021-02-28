import Foundation

struct Photo {
    let albumId: Int?
    let id: Int?
    let title: String?
    let url: String?
    let thumbnailUrl: String?
}

struct Team: Decodable {
    let team: TeamDetails
}

struct TeamDetails: Decodable {
    let name: String?
    let conference: String?
    let location: String?
    let image: String?
    let division: String?
}

struct Player: Decodable {
    let shirt_number: Int?
    let name: String?
    let image: String?
    let team: PlayerTeam
}

struct PlayerTeam: Codable {
    let name: String?
}
