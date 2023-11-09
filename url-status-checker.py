
    


import requests
import json

def lambda_handler(event, context):
    service_names = event.get('service_names', [])

    results = {}
    for service_name in service_names:
        status = check_service_status(service_name)
        results[service_name] = status

    return {
        'statusCode': 200,
        'body': json.dumps(results)
    }

def check_service_status(service_name):
    services = {
        'AWS-Service': 'https://w3schools.com/python/demopage.htm', 
        # Add more services as needed
    }

    if service_name in services:
        try:
            response = requests.get(services[service_name])
            if response.status_code == 200:
                return 'OK'
            else:
                return 'FAIL'
        except requests.RequestException as e:
            return f'Exception: {e}'
    else:
        return 'Service not found'
    

    
# Your lambda_handler and check_service_status functions here...

# Mock event
mock_event = {'service_names': ['AWS-Service']}

# Invoke lambda_handler function with the mock event
result = lambda_handler(mock_event, None)
print(result)  # Output the result to the console
