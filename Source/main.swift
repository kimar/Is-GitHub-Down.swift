#if os(Linux)
import Glibc
#endif
import Inquiline
import Curassow
import Safe
import Zeal

serve { _ in
  let result = Chan<HTTP.Response>()

  HTTPClient(host: "github.com", port: 443)
  .get("/") { result in
    do {
      let response = try result()
      result <-response
    } catch {
      // something bad happened :(
      // I mean really, really bad 🚀
    }
  }

  let response = <-result
  return Response(.Ok, contentType: "text/plain", body: response.string)
}
