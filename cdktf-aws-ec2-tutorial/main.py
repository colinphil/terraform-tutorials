#!/usr/bin/env python
from constructs import Construct
from cdktf import App, TerraformStack, TerraformOutput
from imports.aws import AwsProvider, Instance

class MyStack(TerraformStack):
  def __init__(self, scope: Construct, ns: str):
    super().__init__(scope, ns)

    AwsProvider(self, 'Aws', region='us-west-2')

    helloInstance = Instance(self, 'hello',
                             ami="ami-01456a894f71116f2",
                             instance_type="t2.micro",
                             )

    TerraformOutput(self, 'hello_public_ip',
                    value=helloInstance.public_ip
                    )


app = App()
MyStack(app, "hello-terraform")

app.synth()
