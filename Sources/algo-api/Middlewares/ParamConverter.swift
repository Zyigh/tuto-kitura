import Foundation
import Kitura
import Algo
import LoggerAPI

public let DeserializerKey = "deserializer"

public class ParamConverter<T: Deserializer>: RouterMiddleware {
    public func handle(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
        var params: [String: Any] = [:]
        
        
        dump(request)
        
        for (k, v) in request.parameters {
            params[k] = v
        }
        
        for (k, v) in request.queryParameters {
            params[k] = v
        }
        
        if let body = request.body {
            if let contentType = request.headers["Content-Type"] {
                if contentType == "application/x-www-form-urlencoded" {
                    for (k, v) in (body.asURLEncoded ?? [:]) {
                        params[k] = v
                    }
                }
            }
        }
        
        do {
            let deserializer = try T.init(data: params)
            request.userInfo[DeserializerKey] = deserializer
        } catch let e as LocalizedError {
            response.error = ErrorModel(
                statusCode: HTTPStatusCode.badRequest.rawValue,
                message: "bad request",
                developerMessage: e.errorDescription)
            return
        } catch {
            throw error
        }
        next()
    }
}
