# Vulnerable to SQL Injection
import sqlite3

user_id = input("Enter user ID: ")
query = "SELECT * FROM users WHERE id = " + user_id  # פתח להזרקה

connection = sqlite3.connect("database.db")
cursor = connection.cursor()
cursor.execute(query)
