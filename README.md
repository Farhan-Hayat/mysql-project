# MySQL Project: Online Shop Database

This MySQL project illustrates a database structure for an Online Shop System. The database includes tables for managing customer information, product details, orders, billing, payments, and more.

## Database Structure

- **customer:** Stores customer details, including ID, name, email, and contact number.
- **product:** Contains product information such as product ID, name, quantity, price, and color.
- **order_detail:** Tracks customer orders, including order ID, product ID, quantity, price, order date, customer ID, and customer address.
- **bill_detail:** Manages billing details, including bill ID, bill date, customer ID, order ID, product ID, quantity, price, total price, discount, and payment status.
- **payment:** Records payment details, including payment ID, payment mode, payment date, bill ID, and payment amount.
- **order_return:** Handles order return information, including return ID, order ID, customer ID, return date, product ID, and return amount.
- **shoping_cart:** Represents the shopping cart, tracking product ID, customer ID, and cart ID.

## Views

- **rawalpindi_customers:** A view displaying customer orders from Rawalpindi with details such as customer name, product name, quantity, color, email, order date, and customer address.

- **rawalpindi_orders:** A view showing orders delivered to Rawalpindi with details similar to 'rawalpindi_customers.'

## Usage

1. **Database Creation:**
   - Execute the provided SQL dump to create the 'online_shop' database and tables.

2. **Views:**
   - Views like 'rawalpindi_customers' and 'rawalpindi_orders' provide convenient access to specific data sets.
