#!/usr/bin/env python

""" Takes diff over stdin and looks for duplicate added/subtracted lines. Will
print lines that do not have a duplicate. Useful for FlexBuilder generated
.flexLibProperties files."""

import sys
import re

debug = False

def trace( message ):
	if debug:
		print( message )

if len( sys.argv ) > 1:
	try:
		f = open( sys.argv[1] )
	except IOError:
		print( "File not found\n%s" % sys.argv[1] )
		sys.exit( 1 )
else:
	f = sys.stdin

lines = f.readlines()

for line in lines:

	#if line is part of diff, not meta, path, etc.
	if re.search( '^[\+-](?!\+|-)', line ):

		mod = line[0]
		restofline = line[1:]
		restofline = re.sub( '(?<=[\+-])\s*', '', restofline )

		trace( "# original line: '%s'" % line )
		trace( "# nowhite original: '%s'" % restofline )

		if "+" == mod:
			opposite = "-" + restofline
		elif "-" == mod:
			opposite = "+" + restofline

		hasopposite = False

		for ln in lines:

			nowhite = re.sub( '(?<=[\+-])\s*', '', ln[:] )

			trace( "# check: '%s'" % nowhite )
			trace( "# for match: '%s'" % opposite )
			
			if nowhite == opposite: #or re.match( '\' + opposite[0] + '\s*' + restofline, ln ):
				hasopposite = True
				break

		if False == hasopposite:
			print( line )
