#!/usr/bin/env python

import datetime
import json
from optparse import OptionParser
from optparse import make_option
import os
import subprocess
import sys
import tempfile

from pyamf import sol
from pyamf import DecodeError

class FlashCookie:
	"""Reads and edits Flash SharedObjects"""
	
	def __init__(self, f):
		"""Reads and edits Flash SharedObjects"""
		self.file_path = f
		self.shared_object = sol.load(f)
	
	def read(self):
		"""Returns json representation of shared object."""
		return json.dumps(self.shared_object, 
						  skipkeys=True, 
						  sort_keys=True, 
						  indent=4, 
						  cls=FlashCookieEncoder)
	
	def flush_and_sync(self, f):
		"""Call after writing to file to make sure all contents written to f
		are actually there.
		"""
		f.flush()
		os.fsync(f.fileno())
	
	def edit(self):
		"""Edit the json representation of shared object."""
		f = tempfile.NamedTemporaryFile(dir=tempfile.gettempdir(), mode='w+t')
		
		#write cookie contents
		f.write(self.read())
		self.flush_and_sync(f)
		
		#launch editor
		edit_process = subprocess.call([os.getenv('EDITOR'), f.name])
		#TODO check return value of edit process
		self.flush_and_sync(f)
		
		#recreate json obj from edited file
		obj = json.load(open(f.name))
		
		for k,v in obj.iteritems():
			self.shared_object[k] = v
		
		sol.save(self.shared_object, self.file_path)
		f.close()

class FlashCookieEncoder(json.JSONEncoder):
	"""Custom json encoder, handles datetime objects. """
	def default(self, obj):
		if isinstance(obj, datetime.datetime):
			return obj.isoformat()
		return json.JSONEncoder.default(self, obj)


usage = 'usage: %prog [-e] file'
description = 'View contents of and edit the contents of Flash cookies (SharedObjects)'
options = [
	make_option('-e', '--edit', 
				action='store_true',
				dest='edit',
				help='launch $EDITOR and edit json-encoded cookie contents.'),
]
errors = [
	(os.getenv('EDITOR'), 'EDITOR environment variable is not set'),
]


def main():
	op = OptionParser(option_list=options, usage=usage, description=description)
	(opts, args) = op.parse_args()

	#check required arg - filepath
	if len(args) != 1:
		op.print_help()
		sys.exit(1)
	
	#check that filepath exists
	if not os.path.isfile(args[0]):
		op.error('File does not exist:\n%s' % args[0])
		sys.exit(1)
	
	#check for required env vars
	if opts.edit:
		es = [ e[1] for e in errors if None == e[0] ]
		if len(es):
			sys.exit('\n'.join(es))
	
	fc = FlashCookie(args[0])
	
	if not opts.edit:
		print(fc.read())
	else:
		fc.edit()

if __name__ == '__main__':
	main()

