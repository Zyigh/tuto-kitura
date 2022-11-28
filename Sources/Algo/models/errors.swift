import Foundation

public struct ErrorModel: Error, Encodable {
    public let statusCode: Int
    public let message: String
    public let developerMessage: String?
    
    public init(statusCode: Int, message: String, developerMessage: String? = nil) {
        self.statusCode = statusCode
        self.message = message
        self.developerMessage = developerMessage
    }
}
