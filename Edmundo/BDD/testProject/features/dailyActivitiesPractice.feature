Feature: Daily Activites

Scenario: automate a testcase
  Given "TC001" manual test
  When I complete the test
  Then the test is automated

Scenario: write daily report
  Given manual test automated
  When I finish 8 hours of work
  Then the daily report should look like:
    |id   |status  |
    |TC001|complete|
