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

 ### Implied Router:
 ##### It is the central VPC routing function,
 ##### It connects the different AZ's together and connects the VPC to the internet Gateway
 ##### Each subnet will have a route table the router uses to forward traffic within the VPC
 ##### The route tables will also have entries to external destinations

 ### Route Tables
 #### You can have up to 200 route tables per VPC
 #### You can have up to 50 route entries per route table
 #### Each subnet MUST be associated with only one route table at any given time
 #### If you do not specify a subnet-to-route-table association, the subnet(when created) will be associated with the main(default) VPC route table.
 ####  You can change the subnet association to another route table.
 #### You can also edit the main (dafault) route table if you need, but you can NOT delete the Main(default) route table.
     -- However, you can make a custom route table manaually become the main route table, then you can delete the former main, as it no longer a main route table

 #### Every route table in a VPC comes with a default rule that allows all VPC subnets to communicate with one another
     
     - You can NOT modify or delete this rule

 ## VPC IP Addressing:
 #### Once the VPC is created, you can NOT change its CIDS block range.
 #### If you need a different CIDR size, create a new VPC
 #### The different subnets within a VPC can NOT overlap ( basic TCP/IP rule)
 #### You can however, expand your VPC CIDR by adding new/extra IP addres ranges.
 
 
