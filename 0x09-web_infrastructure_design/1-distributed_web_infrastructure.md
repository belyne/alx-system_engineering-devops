Design of a Distributed Web Infrastructure

In this design, we'll create a distributed web infrastructure that meets the specified requirements. Let's go through each component and its role:

Server 1 (Web Server):
This server hosts the Nginx web server. Nginx handles incoming HTTP requests and serves static content.

Server 2 (Application Server):
This server hosts the application server. It processes dynamic requests, interacts with the database, and generates responses.

Load Balancer (HAproxy):
The load balancer distributes incoming traffic across the two servers using a distribution algorithm (e.g., round-robin, least connections, etc.).

Application Files (Code Base):
The application files consist of your web application's source code. Both servers share the same code base to ensure consistency.

Database (MySQL Primary-Replica Cluster):
The MySQL database is set up as a Primary-Replica (Master-Slave) cluster. The primary node handles write operations, while replica nodes handle read operations.

Why Each Element:

Load Balancer (HAproxy): Added to distribute incoming traffic, improve performance, and ensure high availability.

Application Server: Handles dynamic requests, keeping the web server lightweight and allowing for efficient processing of application logic.

Database Cluster: Offers redundancy and read scaling. Primary node for writes, replica nodes for reads.

Load Balancer Distribution Algorithm:

The load balancer is configured with a round-robin distribution algorithm. It evenly distributes incoming requests among the available servers.

Active-Active vs. Active-Passive:

The setup is Active-Active. Both servers are actively serving traffic. Active-Passive would involve one server actively serving traffic while the other is on standby.

Primary-Replica Cluster:

In a Primary-Replica cluster, the primary node (master) handles write operations (INSERT, UPDATE, DELETE), while replica nodes (slaves) replicate data from the primary and handle read operations. This enhances data redundancy and read scalability.

Difference Between Primary and Replica:

Primary: Handles write operations, ensuring data consistency and integrity. Replicas replicate data from the primary and can only handle read operations.
Issues with This Infrastructure:

Single Points of Failure (SPOFs):

The load balancer could be a SPOF. Adding redundancy to the load balancer would be beneficial.
The absence of firewalls poses security risks.
Security Issues:

Lack of firewalls exposes servers to potential attacks.
Absence of HTTPS puts data transmission at risk.
No Monitoring:
There is no monitoring in place to track server health, performance, or potential issues.
