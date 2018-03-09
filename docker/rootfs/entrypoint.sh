#!/usr/bin/env bash

chmod -R a+w /src

exec /usr/bin/supervisord -n
