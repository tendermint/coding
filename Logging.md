# Logging

Logging is an important part of understanding a running system, but definitely [not the only one](Instrumentation.md). To summarize a [nice comparison](https://blog.raintank.io/logs-and-metrics-and-graphs-oh-my/), logging let's you drill down to the level of individual request at the cost of much more space, while metrics allow you to log **much** more information but only at an aggregate level.

This topic has evolved from `printf`s in the code to full-fledged frameworks, and merits a longer discussion. However, to get started, I provide some links to think.  Please add your views to the discussion....

Always interesting to read [Dave Cheney's view on this point](https://dave.cheney.net/2015/11/05/lets-talk-about-logging).  TL;DR:

  I believe that there are only two things you should log:

  * Things that developers care about when they are developing or debugging software.
  * Things that users care about when using your software.

  Obviously these are debug and info levels, respectively.

There is also a movement towards [structed logging](https://www.elastic.co/blog/structured-logging-filebeat), ie. storing all variables as key-value pairs for indexing, rather than using `Sprintf` style interpolation. The big advantage here is machine-readability, which allows you to feed the results into the [ELK stack](http://logz.io/learn/complete-guide-elk-stack/), [graylog](https://www.graylog.org/), [splunk](https://www.splunk.com/) or other system. To get a feel for what is possible from this, here are some examples of [visualizations directly generated from structured log files](http://blog.webkid.io/visualize-datasets-with-elk/).

One special case of logging is error reporting. When you have a system in production, you only need to look at logs and metrics, when you want to learn more about how the system is functioning.  However, it is nice to record errors differently, both to alert a sysadmin/developer as soon as they occur, as well as to record a much larger amount of information for these cases. As they are quite infrequent, we can afford to log much more than at the info level, such as stack traces, that help to locate the cause quickly. Some logging systems, such as logrus, allow you to [easily add hooks to send errors to a reporting service](https://github.com/sirupsen/logrus#hooks). One example of an error reporting service, which I like, is [rollbar](https://rollbar.com/error-tracking/golang/) - you can click on the live demo to see what it looks like.  To use such a system, one must provide configuration options, so the person deploying the code can select where to send the errors, and with which API key, so only they can see this info.
