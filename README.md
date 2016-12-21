# Vapor Favicon Middleware

![Swift](http://img.shields.io/badge/swift-3.0-brightgreen.svg)
![Platforms](https://img.shields.io/badge/platforms-Linux%20%7C%20OS%20X-blue.svg)
![Package Managers](https://img.shields.io/badge/package%20managers-SwiftPM-yellow.svg)

> Favicon serving middleware for [Vapor](https://vapor.codes).

## Installation

Via Swift Package Manager:

```swift
.Package(url: "https://github.com/voronianski/vapor-favicon-middleware.git", majorVersion: 1)
```

## Usage

```swift
import Vapor
import VaporFaviconMiddleware

let drop = Droplet()

// path to favicon image in workDir
let faviconPath = drop.workDir.appending("/Public/assets/favicon.png")
drop.middleware.append(FaviconMiddleware(faviconPath))

// or you can also overwrite default cache-control max-age directive in ms (defaulting to 1 day)
let maxAge = 1000 * 60 * 60 * 24 * 365 // 1 month
drop.middleware.append(FaviconMiddleware(faviconPath, maxAge: maxAge))
```

---

**MIT Licensed**
