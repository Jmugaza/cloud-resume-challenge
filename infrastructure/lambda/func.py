import json
import boto3

dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('Counter')

def lambda_handler(event, context):
    response = table.get_item(Key={
        'CounterID': '1'
    })

    visitors = response['Item']['visitors']  # Access 'visitors' attribute
    visitors = visitors + 1
    print(visitors)

    response = table.put_item(Item={
            'CounterID': '1',
            'visitors': visitors
    })

    return visitors