import Foundation
import HeliumLogger
import Kitura

HeliumLogger.use()
let router = Router(mergeParameters: true,
                    enableWelcomePage: false)

router.defaultResponseMediaType = MediaType(type: .application, subType: "json")
router.all(middleware: ErrorHandler())

IsPrime().register(router: router)

Kitura.addHTTPServer(onPort: 8888, with: router)
Kitura.run()
