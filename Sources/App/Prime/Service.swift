import Foundation
import Algo

public class PrimeService {
    public init(){}

    public func isPrime(facade: GetIsPrime) -> Result<IsPrime> {
        guard facade.n != 1 else {
            return .ok(IsPrime(isPrime: false, value: 1))
        }
        
        guard facade.n != 2 else {
            return .ok(IsPrime(isPrime: true, value: facade.n))
        }
        
        guard facade.n % 2 != 0 else {
            return .ok(IsPrime(isPrime: false, value: facade.n, divisibleBy: 2))
        }
        
        return .ok(computePrime(n: facade.n))
    }
    
    func computePrime(n: UInt) -> IsPrime {
        for d in stride(from: 3, to: sqrt(Double(n)).rounded(), by: 2) {
            if n % UInt(d) == 0 {
                return IsPrime(isPrime: false, value: n, divisibleBy: Int(d))
            }
        }
        
        return IsPrime(isPrime: true, value: n)
    }
}
