#!/bin/bash

while true; do smartctl -a $1 >> smart_$2.log; sleep 5; done
