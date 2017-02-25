![Dance of Death](https://upload.wikimedia.org/wikipedia/commons/thumb/8/84/Dance_of_Death_%28replica_of_15th_century_fresco%3B_National_Gallery_of_Slovenia%29.jpg/2048px-Dance_of_Death_%28replica_of_15th_century_fresco%3B_National_Gallery_of_Slovenia%29.jpg)

I made a [memento mori](https://en.wikipedia.org/wiki/Memento_mori) for my [i3 window manager](http://i3wm.org/).

Inspired by [Delphi](https://itunes.apple.com/us/app/delphi-simplicity-clarity/id1172671058?mt=8) i added a countdown till my 75th birthday and a countdown till my next birthday to the i3status bar.

It looks like this:

![i3status Memento Mori](/files/blog/memento-mori/i3status_memento_mori.png)

It shows that if I'm lucky enough to live till 75, i have around 17000 days left. 17000? Does that sound like a lot? What will happen as these days go by?

What does that mean? What should we make out of it? Make plans? Focus on present? Something else? Well, i don't know.

As [someone already dead](http://news.stanford.edu/2005/06/14/jobs-061505/) said:

> Almost everything — all external expectations, all pride, all fear of embarrassment or failure — these things just fall away in the face of death, leaving only what is truly important. [...] [Y]ou have [nothing] to lose. You are already naked. There is no reason not to follow your heart.

Is that the answer? I don't know, but it's not a bad one.


One thing is certain. I'm going to die. You too. It might as well happen today.

---

You can use [a bash script](/files/blog/memento-mori/custom_i3status.sh) to add the functionality to your i3status. You need to change your life expectancy and birthday there. You also need to change your i3 config file to

```
bar {
        # status_command i3status # old
        status_command . /home/custom-path-which-you-need-to-edit/custom_i3status.sh # new
}
```

The script is not very user friendly. Look for comments surrounded by `########` to locate the custom parameters there.

Or just take the pieces you find useful.

Have fun!

![Danse Macabre](https://upload.wikimedia.org/wikipedia/commons/b/bf/Danse_macabre_by_Michael_Wolgemut.png)
