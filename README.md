# Rover Core
Core rover communications and data are routed through the rover core, which
allows modules to push their data to a central datastore and subscribe to 
updates to rover state.

Rover Core uses Redis for message routing and data storage.

## Communication
Rover modules can communicate directly via Redis Pub/Sub channels. As part of
protocol, modules must pulish `value` to `updates:key` when changing `key` to
`value`, which allows other modules to listen for updates to the key and react
appropriately to the new value.

The message a module directly, publish to the corresponding `msg:<module name>`
channel. If a reply is desired, the name of the publisher should be included in
the message contents. The reply will be delivered with `reply` in the contents.

## Data
* Odometry
    * Fused and unfused sensor data
* Sensor Suite
    * UV sensor
    * Barometer
* Manipulator configuration
* Rover task queue
    * Navigation waypoints
    * Manipulator waypoints
* System Data
    * CPU
    * RAM
    * Network latency
    * Video feeds
* Rover Status
    * Modules Status
    * Motor information
* Administration
    * Control Panel sessions and authorization
    * Autonomy level