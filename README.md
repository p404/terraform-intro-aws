## Terraform-intro-aws
Terraform is a tool for:

* Building,
* Changing, and
* Versioning

***Your Infrastructure***

Terraform **can manage existing and popular service providers.** 

Configuration files describe to Terraform the components needed to run a single application or your entire datacenter.


### Installing terraform
 If you have installed brew, you can simple do **brew install terraform**

### Building your first infrastructure

* Create a named file containing .tf file extension (eg infra.tf)
* Setup credentials used against a provider (e.g amazon, gce, azure)

        provider "aws" {
        	    access_key = "supers3cret"
            	secret_key = "supers3cret"
                region     = "us-east-1"
        }

* Setup a resource (a instance or volume. etc)

        # Lab Instance
        resource "aws_instance" "lab-instance" {
          ami                         = "ami-c8580bdf"
          instance_type               = "t2.small"

          tags {
            Name = "Lab instance"
          }
        }
        # Elastic IP for Lab instance
        resource "aws_eip" "lab-ip" {
           instance   = "${aws_instance.lab-instance.id}"
           vpc        = true
           depends_on = ["aws_instance.lab-instance"]
        }


* Use the terraform binary to execute a plan **terraform plan**

* See the execution plan changes (green, red, yellow)

* Apply your newly created plan **terraform apply** to the exsisting provider



### The MIT License (MIT)

Copyright © `2017` `Pablo Opazo`

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the “Software”), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.
