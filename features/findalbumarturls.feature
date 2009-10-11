Feature: Find URLs of album art on the internet 

  As an avid music collector
  I want all my mp3s to have album art
  So that i can identify individual tracks and enjoy the colorful artwork  

  Scenario: Find URLs of album art for a given album
    Given that i want to find artwork for the album "Daft punk Discovery"
    When I run local executable "findart" with arguments "find 'Daft punk Discovery'"    
    Then I should see  
      """
      http://ecx.images-amazon.com/images/I/210AETN5YXL.jpg
      """
     When I run local executable "findart" with arguments "find --artist 'Daft punk' --title 'Discovery'"
     Then I should also see
     """
     http://ecx.images-amazon.com/images/I/210AETN5YXL.jpg
     """

      
  Scenario: There is no album art found
    Given that i want to find artwork for the album "Irene Moors & De Smurfen Ga Je Mee Naar Smurfenland"
    When I run local executable "findart" with arguments "find 'Irene Moors & De Smurfen Ga Je Mee Naar Smurfenland'"
    Then I should see  
      """
      No album art found for "Irene Moors & De Smurfen Ga Je Mee Naar Smurfenland"
      
      """  
  Scenario: No arguments
    When I run local executable "findart" with arguments "find"
    Then I should see  
      """
      Please provide keywords e.g.
        findart find "Daft punk Discovery"
        findart find --artist "Daft punk" --title "Discovery"
      """ 

                                                                                                  