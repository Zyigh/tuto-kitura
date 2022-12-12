import Foundation
import Kitura
import Algo
import LoggerAPI

class ErrorHandler: RouterMiddleware {
    func handle(request: RouterRequest, response: RouterResponse, next: @escaping () -> Void) throws {
        next()
        guard response.error != nil else {
            return
        }
        
        if let err = response.error as? ErrorModel {
            if err.developerMessage != nil {
                Log.error(err.developerMessage!)
            }

            response.status(
                HTTPStatusCode(rawValue: err.statusCode) ?? .internalServerError
            )
            response.send(json: err)
            
            return
        }

        if response.error != nil {
            Log.error(response.error!.localizedDescription)
            response
                .status(HTTPStatusCode.internalServerError)
                .send(json: ErrorModel(
                    statusCode: HTTPStatusCode.internalServerError.rawValue,
                    message: "internal server error",
                    developerMessage: response.error!.localizedDescription
                )
            )
        }
    }
}
