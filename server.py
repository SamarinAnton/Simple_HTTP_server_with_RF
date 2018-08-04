from BaseHTTPServer import BaseHTTPRequestHandler
import re


class HttpProcessor(BaseHTTPRequestHandler):

    def do_GET(self):
        headers = map(lambda x: x.split(':')[0], str(self.headers).splitlines())
        code = 200

        for name in headers:
            if not re.match(r'[A-Za-z0-9]{1, 16}', name):
                code = 500
                break

        self.send_response(code)
        self.end_headers()
