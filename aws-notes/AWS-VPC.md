# VPC

![Pasted Graphic](https://github.com/parrao/javecode/assets/13145569/8327775d-0de1-47ea-9727-3258b84e728f)

#### What is an RFC1918 address?
An RFC1918 address is an IP address that is assigned by an enterprise organization to an internal host. These IP addresses are used in private networks, which are not available, or reachable, from the Internet.

In fact, one of the basic requirements of the Internet is that each host has a unique IP address. RFC1918 removes this requirement. RFC1918 IP addresses can be used on multiple networks, as long as they’re private and isolated from each other. To implement this solution every Internet router must be configured to discard IP packets with these addresses. IP packets carrying private addresses can only flow on internal, private networks. This aspect contributes to network security by creating a clear distinction between internal and external networks. Devices with private addresses are not directly reachable from the Internet, which adds a layer of isolation and protection against certain types of cyber threats.

#### RFC1918 Subnets
The RFC1918 address space includes the following networks:

10.0.0.0 – 10.255.255.255  (10/8 prefix)
172.16.0.0 – 172.31.255.255  (172.16/12 prefix)
192.168.0.0 – 192.168.255.255 (192.168/16 prefix)
The ten-dot network (10/8) is typically used within large organizations that have thousands of hosts. The 172 and 192 subnets are more common within smaller organizations or home networks. If you are reading this article from home, most probably, your laptop is configured via DHCP with a 192 address. 

#### Security Groups - Its works at Elastic Network Interface( ENI) or Virtual network adoptor level. 
#### Network Access Controls Lists (N. ACLs) works at VPC subnet level.

![image](https://github.com/parrao/javecode/assets/13145569/fb783e3e-4369-4b6c-ac4b-a47bca31c6b5)

Implied Router:
 #### It is the central VPC routing function,
 #### It connects the different AZ's together and connects the VPC to the internet Gateway
 #### Each subnet will have a route table the router uses to forward traffic within the VPC
 #### The route tables will also have entries to external destimations
 
