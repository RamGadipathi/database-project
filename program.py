import pymysql.cursors
import pymysql
import sys
import os

connection = pymysql.connect(host='database-1.cakawovuaaz8.us-east-1.rds.amazonaws.com',
                             user='admin',
                             password="santghh",
                             db='',
                             cursorclass=pymysql.cursors.DictCursor)
with connection.cursor() as cursor:
    try:

        sql = "SELECT * FROM Product order by ProductPrice asc"
        cursor.execute(sql)
        results = cursor.fetchall()
        if results:
            createdfile = open("dbcontent.txt", "a+")
            createdfile.write(
                'Product_ID' + "\t" + 'ProductName' + "\t" + "ProductDescription" + "\t" + 'ProductPrice' + "\t" + 'User_id' + "\t")

        for index in results:
            listing = [index['Product_ID'], index['ProductName'], index['ProductDescription'], index['ProductPrice'],
                       index['User_id']]
            lengthlisting = len(listing)
            for i in range(lengthlisting):
                createdfile.write('{}'.format(listing[i]))
                createdfile.write("\t")
                print(listing[i])
            createdfile.write("\n")
    except:
        print("Error: unable to fecth data")
connection.close()
createdfile.close()