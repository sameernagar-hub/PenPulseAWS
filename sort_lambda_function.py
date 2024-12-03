import json
import boto3
import logging

# logging
logger = logging.getLogger()
logger.setLevel(logging.INFO)
#obtain client from resource using boto
s3 = boto.client('s3')
dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('cloudtech-db')

def lambda_handler(event, context):

    #bucket name
    bucket = 'cloudtech-s3'
    #file name from above bucket
    key = 'batch-write-blog.json'

    response = s3.get_object(Bucket = bucket, Key = key)
    content = response.['Body']
    jsonObject = json.loads(content.read())
    logger.info(jsonObject['blog-table'])

    for PutRequest in jsonObject['blog-table']:
        logger.info(PutRequest['Item'])
        table.put_item(Item={'category': Item['category']})