# Simple HTTP server using Robot Framework
### Description
Write simple HTTP server which must return code 200 if header in struct of Get request fit template else it must return code 500.
Template is any english letter or number and length from 1 to 16.

### Run server and test suite
Run server:
```
  python2 main.py [xxxx]
```

Run tests(without running server):
```
  pybot [--variable PORT:xxxx] tests.robot
```
Additional parameter is PORT in square brackets. Default is 8080.
