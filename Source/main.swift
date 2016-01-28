#if os(Linux)
import Glibc
#endif
import Inquiline
import Curassow
import Safe

serve { _ in
  let result = Chan<HTTP.Response>()
  http.get("http://www.google.com") { resp in
    result <- resp
  }
  let response = <- result
  return Response(.Ok, contentType: "text/plain", body: response.string)
}
