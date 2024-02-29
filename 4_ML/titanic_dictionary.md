## Data Dictionary

| Variable  | Definition                                 | Key                                            |
|-----------|--------------------------------------------|------------------------------------------------|
| survivial | Did the passenger survive the disaster     | 0 = No, 1 = Yes                                |
| pclass    | Passenger's fare class                     | 1 = 1st, 2 = 2nd, 3 = 3rd                      |
| sex       | gender                                     |                                                |
| Age       | Age in years                               |                                                |
| sibsp     | # of siblings / spouses aboard the Titanic |                                                |
| parch     | # of parents / children aboard the Titanic |                                                |
| ticket    | Ticket number                              |                                                |
| fare      | fare or ticket cost paid                   |                                                |
| cabin     | cabin number                               |                                                |
| embarked  | Port of embarkation                        | C = Cherbourg, Q = Queenstown, S = Southampton |


### Variable Notes

age: Age is fractional if less than 1. If the age is estimated, is it in the form of xx.5

sibsp: Includes: brother, sister, stepbrother, stepsister, husband, wife

parch: Inclues: mother, father, daughter, son, stepdaughter, stepson
Some children travelled only with a nanny, therefore parch=0 for them.