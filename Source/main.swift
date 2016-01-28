#if os(Linux)
import Glibc
#endif
import Inquiline
import Curassow
import Safe
import Zeal

serve { _ in
  let result = Chan<HTTP.Response>()

  let client = HTTPClient(host: "www.apple.com", port: 80)
  client.get("/") { result in
      do {
          let response = try result()
          result <-response
      } catch {
          // something bad happened :(
      }
  }

  let response = <-result
  return Response(.Ok, contentType: "text/plain", body: response.string)
}
