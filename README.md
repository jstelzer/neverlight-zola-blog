# My photo blog setup

So, this is the hacked up suite of things I use to keep up with my motorcycle pics and whatnot.

## Original setup

I tried using wordpress and a bunch of media plugins.

It was slow and hard to use. I just want to drag a bunch of pics out of my photo albums and publish them as a gallery.

I really don't care to fuss with php, server security, databases... it just drains all the motivation out of me.

## Enter zola

This publishing frame work is great! It's a little blog oriented, and not so hot with photo galleries.

## Other tools

I'm using gallery generator via python. The app is called sigal and it generates photo galleries in a variety of formats.

I chopped out the stuff I use and use it to mass process photos.

I'll dump a bunch of pics in a directory. Run sigal on them and then turn the generated index.html into a template, create an markdown file and import the media under static.

Once I sorted out how to mass fix the urls to the media it was very fast and easy to do. Basically I just care about the gallery div that sigal generates, then just slap the right header/footer zola markup on it and run a shell script to update all the link/img tags to follow the convention that I completely made up on the spot.

We'll see how long i stick with it, but so far this is the least annoying setup I've  used.

Right now I'm using the free tier of digitalocean to publish all this. Works well. Minimal effort, good results.
