import Foundation

public enum Result<T> {
    case ok(T)
    case err(Error)
}
