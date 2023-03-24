import psycopg2


# Функция, создающая таблицы
def create_table(cursor):
    cursor.execute('''
                    CREATE TABLE users_phone(
                        phone_id SERIAL PRIMARY KEY,
                        phone CHAR(12) UNIQUE
                    )''')
    cursor.execute('''
                    CREATE TABLE users(
                        user_id SERIAL PRIMARY KEY,
                        name VARCHAR(30) NOT NULL,
                        surname VARCHAR(30) NOT NULL,
                        email VARCHAR(64) UNIQUE,
                        phone INTEGER REFERENCES users_phone(phone_id)
                )''')


# Функция, позволяющая добавить телефон для существующего клиента
def add_users_phone(cursor, phone_id, phone):
    cursor.execute('''
                    INSERT INTO users_phone
                    VALUES
                    (%s, %s)
                ''', (phone_id, phone,))


# Функция, позволяющая добавить нового клиента
def insert_into_table(cursor, user_id, name, surname, email, phone=None):
    cursor.execute('''
        INSERT INTO users
        VALUES
        (%s, %s,%s,%s,%s)
    ''', (user_id, name, surname, email, phone))


# Функция, позволяющая изменить данные о клиенте
def alter_users(cursor, user_id, name=None, surname=None, email=None, phone=None):
    cursor.execute('''
                        UPDATE users
                        SET name = %s
                        WHERE user_id = %s
                    ''', (name, user_id))
    cursor.execute('''
                        UPDATE users
                        SET surname = %s
                        WHERE user_id = %s
                    ''', (surname, user_id))
    cursor.execute('''
                        UPDATE users
                        SET email = %s
                        WHERE user_id = %s
                    ''', (email, user_id))
    cursor.execute('''
                        UPDATE users
                        SET phone = %s
                        WHERE user_id = %s
                    ''', (phone, user_id))


# Функция, позволяющая изменить номер  клиента
def alter_users_phone(cursor, phone_id, phone):
    cursor.execute('''
                    UPDATE users_phone
                    SET phone = %s
                    WHERE phone_id = %s
                ''', (phone, phone_id))


# Функция, позволяющая удалить телефон для существующего клиента
def delete_phone(cursor, phone):
    cursor.execute('''
                    DELETE FROM users_phone
                    WHERE phone = %s
                ''', (phone,))


# Функция, позволяющая удалить существующего клиента
def delete_profile(cursor, user_id):
    cursor.execute('''
                    DELETE FROM users
                    WHERE user_id =%s
                   ''', (user_id,))


#  Функция, позволяющая найти клиента по его данным
#  (имени, фамилии, email-у или телефону)
def search_profile(cursor, name=None, surname=None, email=None, phone=None):
    if name is not None:
        cursor.execute('''
            SELECT user_id, name, surname, email, phone_id
            FROM users
            LEFT JOIN users_phone up ON users.phone = up.phone_id
            WHERE name LIKE %s''', (name,))
    elif surname is not None:
        cursor.execute('''
            SELECT user_id, name, surname, email, phone_id
            FROM users
            LEFT JOIN users_phone up ON users.phone = up.phone_id
            WHERE surname LIKE %s''', (surname,))
    elif email is not None:
        cursor.execute('''
               SELECT user_id, name, surname, email, phone_id
               FROM users
               LEFT JOIN users_phone up ON users.phone = up.phone_id
               WHERE email LIKE %s''', (email,))
    elif phone is not None:
        cursor.execute('''
               SELECT user_id, name, surname, email, phone_id
               FROM users
               LEFT JOIN users_phone up ON users.phone = up.phone_id
               WHERE phone LIKE %s''', (phone,))
    print(cursor.fetchall())


try:
    with psycopg2.connect(database="clients_db",
                          user="postgres",
                          password="postgres") as connection:
        with connection.cursor() as cursor:
            create_table(cursor)

            add_users_phone(cursor, 1, '465-484-65')
            add_users_phone(cursor, 2, '654-486-4156')
            add_users_phone(cursor, 3, '897-895')
            add_users_phone(cursor, 4, 5655555)

            insert_into_table(cursor, 1, 'Harry', 'Potter', 'harrypotter@hogwarts.com', 1)
            insert_into_table(cursor, 2, 'Albus', 'Dumbledore', 'albusdumbledore@hogwarts.com', 3)
            insert_into_table(cursor, 3, 'Mineeeeeeeerva', 'McGonagall', 'm_mcgonagall@hogwarts.com', 2)

            alter_users(cursor, 1, 'Harry', 'Potter', 'harry_potter@hogwarts.com', 1)
            alter_users(cursor, 2, 'Albus', 'Dumbledore', 'albus.dumbledore@hogwarts.com', 3)
            alter_users(cursor, 3, 'Minerva', 'McGonagall', 'm_mcgonagall@hogwarts.com', 2)

            alter_users_phone(cursor, 3, '565-5565-5')
            delete_phone(cursor, '5655555')
            delete_profile(cursor, 1)

            search_profile(cursor, 'Albus')
            search_profile(cursor, None, 'Dumbledore')
            search_profile(cursor, None, None, 'm_mcgonagall@hogwarts.com')
except:
    print('Can`t establish connection to database')

finally:
    connection.close()