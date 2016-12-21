import Core
import HTTP
import Vapor

public final class FaviconMiddleware: Middleware {
  let loader = DataFile()
  var iconPath: String
  var headers: [HeaderKey: String]
  var body: Body?

  // default maxAge is 1 day
  public init(_ path: String, maxAge: Int = 86400000) {
    iconPath = path
    headers = [
      "Content-Type": "image/x-icon",
      "Cache-Control": "public, max-age=\(maxAge / 1000)"
    ]
  }

  public func respond(to request: Request, chainingTo next: Responder) throws -> Response {
    if request.uri.path != "/favicon.ico" {
      return try next.respond(to: request)
    }

    // Favicon is only allowed on GET, HEAD, OPTIONS
    let allowed: [Method] = [.get, .head]

    if !allowed.contains(request.method) {
      var status = Status.methodNotAllowed

      if case .options = request.method {
        status = .ok
      }

      return Response(status: status, headers: ["Allow": "GET, HEAD, OPTIONS"])
    }

    if body != nil {
      return Response(status: .notModified, headers: headers, body: body!)
    }

    do {
      // Read file from workDir path
      let bytes = try loader.load(path: iconPath)
      body = .data(bytes)

      return Response(status: .ok, headers: headers, body: body!)
    } catch {
      return Response(
        status: .internalServerError,
        headers: ["Content-Type": "text/plain"],
        body: "Favicon icon is not loaded"
      )
    }
  }
}
