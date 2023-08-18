import boto3

from flask import Flask, render_template, redirect, url_for

app = Flask(__name__)

client = boto3.client('dynamodb', region_name='us-east-1')
dynamoTableName = 'VisitCounter'

@app.route('/')
def home():
    resp = client.get_item(
        TableName=dynamoTableName,
        Key={
            'page': { 'S': 'page' }
        }
    )

    if 'Item' in resp:
        visit_count = int(resp['Item']['visit_count']['N'])
        visit_count += 1
        client.update_item(
            TableName=dynamoTableName,
            Key={
                'page': { 'S': 'page' }
            },
            UpdateExpression="SET visit_count = :count",
            ExpressionAttributeValues={
                ':count': {'N': str(visit_count)}
            }
        )
    else:
        visit_count = 1
        client.put_item(
            TableName=dynamoTableName,
            Item={
                'page': { 'S': 'page' },
                'visit_count': { 'N': str(visit_count) }
            }
        )
        
    return render_template('index.html', visit_count=visit_count)

@app.route('/reset')
def reset():
    client.update_item(
        TableName=dynamoTableName,
            Key={
                'page': { 'S': 'page' }
            },
        UpdateExpression='SET visit_count = :count',
        ExpressionAttributeValues={
            ':count': {'N': str(0)}
        }
    )

    return redirect(url_for('home'))

@app.route('/health')
def health_check():
    return "OK", 200

if __name__ == '__main__':
    app.run(threaded=True, host='0.0.0.0', port=5000)
