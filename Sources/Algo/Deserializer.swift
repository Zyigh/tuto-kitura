import Foundation

public protocol Deserializer {
   init(data: [String: Any]) throws
}
