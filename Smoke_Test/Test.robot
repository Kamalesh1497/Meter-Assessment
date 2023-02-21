*** Settings ***
Library    RequestsLibrary
Library         OperatingSystem

*** Variables ***
${default_api}    https://moc-noc-api.deta.dev/
${meta_api}	https://moc-noc-api.deta.dev/moc-noc/v1/meta
${corp_network}	https://moc-noc-api.deta.dev/moc-noc/v1/network/corp
${guest_network}	https://moc-noc-api.deta.dev/moc-noc/v1/network/guest
${Internet IP}  8.8.8.8
${Corp_Host_IP}           10.100.0.10
${Corp_Gateway_IP}        10.100.0.1
${Guest_Host_IP}           172.16.0.11
${Guest_Gateway_IP}        172.16.0.1
${Subnet_Mask}       255.255.255.0

*** Test Cases ***
Check Controller Status
    Create Session    mock controller    ${default_api}
    ${response}=    GET On Session    mock controller    ${default_api}
    Should Be Equal As Strings    ${response.status_code}    200
    Log to Console 	Controller is Online.....
    Delete All Sessions

Controller Should Reach the Internet

    ${ping response}=  Run  ping -c 1 ${Internet IP}
    Should Contain     ${ping response}  1 received
    Log to Console	Controller is able to reach the internet.....
    
Controller Should Assign IP Addresses to Hosts on LAN

    ${host response}=  Run  ping -c 1 ${Corp_Host_IP}
    Should Contain     ${host response}  1 received
    Log to Console	Controller is able to assign ip.....
    
Controller Should Act as Default Gateway for Hosts on LAN

    ${host response}=  Run  traceroute -n -m 1 ${Internet IP}
    Should Contain     ${host response}  ${Guest_Gateway_IP}
    Log to Console	Controller is acting as default gateway.....
    
Controller Should Have Correct Subnet Configuration

    ${ifconfig response}=  Run  ifconfig
    Should Contain         ${ifconfig response}  ${Subnet_Mask}
    Log to Console	Correct Subnet Configuration.....
