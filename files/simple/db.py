#!/usr/bin/python

import PyMySQL

# Open database connection
db = PyMySQL.connect(host='127.0.0.1',user='wspark',password='rplinux',database='egov' )
#db = MySQLdb.connect("user='wspark', password='rplinux',
#                              host='127.0.0.1',
#                              database='egov'" )

# prepare a cursor object using cursor() method
cursor = db.cursor()

# execute SQL query using execute() method.
cursor.execute("SELECT VERSION()")

# Fetch a single row using fetchone() method.
data = cursor.fetchone()

print "Database version : %s " % data

# disconnect from server
db.close()


