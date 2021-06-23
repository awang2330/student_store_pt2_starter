CREATE TABLE users (
  id          SERIAL PRIMARY KEY,
  name        TEXT NOT NULL,
  password    TEXT NOT NULL,
  username    TEXT NOT NULL UNIQUE,
  email       TEXT NOT NULL UNIQUE CHECK (POSITION('@' IN email) > 1),
  is_admin    BOOLEAN NOT NULL DEFAULT FALSE,
  created_at  TIMESTAMP NOT NULL DEFAULT NOW()
);

create table products (
  id            SERIAL PRIMARY KEY,
  name          TEXT NOT NULL,
  category      TEXT NOT NULL,
  image         TEXT NOT NULL,
  description   TEXT NOT NULL,   
  price         BIGINT NOT NULL
);

create table orders (
  id            serial primary key,
  customer_id   integer not null,
  created_at    timestamp not null default now(),
  foreign key (customer_id) references users(id) on delete cascade
);

create table order_details (
  order_id      integer not null references orders(id) on delete cascade,
  product_id    integer not null references products(id) on delete cascade,
  quantity      integer not null default 1,
  discount      integer,
  primary key (order_id, product_id)
);