Feature: What sites are being used when searching for album art 

  As a user
  I want to know what sites are being used to search for artwork
  So that I can see where my artwork is coming from  

  Scenario: Several sites are being used to search for album art
    When I run local executable "findart" with arguments "sites"    
    Then I should see  
      """
      Sites currently used to search for art:
      """
