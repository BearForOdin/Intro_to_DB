#!/usr/bin/python3
"""
This script connects to a MySQL server and creates
the database alx_book_store if it does not already exist.
"""

import mysql.connector
from mysql.connector import Error

try:
    # Connect to MySQL Server (adjust host, user, password as needed)
    connection = mysql.connector.connect(
        host='localhost',
        user='root',
        password='your_password'  # replace with your MySQL password
    )

    if connection.is_connected():
        cursor = connection.cursor()
        # Create database if not exists
        cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")
        print("Database 'alx_book_store' created successfully!")

except mysql.connector.Error as e:
    print(f"Error while connecting to MySQL: {e}")

finally:
    # Close connection safely
    if 'connection' in locals() and connection.is_connected():
        cursor.close()
        connection.close()
