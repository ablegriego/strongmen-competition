import mysql.connector
import sys


def read_competitors(cnx):
    # get a cursor object from the MySQL connection
    cursor = cnx.cursor()
    # execute a SQL statement
    cursor.execute("""
        select first_name
        from strongman_comp.strong_men
        order by user_id 
        """)
    # The select statement returns a result set, which is managed here by
    # the cursor object. We can get the values from the result set row by row.

    # column names, as specified in the select, are in the column_names member
    # of the cursor after cursor.execute() is called. column_names returns a tuple.
    col_names = cursor.column_names

    # try to get the first row from the result set
    row = cursor.fetchone()
    # cursor.fetchone() returns None after the last row has already been read
    while row is not None:
        # print the first column of the result set (the only column for this select)
        print(row[0])
        # try to read another row from the result set
        row = cursor.fetchone()


def read_strong_men(cnx):
    cursor = cnx.cursor()
    cursor.execute("""
        select first_name, last_name
        from strongman_comp.competitors
        order by user_id 
        """)
    col_names = cursor.column_names
    row = cursor.fetchone()
    while row is not None:
        print("{0}, {1}".format(row[1], row[0]))
        row = cursor.fetchone()

def read_strong_women(cnx):
    cursor = cnx.cursor()
    cursor.execute("""
        select first_name, last_name
        from strongman_comp.strong_women
        order by user_id """)
    col_names = cursor.column_names
    row = cursor.fetchone()
    while row is not None:
        print("{0}, {1}".format(row[1], row[0]))
        row = cursor.fetchone()
    

def count_competitors(cnx):
    cursor = cnx.cursor()
    cursor.execute("""
        select count(*) as num_competitors
        from strongman_comp.competitors
        order by user_id 
        """)
    col_names = cursor.column_names

    # here we expect one row in the result set, so we just do one fetch
    row = cursor.fetchone()
    print("{1}={0}".format(row[0], col_names[0]))


def count_strong_men(cnx):
    cursor = cnx.cursor()
    cursor.execute("""
        select count(*) as num_strong_men
        from strongman_comp.strong_men
        order by last_name, first_name 
        """)
    col_names = cursor.column_names
    row = cursor.fetchone()
    print("{1}={0}".format(row[0], col_names[0]))

def count_strong_women(cnx):
    cursor = cnx.cursor()
    cursor.execute("""
        select count(*) as num_strong_women
        from strongman_comp.strong_women
        order by last_name, first_name 
        """)
    col_names = cursor.column_names
    row = cursor.fetchone()
    print("{1} {0}".format(row[1], row[0]))

def read_strongest_strongmen(cnx):
    cursor = cnx.cursor()
    cursor.execute("""
    select first_name, last_name, grand_total
from strongman_comp.strong_men
where grand_total = (SELECT MAX(grand_total)
                FROM strongman_comp.strong_men) """)
    col_names = cursor.column_names
    row = cursor.fetchone()
    print("{1} {0}".format(row[1], row[0]))
    

def read_strongest_strongwomen(cnx):
    cursor = cnx.cursor()
    cursor.execute("""
    select first_name, last_name, grand_total
from strongman_comp.strong_women
where grand_total = (SELECT MAX(grand_total)
                FROM strongman_comp.strong_women) """)
    col_names = cursor.column_names
    row = cursor.fetchone()
    print("{1} {0}".format(row[1], row[0]))
    

if __name__ == '__main__':

    # check that command line arguments are correct
    # valid commands:
    #
    # ap_read.py list products
    # ap_read.py list customers
    # ap_read.py count products
    # ap_read.py count customers
    if len(sys.argv) != 3:
        print("Error: the program takes two arguments")
        quit(-1)
    elif not sys.argv[1] in {"list", "count", "strongest"}:
        print("Error: the first argument must be 'list' or 'count' or 'strongest'")
        quit(-2)
    elif not sys.argv[2] in {"competitors", "strong_men" , "strong_women"}:
        print("Error: the second argument must be either 'competitors' or 'strong_men' or 'strong_women' ")
        quit(-3)

    # use more understandable names
    action = sys.argv[1]
    thing = sys.argv[2]

    # login.txt is a file with two lines of data. On the first line
    # is a string representing the MySQL username. The second line
    # contains the login password.
    with open("login.txt") as f:
        username = f.readline().rstrip()
        pwd = f.readline().rstrip()

    db_cnx = mysql.connector.connect(user=username, password=pwd, host='localhost', database='strongman_comp')  
    try:
        # dispatch to worker subroutine
        if action == 'list':
            if thing == 'competitors':
                read_competitors(db_cnx)
            elif thing == 'strong_men':
                read_strong_men(db_cnx)
            elif thing == 'strong_women':
                read_strong_women(db_cnx)
        elif action == 'count':
            if thing == 'competitors':
                count_competitors(db_cnx)
            elif thing == 'strong_men':
                count_strong_men(db_cnx)
            elif thing == 'strong_women':
                count_strong_women(db_cnx)
        elif action == 'strongest':
            if thing == 'strong_men':
                read_strongest_strongmen(db_cnx)
            elif thing == 'strong_women':
                read_strongest_strongwomen(db_cnx)
    finally:        
        db_cnx.close()
