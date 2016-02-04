#if os(Linux)
import Glibc
#endif
import Inquiline
import Curassow
import CcURL

func getHandle (url: String) -> UnsafeMutablePointer<Void> {
  let handle = curl_easy_init()
  curl_easy_setopt_string(handle, CURLOPT_URL, url)
  curl_easy_setopt_bool(handle, CURLOPT_VERBOSE, true)
  return handle
}

serve { _ in
  return Response(.Ok, contentType: "text/plain", body:
    curl_easy_perform(getHandle("https://github.com")) == CURLE_OK ? "NOPE, happy coding!" : "Unfortunately, yes :-("
  )
}
