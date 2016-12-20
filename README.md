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
drop.middleware.append(FaviconMiddleware("/Public/assets/favicon.png"))
```

---

**MIT Licensed**
