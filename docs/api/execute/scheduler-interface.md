# Scheduler

The scheduler maintains a queue of requests for actions to be taken.

Requests are parameterised with serializable map functions defining what type of request is being made and its parameters. 

     Submit(Request)
         - add a request to the queue
     Delete(RequestID)
         - delete a request from the queue
     Alter(RequestID, Request)
         - alter a request in the queue
     List(Filter) []Request
         - retrieve a list of requests currently queued, optionally filtered 