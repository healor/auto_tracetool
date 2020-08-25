#!/bin/bash

while true; do smartctl -a $1 >> smart_$2.log; sleep 5; done
#while true; do nvme smart-log $1 >> smart_$2.log; sleep 5; done
