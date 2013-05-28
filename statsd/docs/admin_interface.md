TCP Stats Interface
-------------------

A really simple TCP management interface is available by default on port 8126
or overriden in the configuration file. Inspired by the memcache stats approach
this can be used to monitor a live statsd server.  You can interact with the
management server by telnetting to port 8126, the following commands are
available:

* stats - some stats about the running server
* counters - a dump of all the current counters
* gauges - a dump of all the current gauges
* timers - a dump of the current timers
* health - a way to set the health status of statsd

The stats output currently will give you:

* uptime: the number of seconds elapsed since statsd started
* messages.last_msg_seen: the number of elapsed seconds since statsd received a
  message
* messages.bad_lines_seen: the number of bad lines seen since startup

Each backend will also publish a set of statistics, prefixed by its
module name.

You can use this to delete buckets no longer in use. For example, if you were hosting statsd at 10.10.10.10:

    #to delete counter sandbox.test.temporary
    echo "delcounters sandbox.test.temporary" | nc 10.10.10.10 8126

Graphite:

* graphite.last_flush: unix timestamp of last successful flush to graphite
* graphite.last_exception: unix timestamp of last exception thrown whilst flushing to graphite
* graphite.flush_length: the length of the string sent to graphite
* graphite.flush_time: the time it took to send the data to graphite

Those statistics will also be sent to graphite under the namespaces
`stats.statsd.graphiteStats.last_exception` and
`stats.statsd.graphiteStats.last_flush`.

A simple nagios check can be found in the utils/ directory that can be used to
check metric thresholds, for example the number of seconds since the last
successful flush to graphite.

The health output:
* the health command alone allows you to see the current health status.
* using health up or health down, you can change the current health status.
* the healthStatus configuration option allows you to set the default health status at start.

