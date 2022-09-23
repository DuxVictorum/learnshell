#!/bin/bash -i

ll ~/ | sort -k5 | awk '$5 > 10000 {print $0}'
