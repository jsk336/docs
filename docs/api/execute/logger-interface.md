# Logger

The logger writes text to logs and deals with error streams

Functions:

    Log(level int, ... string)
     - write text to the log, the log level defines precisely how

    Error(level int, err Error)
     - notify all listeners that this error has taken place.
       The Error structure provides further information via the 
       usual key/value method