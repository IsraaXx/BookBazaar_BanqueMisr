# BookBazaar Database Schema

Copy paste into https://dbdiagram.io/d for interactive ERD

```dbml
Table authors {
  author_id int [primary key, increment]
  first_name varchar(100) [not null]
  last_name varchar(100) [not null]
  nationality varchar(100)
  bio text
  indexes {
    (first_name, last_name) [unique]
  }
}

Table users {
  user_id int [primary key, increment]
  username varchar(50) [unique, not null]
  email varchar(255) [unique, not null]
  password_hash varchar(255) [not null]
  phone_number varchar(20)
  address text
}

Table books {
  book_id int [primary key, increment]
  title varchar(255) [not null]
  author_id int [not null, ref: > authors.author_id]
  genre varchar(100)
  edition varchar(50)
  description text
  language varchar(50)
  publication_date date
  price decimal(10,2)
  stock_quantity int [default: 0]
}

Table user_books {
  user_id int [not null, ref: > users.user_id]
  book_id int [not null, ref: > books.book_id]
  date_added date [not null]
  
  indexes {
    (user_id, book_id) [pk]
  }
}
```