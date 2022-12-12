import Foundation
import LoggerAPI

public enum InputError: LocalizedError {
    case missingN, invalidValueForN
    
    public var errorDescription: String? {
        switch self {
        case .missingN:
            return "missing numeric value n"
        case .invalidValueForN:
            return "n should be numeric and > 0 and <= \(UInt.max)"
        }
    }
}

public struct GetIsPrime: Deserializer {
    public let n: UInt
    
    public init(data: [String: Any]) throws {
        guard let nStr = data["n"] as? String else {
            throw InputError.missingN
        }
        
        let n = UInt(nStr) ?? 0
        guard n > 0 else {
            throw InputError.invalidValueForN
        }

        self.n = n
    }
}

