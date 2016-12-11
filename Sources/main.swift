import Kitura
import LoggerAPI
import HeliumLogger

HeliumLogger.use()
let router = Router()

router.all("/") { request, response, next in
  response.send("Hello, Kitura!")
}

Kitura.addHTTPServer(onPort: 8090, with: router)
Kitura.run()