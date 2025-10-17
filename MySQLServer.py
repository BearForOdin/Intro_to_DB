#!/usr/bin/python3
"""
A simple Python script to create a MySQL database 'alx_book_store'.
If the database already exists, the script should not fail.
"""

import mysql.connector
from mysql.connector import Error

def create_database():
    try:
        # Connect to MySQL server (change user and password as needed)
        connection = mysql.connector.connect(
            host='localhost',
            user='root',
            password='your_password'  # 👈 replace with your actual MySQL password
        )

        if connection.is_connected():
            cursor = connection.cursor()

            # Create database if it doesn't exist
            cursor.execute("CREATE DATABASE IF NOT EXISTS alx_book_store")

            print("Database 'alx_book_store' created successfully!")

    except Error as e:
        print(f"Error while connecting to MySQL: {e}")

    finally:
        # Close the connection
        if connection.is_connected():
            cursor.close()
            connection.close()
            # Optional message
            # print("MySQL connection is closed")

if __name__ == "__main__":
    create_database()
