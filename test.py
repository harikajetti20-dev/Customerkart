import requests

result = requests.post('http://localhost:5000/get_products', data={'search': 'Wedding Gift Hamper'})

print(result) 
print(result.status_code)
print(result.text)