/*
 Nicko Goodwin
 8/26/2022
 */

SELECT * FROM products WHERE categoryID = 2;

SELECT
    categoryName,
    productName,
    listPrice
FROM categories
    INNER JOIN products ON categories.categoryID = products.categoryID
WHERE listPrice > 400
ORDER BY listPrice ASC;

INSERT INTO
    products (
        categoryID,
        productCode,
        productName,
        listPrice
    )
VALUES (
        1,
        'tele',
        'Fender Telecaster',
        599.00
    );

DELETE FROM products WHERE productCode = 'tele' 