# Change working directory so relative paths (and template lookup) work again
import os
import sys

dir = os.path.dirname(__file__)
os.chdir( dir )
sys.path.insert(0, dir )

import APP 
application = APP.app

# vim: ft=python
