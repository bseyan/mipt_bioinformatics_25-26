#!/bin/bash
sum=$(awk '{print $1 + $2 + $3}' fin)
echo "$sum" > fot

