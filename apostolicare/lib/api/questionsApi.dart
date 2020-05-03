import 'dart:async';
import 'dart:convert';

class QuestinsApi{

  Future <List> loadQuestions() async{

    String json = """[
      {
          "question":"I am a:",
          "answers": {
            "1":"Person",
            "2":"Company",
            "3":"Church",
            "4":""}
      },
      {
          "question":"You can delivery, for those in need, products from:",
          "answers": {
            "1":"Market",
            "2":"Drugstore",
            "3":"Bakery",
            "4":"No, I can not deliver"}
      },
      {
          "question":"Can you chat with those that are feeling lonely ?",
          "answers": {
            "1":"No",
            "2":"Yes",
            "3":"",
            "4":""}
      },
      {
          "question":"Can you donate products for those who are in a vulnerable situation ?",
          "answers": {
            "1":"Yes",
            "2":"No",
            "3":"",
            "4":""}
      }
    ]""";
    return jsonDecode(json);
    }
}
