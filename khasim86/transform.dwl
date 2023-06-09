%dw 2.0
output application/json
/*
As we are using string functions from dataweave, we need to include the string module using import keyword→import * from dw::core::Strings
*/
import * from dw::core::Strings
/*
After import the String module, as our input is an array so we need to iterate over a Map Function.
Now, we are inside array with objects. So use mapObject to iterate over an Object.
Now use substringBefore inbuilt function available in dataweave String module to get the key of first index.
To get the value of first index, we need to use splitBy function.
With this we completed first index.
For the second index we need to use substringAfter inbuilt function
*/
---
payload map ($ mapObject ((value, key, index) ->{
    (substringBefore((key) as String, "|")): (value splitBy"|")[0],
    (substringAfter((key) as String, "|")): (value splitBy"|")[1]
} ) )




/*
o/p:
[
   {
      "bookId":“10101”,
      "bookName":"MuleSoft Dataweave"
   },
   {
      "bookId":“10102”,
      "bookName":"Salesforce Marketing Cloud"
   }
]
*/