#!/usr/bin/env python

import sys
from PIL import ImageGrab

filename = sys.argv[1]
image = ImageGrab.grab()
image.save(filename)
