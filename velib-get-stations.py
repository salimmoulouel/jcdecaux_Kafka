#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Thu Dec  3 16:13:09 2020

@author: kafkastormuser
"""

import json
import time
import urllib.request

from kafka import KafkaProducer

API_KEY = "9a77279e74bf1aa4c822618fd893d3d33f69e848" # FIXME Set your own API key here
url = "https://api.jcdecaux.com/vls/v1/stations?apiKey={}".format(API_KEY)

producer = KafkaProducer(bootstrap_servers="localhost:9092")

while True:
    response = urllib.request.urlopen(url)
    stations = json.loads(response.read().decode())
    for station in stations:
        producer.send("velib-stations", json.dumps(station).encode(),key=str(station["number"]).encode())
    print("{} Produced {} station records".format(time.time(), len(stations)))
    time.sleep(1)