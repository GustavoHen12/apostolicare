import 'dart:async';
import 'dart:convert';

class MessagesApi{

  Future <List> loadMessages() async{

    String json = """[
      {
          "name":"Galadriel",
          "img":"https://images.unsplash.com/photo-1546019170-f1f6e46039f5?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
          "text":"Lorem ipsum dolor sit amet, consectetur adipiscing elit."
      },
      {
          "name":"Dinossauro verde",
          "img":"https://images.unsplash.com/photo-1511367461989-f85a21fda167?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
          "text":"Lorem ipsum dolor sit amet, consectetur adipiscing elit."
      },
      {
          "name":"Dinossauro Azul",
          "img":"https://images.unsplash.com/photo-1529397938791-2aba4681454f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
          "text":"Lorem ipsum dolor sit amet, consectetur adipiscing elit."
      },
      {
          "name":"Gorila Laranja",
          "img":"https://images.unsplash.com/photo-1545912453-db258ca9b7b7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
          "text":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam blandit erat vel nulla blandit luctus sit amet in arcu"
      },
      {
          "name":"Caldas Aulete",
          "img":"https://images.unsplash.com/photo-1565260524775-7e9b536fba2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
          "text":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam blandit erat vel nulla blandit luctus sit amet in arcu"
      },
      {
          "name":"Dinossauro Azul",
          "img":"https://images.unsplash.com/photo-1529397938791-2aba4681454f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
          "text":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam blandit erat vel nulla blandit luctus sit amet in arcu"
      },
      {
          "name":"Gorila Laranja",
          "img":"https://images.unsplash.com/photo-1545912453-db258ca9b7b7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
          "text":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam blandit erat vel nulla blandit luctus sit amet in arcu"
      },
      {
          "name":"Caldas Aulete",
          "img":"https://images.unsplash.com/photo-1565260524775-7e9b536fba2f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60",
          "text":"Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam blandit erat vel nulla blandit luctus sit amet in arcu"
      }
    ]""";
    return jsonDecode(json);
    }
}
