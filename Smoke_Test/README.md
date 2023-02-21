Test Case 1 :Check Controller Status
This test case validates that the controller is up and running and able to respond to API requests.
Send a request to the controller's API endpoint to retrieve the status.
Verify that the response status code is 200.

Test Case 2 : Check Connectivity to Internet
This test case checks if the controller is able to reach the internet by pinging a well-known IP address 
(in this case, Google's public DNS server at 8.8.8.8). 
If the ping is successful, the test logs a message saying "Controller is able to reach the internet". 
If the ping is unsuccessful, the test fails and logs an error message.

Test Case 3 : Controller Should Act as Default Gateway for Hosts on LAN
This test case validates that the controller is acting as the default gateway for hosts on the LAN. 
Send a ping request from a host on the LAN to an external IP address.
Verify that the ping request is successful.
Verify that the ping request was routed through the controller.

Test Case 4 : Controller Should Have Correct Subnet Configuration
This test case validates that the controller has the correct subnet configuration. 
Verify that the subnet configuration is correct for the LAN by running ifconfig 
