#if os(Linux)
import Glibc
#endif
import Inquiline
import Curassow
import CcURL

serve { _ in
  let url = "https://github.com"

  let handle = curl_easy_init()
  curl_easy_setopt_string(handle, CURLOPT_URL, url)
  curl_easy_setopt_bool(handle, CURLOPT_VERBOSE, true)

  let ret = curl_easy_perform(handle)
  let error = curl_easy_strerror(ret)

  print("ret = \(ret)")
  print("error = \(error)")

  return Response(.Ok, contentType: "text/plain", body: String.fromCString(ret))
}
