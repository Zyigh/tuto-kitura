import Foundation

public struct IsPrime: Codable {
    public let isPrime: Bool
    public let value: UInt
    public let divisibleBy: Int?

    public init(isPrime: Bool, value: UInt, divisibleBy: Int? = nil) {
        self.isPrime = isPrime
        self.value = value
        self.divisibleBy = divisibleBy
    }
}
