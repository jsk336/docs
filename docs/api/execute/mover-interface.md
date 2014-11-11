# Mover

The mover takes requests for moving items from one place to another. It presents a logical interface to whatever is physically moving things around, and may potentially be in charge of multiple physical actuators. 

As with other services it performs requests in the order in which they are received. 

    Move(MovementRequest)
     - parameterised request to move any entity in the system to a 
       particular location, specified as a guid