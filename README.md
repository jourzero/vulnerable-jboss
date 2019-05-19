# Vulnerable-Jboss
Dockerfile to build an old jboss server that's vulnerable to java deserialization attacks.

## Preparation
* Clone this repo
* Download old Jboss 5.X from Sourceforge. For example, [JBoss 5.1.0 GA](https://sourceforge.net/projects/jboss/files/JBoss/JBoss-5.1.0.GA/jboss-5.1.0.GA-jdk6.zip/download).
* Adjust COPY command in Dockerfile if needed.
* Build docker container with a command such as `docker build -t "${PWD##*/}" .`

## How to use
* Run docker container with a command such as `docker run -it -p "127.0.0.1:8080:8080" --rm --name "${PWD##*/}" "${PWD##*/}"`
* Browse to the admin console running in your [local container](http://localhost:8080).
* Test exploitation (see references)

## References
* [Red Hat JBoss EAP deserialization of untrusted data ](https://www.exploit-db.com/exploits/40842)
* [Deserialization attack test tool ysoserial](https://github.com/frohoff/ysoserial)
