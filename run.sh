#!/bin/bash
httpd -k start
tail -f /var/log/httpd/access_log
