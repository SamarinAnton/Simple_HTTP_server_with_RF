from BaseHTTPServer import HTTPServer
from server import HttpProcessor
import sys

port = 8080
host = 'localhost'

if __name__ == '__main__':

    if len(sys.argv) == 2:
        port = int(sys.argv[1])

    print 'Server: http://{0}:{1}'.format(host, port)

    server = HTTPServer((host, port), HttpProcessor)
    server.serve_forever()
