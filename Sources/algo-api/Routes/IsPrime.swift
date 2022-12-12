import Foundation
import Kitura
import LoggerAPI
import App
import Algo

class IsPrime: Routes {
    let primeService = PrimeService()

    func register(router: Router) {
        Log.info("Registering IsPrime")

        let subrouter = router.route("/prime")
    
//        subrouter.get("/", middleware: ParamConverter<GetIsPrime>())
//        subrouter.get("/", handler: getIsPrime)
        subrouter.get("/:n", middleware: ParamConverter<GetIsPrime>())
        subrouter.get("/:n", handler: getIsPrime)
    }
    
    func getIsPrime(req: RouterRequest, res: RouterResponse, next: () -> Void ) throws {
        guard let facade = req.userInfo[DeserializerKey] as? GetIsPrime else {
            return
        }

        switch self.primeService.isPrime(facade: facade) {
        case .ok(let model):
            res.send(json: model)
            next()
        case .err(let e):
            Log.error(e.localizedDescription)
            res.error = ErrorModel(
                statusCode: HTTPStatusCode.badRequest.rawValue,
                message: e.localizedDescription)
        }
    }
}
