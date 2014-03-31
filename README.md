# RabbitMQ Benchmarking VMs

This Vagrantfile contains the steps to produce pre-clustered RabbitMQ nodes for
both Centos 5.6 and Ubuntu 12.04.

## Usage

```bash
vagrant up centos1 centos2
```

or

```bash
vagrant up ubuntu1 ubuntu2
```

## Configuration

CentOS VMs start on 192.168.56.201 and .202, Ubuntu on .211 and .212. Admin
interface exists on :15672 with guest/guest.

## Benchmarking

Get the latest [Java adapter](http://www.rabbitmq.com/java-client.html) tarball
then run:

```bash
sh ./runjava.sh com.rabbitmq.examples.PerfTest -h amqp://192.168.56.201/%2f -u test
```

Pass `-?` to the benchmarker for options
