#!/bin/bash

tenth_char=$(head -n 1 fin | cut -c 10)
echo "$tenth_char" > fout
