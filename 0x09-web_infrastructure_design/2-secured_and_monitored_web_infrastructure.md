Design of a Secured and Monitored Web Infrastructure

In this design, we'll create a secured and monitored web infrastructure that meets the specified requirements. Let's go through each component and its role:

Server 1 (Web Server):
This server hosts the Nginx web server. It serves as the entry point for incoming traffic.

Server 2 (Application Server):
This server hosts the application server. It processes dynamic requests and communicates with the database.

Server 3 (Database):
This server hosts the MySQL database, forming a Primary-Replica cluster for redundancy and scalability.

Load Balancer (HAproxy):
The load balancer distributes incoming traffic across the web and application servers.

Firewalls (3):
Firewalls are added to enhance security. They control incoming and outgoing traffic to prevent unauthorized access.

SSL Certificate:
An SSL certificate is implemented to serve the website over HTTPS, ensuring encrypted data transmission.

Monitoring Clients (3):
Monitoring clients collect data from various components and send it to a monitoring service (Sumo Logic or similar).

Why Each Element:

Firewalls: Added for security. They act as a barrier between the servers and the external world, allowing controlled traffic.

SSL Certificate: Enables HTTPS, securing data in transit. Encrypting traffic is essential for user privacy and data protection.

Monitoring Clients: Used to gather server performance data, detect anomalies, and ensure uptime.

Traffic Served over HTTPS:

HTTPS encrypts data between the user's browser and the web server, preventing eavesdropping and data tampering.
Monitoring:

Monitoring tracks server performance, identifies issues, and aids in timely troubleshooting.
How Monitoring Tool Collects Data:

Monitoring clients collect data such as CPU usage, memory usage, network traffic, and application-specific metrics. They send this data to a monitoring service.
Monitoring Web Server QPS:

To monitor web server QPS (Queries Per Second), set up monitoring clients to track incoming requests and calculate the rate.
Issues with This Infrastructure:

Terminating SSL at Load Balancer Level:

Terminating SSL at the load balancer exposes decrypted traffic internally. Implementing end-to-end encryption (E2EE) would address this issue.
Single MySQL Server Accepting Writes:

This is a single point of failure for write operations. Adding more replicas to handle writes enhances redundancy.
Uniform Components (Database, Web Server, Application Server):

If all servers have the same components, issues on one server could impact the entire infrastructure. Diversifying components would improve resilience.
