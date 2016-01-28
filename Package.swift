import PackageDescription

let package = Package(
  name: "Is-GitHub-Down",
  dependencies: [
    .Package(url: "https://github.com/kylef/Curassow.git", majorVersion: 0, minor: 2),
    .Package(url: "https://github.com/tidwall/Safe.git", majorVersion: 1, minor: 2),
    .Package(url: "https://github.com/interstateone/Zeal.git", majorVersion: 0, minor: 1),
    .Package(url: "https://github.com/Zewo/CURIParser.git", majorVersion: 0, minor: 1)
  ]
)
