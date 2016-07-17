#!/bin/bash

find ~/fixtures -type f | xargs ~/repository/quickrun -f json | jq '.'
