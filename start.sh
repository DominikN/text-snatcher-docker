#!/bin/sh
dbus-daemon --session --fork
exec com.github.rajsolai.textsnatcher
