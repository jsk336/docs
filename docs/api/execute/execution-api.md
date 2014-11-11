# Execution API page

The execution context structure is globally accessible and allows all services a channel by which they can talk to other services. 

The following service interfaces are required: 

* [[SampleTracker|sampletracker-interface]] : CRUD tool for talking to database of samples in system
* [[StockManager|stockmanager-interface]] : CRUD tool for talking to database of stocks 
* [[Logger|logger-interface]] : Simple logging daemon
* [[Scheduler|scheduler-interface]] : Handles requests for movement, liquid handling and other device interaction
* [[GarbageCollector|gc-interface]] : Holds a reaper queue

Additionally, the execution context must hold the following channels, which should only be accessible directly by the scheduler 

* [[LiquidHandler|liquidhandler-interface]] : Logical interface for requesting any kind of liquid handling operation
* [[Mover|mover-interface]] : Logical interface for requesting movement of entities
* [[Platereader|platereader-interface]] : Logical interface to spectrophotometry
* [[Store|store-interface]] : Logical interface to storage devices
