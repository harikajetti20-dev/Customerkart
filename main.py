from flask import Flask,request
import psycopg2
app = Flask(__name__)



@app.route("/get_sample_name", methods=['GET'])
def send_sample_name():
    return ({
        "SHOPNAME": "CustomerKart",
        "OWNER": "Harika",
        "LOCATION": "Hyderabad"
    })







@app.route('/get_product_details', methods=['POST'])
def user_details():
    print("Hosting my database...")
    search_inp = str(request.form.get('search'))
    print(f"Search input: {search_inp}")
    # search query.
    # through python
    conn = psycopg2.connect(
        host="localhost",
        database="customerkart_db",
        user="postgres",
        password="harika",
        port = 5432
        )


    cursor = conn.cursor()
    query = f"SELECT * FROM products WHERE name = '{search_inp}'"
    print(f"Executing query: {query}")
    cursor.execute(query)
    result = cursor.fetchall()
    print(result)
    return result

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0',port=5000)