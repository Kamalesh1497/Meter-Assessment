*** Settings ***
Library    RequestsLibrary
Library    Collections
Library    ipaddress

*** Variables ***
${default_api}    https://moc-noc-api.deta.dev/
${meta_api}	https://moc-noc-api.deta.dev/moc-noc/v1/meta
${corp_network}	https://moc-noc-api.deta.dev/moc-noc/v1/network/corp
${guest_network}	https://moc-noc-api.deta.dev/moc-noc/v1/network/guest

*** Test Cases ***
Check Controller Status
    Create Session    mock controller    ${default_api}
    ${response}=    GET On Session    mock controller    ${default_api}
    Should Be Equal As Strings    ${response.status_code}    200
    Log to Console 	Controller is Online.....
    Delete All Sessions

