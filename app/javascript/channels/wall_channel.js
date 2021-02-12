import consumer from "./consumer"

consumer.subscriptions.create("WallChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected");
  },

  // "Hello Houssem, I have done the codemirror part, and can use it with any language(only the first language in my mode.html.erb) but can not choose another language in the form."

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log(data);
    wall = document.getElementById('wall')

    wall.innerHTML += 
    "<h2>" + code.title + "</h2>"

    wall.innerHTML += 
    "<p>" + code.body + "</p>"
  }
});