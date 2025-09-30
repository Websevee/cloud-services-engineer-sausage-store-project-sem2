DROP TABLE product_info;

DROP TABLE orders_date;

ALTER TABLE product 
ADD price double precision,
ADD PRIMARY KEY (id);

ALTER TABLE orders 
ADD date_created date default current_date,
ADD PRIMARY KEY (id);

ALTER TABLE order_product ADD CONSTRAINT fk_order_product_order FOREIGN KEY (order_id) REFERENCES orders (id),
ADD CONSTRAINT fk_order_product_product FOREIGN KEY (product_id) REFERENCES product (id),
ADD PRIMARY KEY (order_id, product_id);