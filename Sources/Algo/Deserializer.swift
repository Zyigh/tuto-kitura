import Foundation

public protocol Deserializer: Decodable {
   init(data: [String: Any]) throws
}
