var btn = document.getElementById("clipboard-btn");
var clipboard = new ClipboardJS(btn);
// Success
clipboard.on("success", function (e) {
  console.log(e);
});
// Error
clipboard.on("error", function (e) {
  console.log(e);
});
