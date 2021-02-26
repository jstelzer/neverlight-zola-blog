$(".gallery").colorbox({
  rel:"gallery",
  transition:"none",
  maxWidth: "90%",
  maxHeight: "90%",
  scalePhotos: true,
  current: "{current} / {total}",
  title: function () {
    title = this.title;
    if(this.hasAttribute("data-big")) {
      title += " (full size)".link(this.getAttribute("data-big"));
    }
    if(this.hasAttribute("data-date")) {
      title += this.getAttribute("data-date");
    }
    return title;
  },
  inline: function() {
    return this.hasAttribute("inline");
  }
});

