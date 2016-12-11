import Kitura
import LoggerAPI
import HeliumLogger

HeliumLogger.use()
let router = Router()

router.get("/") { request, response, next in
  response.send("Welcome to East Valley Pet Hospital")
  next()
}

router.get("/staff") { request, response, next in
  response.send("Meet our great team")
  next()
}

router.get("/contact") { request, response, next in
  response.send("Get in touch with us")
  next()
}

Kitura.addHTTPServer(onPort: 8090, with: router)
Kitura.run()