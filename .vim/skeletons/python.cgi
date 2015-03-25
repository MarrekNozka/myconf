#!/usr/bin/python
from wsgiref.handlers import CGIHandler
from YOURAPPLICATION import app

CGIHandler().run(app)
