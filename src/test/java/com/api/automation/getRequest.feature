Feature: Test end point of the get Request

  Background: Define URL:
    Given url 'https://conduit-api.bondaracademy.com/api/'

  Scenario: To get the tags from the application
    * configure ssl = true
    Given path "tags"
    When method GET
    Then status 200
    And match response.tags != null
    And match response.tags contains 'Git'
    And match response.tags == ['Test','Blog','Git','YouTube','Slack','Bondar Academy','GitHub','Zoom','Value-Focused','Start for Free']
    And match response.tags contains ['Git', 'Blog']
    And match response.tags !contains 'Python'
    And match response.tags =='#array'
    And match each response.tags == '#string'

  Scenario: To get 10 records from the application
    * configure ssl = true
    #	Given params {limit:10, offset:0}
    Given param limit = 10
    And param offset = 0
    Given path 'articles'
    #Given url 'https://conduit-api.bondaracademy.com/api/articles?limit=10&offset=0'
    When method GET
    Then status 200
    And match response != null
	#And match response.articles == '#[10]'        # array size
  #And match response.articlesCount == '#number'   # type check
  #And match response.articlesCount == response.articles.length  # consistency check
  
  Scenario: Create and get record

  Given url "https://api.restful-api.dev/objects"

  And request
  """
  {
    "name": "Apple MacBook Pro 16",
    "data": {
      "year": 2019,
      "price": 1849.99,
      "CPU model": "Intel Core i9",
      "Hard disk size": "1 TB"
    }
  }
  """

  When method POST
  Then status 200

  * def id = response.id

  Given url "https://api.restful-api.dev/objects/" + id
  When method GET
  Then status 200
