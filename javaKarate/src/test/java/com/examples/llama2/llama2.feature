Feature: Chat Completion with Llama2

  Background:
    * def postUrl = 'https://api.replicate.com/v1/predictions'
    * def headers = { 'Authorization': 'Token r8_48ryRqdeWQ2mEekEBiuLUgcZP9tkxG029SsA6','Content-Type': 'application/json' }

    Scenario: post promt and get response from Llama
      Given url postUrl
      And headers headers
      And request
      """
      {
        "version": "02e509c789964a7ea8736978a43525956ef40397be9033abf9fd2badfe68c9e3",
        "input": {
           "prompt": "Hi"
        }
      }
      """
      When method POST
      Then status 201
      * print response
      * def token = response.id
      * def getUrl =  `https://api.replicate.com/v1/predictions/${token}`
      Given url getUrl
      And headers headers
      When method GET
      Then status 200
      * print response.output
