#!/usr/bin/env python3

import requests
x = requests.get('https://www.google.com')

if x.status_code == 200:
    print("Grreeeeat it works!!! Code 200! ")
else:
    print("Bummer the code wasn't 200!! ")