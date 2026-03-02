from flask import Flask, jsonify, request
from flask_cors import CORS
import firebase_admin
from firebase_admin import credentials, auth
import psycopg2

app = Flask(__name__)
CORS(app)

# -----------------------------------
# Initialize Firebase
# -----------------------------------
cred = credentials.Certificate("serviceAccountKey.json")
firebase_admin.initialize_app(cred)


# -----------------------------------
# Database Connection Function
# -----------------------------------
def get_db_connection():
    return psycopg2.connect(
        host="localhost",
        database="customerkart_db",
        user="postgres",
        password="harika",
        port=5432
    )


# -----------------------------------
# Token Verification
# -----------------------------------
def verify_token():
    auth_header = request.headers.get("Authorization")

    if not auth_header:
        return None, jsonify({"message": "No token provided"}), 401

    try:
        token = auth_header.split(" ")[1]
        decoded_token = auth.verify_id_token(token)
        return decoded_token, None, None
    except Exception:
        return None, jsonify({"message": "Invalid token"}), 403


# -----------------------------------
# Home Route
# -----------------------------------
@app.route("/")
def home():
    return "CustomerKart Backend Running 🚀"


# -----------------------------------
# Get All Products
# -----------------------------------
@app.route("/products", methods=["GET"])
def get_products():
    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        cursor.execute("SELECT product_id, name, price, image_url FROM products")
        rows = cursor.fetchall()

        products = []
        for row in rows:
            products.append({
                "product_id": row[0],
                "name": row[1],
                "price": row[2],
                "image_url": row[3]
            })

        cursor.close()
        conn.close()

        return jsonify(products)

    except Exception as e:
        return jsonify({"error": str(e)}), 500


# -----------------------------------
# Search Products
# -----------------------------------
@app.route("/products/search", methods=["POST"])
def search_products():
    data = request.json
    search_value = data.get("search")

    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        cursor.execute(
            "SELECT product_id, name, price, image_url FROM products WHERE name ILIKE %s",
            (f"%{search_value}%",)
        )

        rows = cursor.fetchall()

        results = []
        for row in rows:
            results.append({
                "product_id": row[0],
                "name": row[1],
                "price": row[2],
                "image_url": row[3]
            })

        cursor.close()
        conn.close()

        return jsonify(results)

    except Exception as e:
        return jsonify({"error": str(e)}), 500


# -----------------------------------
# Get User Orders (Protected)
# -----------------------------------
@app.route("/orders", methods=["GET"])
def get_orders():
    decoded_token, error_response, status_code = verify_token()
    if error_response:
        return error_response, status_code

    user_id = decoded_token["uid"]

    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        cursor.execute(
            "SELECT id, product_name, price FROM orders WHERE user_id = %s",
            (user_id,)
        )

        rows = cursor.fetchall()

        orders = []
        for row in rows:
            orders.append({
                "id": row[0],
                "product_name": row[1],
                "price": row[2]
            })

        cursor.close()
        conn.close()

        return jsonify(orders)

    except Exception as e:
        return jsonify({"error": str(e)}), 500


# -----------------------------------
# Add New Order (Protected)
# -----------------------------------
@app.route("/orders", methods=["GET"])
def add_order():
    decoded_token, error_response, status_code = verify_token()
    if error_response:
        return error_response, status_code

    user_id = decoded_token["uid"]
    data = request.json

    product_name = data.get("product_name")
    price = data.get("price")

    try:
        conn = get_db_connection()
        cursor = conn.cursor()

        cursor.execute(
            "INSERT INTO orders (user_id, product_name, price) VALUES (%s, %s, %s)",
            (user_id, product_name, price)
        )

        conn.commit()

        cursor.close()
        conn.close()

        return jsonify({"message": "Order placed successfully"}), 201

    except Exception as e:
        return jsonify({"error": str(e)}), 500


# -----------------------------------
# Run Server
# -----------------------------------
if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000, debug=True)