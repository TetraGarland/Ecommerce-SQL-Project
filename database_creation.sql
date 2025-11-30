CREATE TABLE customers (
    customer_id     INT PRIMARY KEY,
    first_name      VARCHAR(50),
    last_name       VARCHAR(50),
    email           VARCHAR(100),
    signup_date     DATE,
    city            VARCHAR(50),
    state           VARCHAR(50),
    country         VARCHAR(50),
    age             INT,
    gender          VARCHAR(10)
);
CREATE TABLE suppliers (
    supplier_id     INT PRIMARY KEY,
    supplier_name   VARCHAR(100),
    contact_email   VARCHAR(100),
    country         VARCHAR(50)
);
CREATE TABLE categories (
    category_id     INT PRIMARY KEY,
    category_name   VARCHAR(100)
);
CREATE TABLE products (
    product_id      INT PRIMARY KEY,
    product_name    VARCHAR(100),
    category_id     INT,
    supplier_id     INT,
    price           DECIMAL(10,2),
    cost            DECIMAL(10,2),
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);
CREATE TABLE orders (
    order_id        INT PRIMARY KEY,
    customer_id     INT,
    order_date      DATETIME,
    order_status    VARCHAR(20),
    payment_method  VARCHAR(30),
    shipping_cost   DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE order_items (
    order_item_id   INT PRIMARY KEY,
    order_id        INT,
    product_id      INT,
    quantity        INT,
    unit_price      DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE returns (
    return_id       INT PRIMARY KEY,
    order_item_id   INT,
    return_date     DATE,
    return_reason   VARCHAR(50),
    FOREIGN KEY (order_item_id) REFERENCES order_items(order_item_id)
);
CREATE TABLE inventory (
    inventory_id    INT PRIMARY KEY,
    product_id      INT,
    warehouse       VARCHAR(50),
    stock_on_hand   INT,
    safety_stock    INT,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE shipments (
    shipment_id     INT PRIMARY KEY,
    order_id        INT,
    shipped_date    DATE,
    delivered_date  DATE,
    carrier         VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);