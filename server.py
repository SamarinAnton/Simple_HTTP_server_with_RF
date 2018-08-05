from BaseHTTPServer import BaseHTTPRequestHandler
import re


class HttpProcessor(BaseHTTPRequestHandler):

    def do_GET(self):
        custom_header = str(self.headers).splitlines()[-1].split(':')[0]
        code = 200

        if not re.match(r'\A[a-zA-Z0-9]{1,16}\Z', custom_header):
            code = 500

        self.send_response(code)
        self.end_headers()
