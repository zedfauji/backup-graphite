rm -rf /cacheDir/statsd.log
/usr/local/bin/node /opt/graphite/statsd/stats.js /opt/graphite/statsd/local.js > /cacheDir/statsd.log &
