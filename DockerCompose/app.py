import os
import string
import psycopg2
import psycopg2.extras
from flask import Flask, render_template, request, redirect, url_for, abort, session
import HTML
import datetime
from time import gmtime, strftime
import time
import sys
app = Flask(__name__)

containeridx = os.environ["HOSTNAME"]
databasehost = os.environ["PGDB_PORT_5432_TCP_ADDR"]
conn_string = "dbname='ipss' user='postgres' host=" + (databasehost) + " password='postgres'"
	# get a connection, if a connect cannot be made an exception will be raised here
conn = psycopg2.connect(conn_string)
 
	# conn.cursor will return a cursor object, you can use this cursor to perform queries
try:
    conn = psycopg2.connect(conn_string)
except:
    print "I am unable to connect to the database"


#xcursor = conn.cursor('cursor_xunique_name', cursor_factory=psycopg2.extras.DictCursor)

#xcursor.execute('INSERT INTO temp.containers (containerid, time) VALUES (3 , 5)')
#xcursor.execute("INSERT INTO temp.containers (containerid, time) VALUES (%s, %s)", (100, "abc'def"))
#xcursor.execute("""INSERT INTO temp.containers (containerid, time) VALUES (%s, %s);""" (10, datetime.date(2005, 11, 18)))

xcursor = conn.cursor()
xcursor.execute("INSERT INTO temp.containers (containerid, time) VALUES (%s, %s)", (containeridx, strftime("%Y-%m-%d %H:%M:%S", gmtime())))
#xcursor.execute("INSERT INTO temp.containers VALUES ('test' , 'test')")


#conn.commit()
#xcursor.close()
#x = xcursor.fetchall()
#print(x)

#dont close connection yet
#conn.close()

@app.route('/')
def index():

 cursor = conn.cursor('cursor_unique_name', cursor_factory=psycopg2.extras.DictCursor)

 cursor.execute('SELECT * FROM temp.containers')

 row_count = 0
 t = HTML.Table(header_row=['ContainerID', 'timestamp'])

 for row in cursor:
   row_count += 1
   t.rows.append([row_count, row])
   #t.rows.append(([%s , %s]) % (row_count, row))
   #print "row: %s    %s\n" % (row_count, row)
 htmlcode = str(t)
 print htmlcode
 cursor.close()
 return htmlcode


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0')


