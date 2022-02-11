from diagrams import Diagram, Cluster, Edge

from diagrams.aws.compute import Lambda
from diagrams.aws.integration import SNS
from diagrams.aws.management import Cloudwatch, CloudwatchAlarm

graph_attr = {
    "fontsize": "50",
}

with Diagram("AWS Lambda SNS Slack Notification", filename="./.images/aws_lambda_sns_slack_notification",
             show=False, graph_attr=graph_attr):
    with Cluster("AWS"):
        with Cluster("VPC"):
            log_connection = Edge(color="darkpink", style="dotted")

            with Cluster("Monitoring"):
                cloud_watch_alarm = CloudwatchAlarm("CouldWatch Alarm")
                cloud_watch = Cloudwatch("CloudWatch")
                monitoring = [cloud_watch_alarm, cloud_watch]

            with Cluster('Stack'):
                lambda_function_send_slack_notification = Lambda("Slack Notification")
                notification_sns_topic = SNS("AWS SNS")
                stack = [lambda_function_send_slack_notification, notification_sns_topic]

            cloud_watch << log_connection >> cloud_watch_alarm
            cloud_watch_alarm >> Edge() >> notification_sns_topic
            lambda_function_send_slack_notification << Edge() << notification_sns_topic
            lambda_function_send_slack_notification >> Edge() >> cloud_watch
