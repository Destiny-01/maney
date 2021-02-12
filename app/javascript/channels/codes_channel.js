import consumer from "./consumer"

consumer.subscriptions.create("CodesChannel", {
  connected() {
    console.log("Connected to the channel")
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data){
    // $('#codes').append; data.code
    console.log(data);
    // Called when there's incoming data on the websocket for this channel
  }
});



