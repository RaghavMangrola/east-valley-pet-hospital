import Kitura
import LoggerAPI
import HeliumLogger
import KituraStencil

HeliumLogger.use()
let router = Router()
router.setDefault(templateEngine: StencilTemplateEngine())

router.all("/static", middleware: StaticFileServer())

router.get("/") { request, response, next in
  defer { next() }
  try response.render("home", context: [:])
}

router.get("/staff/:name") { request, response, next in
  defer { next() }

  guard let name = request.parameters["name"] else {
    return
  }

  let bios = [
    "raghav": "My name is Raghav Mangrola and I love all dogs.",
    "parth": "My name is Parth and I don't like dogs very much",
    "maya": "My name is Maya and I'm a crazy cat lady",
    "harisinh": "My name is Harisinh and I love all animals"
  ]

  var context = [String: Any]()
  context["people"] = bios.keys.sorted()

  if let bio = bios[name] {
    context["name"] = name
    context["bio"] = bio
  }

  try response.render("staff", context: context)
}

router.get("/contact") { request, response, next in
  defer { next() }
  try response.render("contact", context: [:])
  next()
}

Kitura.addHTTPServer(onPort: 8090, with: router)
Kitura.run()