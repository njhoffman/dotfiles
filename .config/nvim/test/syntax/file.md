= Markdown Cheatsheet =

Looks better in markdown syntax:
* inline html
* blockquotes
* link colors

Looks better in vimwiki syntax:
* strikethrough
* fenced code blocks
* tables
* image links except reference color

# ============= HEADERS =============

# ======== H1 =========

## ======== H2 =========

### ========= H3 =========

####  ========= H4 =========

##### ========= H5 ==========

###### ========= H6 ==========

Alternatively, for H1 and H2, an underline-ish style:

# Alt-H1

## Alt-H2

# ============= EMPHASIS =============

Emphasis, aka italics, with _asterisks_ or _underscores_.

Strong emphasis, aka bold, with **asterisks** or **underscores**.

Combined emphasis with **asterisks and _underscores_**.

Strikethrough uses two tildes. ~~Example strikethrough.~~

# ============= LISTS =============

_Spaces marked by dot (⋅)_

```
1. First ordered list item
2. Another item
⋅⋅* Unordered sub-list.
1. Actual numbers don't matter, just that it's a number
⋅⋅1. Ordered sub-list
4. And another item.

⋅⋅⋅You can have properly indented paragraphs within list items. Notice the blank line above, and the leading spaces (at least one, but we'll use three here to also align the raw Markdown).

⋅⋅⋅To have a line break without a paragraph, you will need to use two trailing spaces.⋅⋅
⋅⋅⋅Note that this line is separate, but within the same paragraph.⋅⋅
⋅⋅⋅(This is contrary to the typical GFM line break behaviour, where trailing spaces are not required.)

* Unordered list can use asterisks
- Or minuses
+ Or pluses
```

1. First ordered list item
2. Another item
  * Unordered sub-list.
1. Actual numbers don't matter, just that it's a number
  1. Ordered sub-list
4. And another item.

   You can have properly indented paragraphs within list items. Notice the blank line above, and the leading spaces (at least one, but we'll use three here to also align the raw Markdown).

   To have a line break without a paragraph, you will need to use two trailing spaces.
   Note that this line is separate, but within the same paragraph.
   (This is contrary to the typical GFM line break behaviour, where trailing spaces are not required.)
* Unordered list can use asterisks
- Or minuses
+ Or pluses

# ============= LINKS =============

[I'm an inline-style link](https://www.google.com)
[I'm an inline-style link with title](https://www.google.com "Google's Homepage")
[I'm a reference-style link][arbitrary case-insensitive reference text]
[I'm a relative reference to a repository file](./linked.md)

[You can use numbers for reference-style link definitions][1]

Or leave it empty and use the [link text itself].

URLs and URLs in angle brackets will automatically get turned into links.
http://www.example.com or <http://www.example.com> and sometimes
example.com (but not on Github, for example).

Some text to show that the reference links can follow later.

[arbitrary case-insensitive reference text]: https://www.mozilla.org
[1]: http://slashdot.org
[link text itself]: http://www.reddit.com

_Youtube Videos_
<a href="http://www.youtube.com/watch?feature=player_embedded&v=YOUTUBE_VIDEO_ID_HERE
 " target="_blank"><img src="http://img.youtube.com/vi/YOUTUBE_VIDEO_ID_HERE/0.jpg"
  alt="IMAGE ALT TEXT HERE" width="240" height="180" border="10" /></a>

# ============= IMAGES =============

Here's our logo (hover to see the title text):

Inline-style:
![alt text](https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png 'Logo Title Text 1')

Reference-style:
![alt text][logo]

[logo]: https://github.com/adam-p/markdown-here/raw/master/src/common/images/icon48.png 'Logo Title Text 2'

# ============= SYNTAX HIGHLIGHTING =============

```javascript
var s = 'JavaScript syntax highlighting';
alert(s);
```

```sh
echo "Hello from a shell: $PWD"
```

```python
s = "Python syntax highlighting"
print s
```

```
No language indicated, so no syntax highlighting.
But let's throw in a <b>tag</b>.
```

# ============= TABLES =============

Colons can be used to align columns.

| Tables        |      Are      |   Cool |
| ------------- | :-----------: | -----: |
| col 3 is      | right-aligned | \$1600 |
| col 2 is      |   centered    |   \$12 |
| zebra stripes |   are neat    |    \$1 |

There must be at least 3 dashes separating each header cell.
The outer pipes (|) are optional, and you don't need to make the
raw Markdown line up prettily. You can also use inline Markdown.

| Markdown | Less      | Pretty     |
| -------- | --------- | ---------- |
| _Still_  | `renders` | **nicely** |
| 1        | 2         | 3          |

# ============= BLOCK QUOTES =============

> Blockquotes are very handy in email to emulate reply text.
>
> > This line is part of the same quote.
>
> Quote break.
>
> > This is a very long line that will still be quoted properly when it wraps. Oh boy let's keep writing to make sure this is long enough to actually wrap for everyone. Oh, you can _put_ **Markdown** into a blockquote.

# ============= INLINE HTML =============

<dl>
  <dt>Definition list</dt>
  <dd>Is something people use sometimes.</dd>

  <dt>Markdown in HTML</dt>
  <dd>Does *not* work **very** well. Use HTML <em>tags</em>.</dd>
</dl>

# ============= HORIZONTAL RULE =============

Three or more...

---

Hyphens

---

Asterisks

---

Underscores

# ============= LINE BREAKS =============

Here's a line for us to start with.

This line is separated from the one above by two newlines, so it will be a _separate paragraph_.

This line is also a separate paragraph, but...
This line is only separated by a single newline, so it's a separate line in the _same paragraph_.

# ============= VIMWIKI =============

* Tags in format ":tag-one:tag-two:"
  * Tagged with file if in two first lines of file
  * Tagged with header if within two lines of header
  * Tagged as itself otherwise
* Use tag in an anchor: `[[Filename#tag-one]]`
* Tags kind of suck, why bother
