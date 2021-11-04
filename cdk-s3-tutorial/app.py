#!/usr/bin/env python3
import os

from aws_cdk import core as cdk
from aws_cdk import core

from cdk_s3_tutorial.cdk_s3_tutorial_stack import CdkS3TutorialStack

app = core.App()
CdkS3TutorialStack(app, "CdkS3TutorialStack")

app.synth()
