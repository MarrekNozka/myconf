# Open URL plugin for Vim

Opens URLs on the current line in your default browser via the OS X `open` command, or another command you specify.

Also handles other URIs, e.g. from Spotify.

Trigger with `<leader>u` or `:OpenURL`.

Uses John Gruber's excellent [URL regexp](http://daringfireball.net/2010/07/improved_regex_for_matching_urls).

Requires Vim to be compiled with Ruby support. I started porting the regexp to Vim syntax, then gave up before I could hurt myself.


## Configuration

Defaults to using the OS X `open` binary. You can configure another in your `~/.vimrc`:

    let g:open_url_browser="xdg-open"


## Playground

Try it out on these:

URL: http://example.com

Two URLs, one line: http://example.com/#foo and http://example.com/?foo=bar#baz

Spotify URI: spotify:track:6JEK0CvvjDjjMUBFoXShNZ


## There is already a `gx` in Vim 7.4!

I wrote this plugin before I discovered `gx`, but the plugin still has some benefits:

* You can be anywhere on the line
* If the same line has multiple URLs, it opens all of them
* It opens other URIs, e.g. from Spotify

`gx` has some benefits over this plugin, though, such as cross-platform support and more configurability.


## Credits and license

By [Henrik Nyh](http://henrik.nyh.se/) under the MIT license:

>  Copyright (c) 2012 Henrik Nyh
>
>  Permission is hereby granted, free of charge, to any person obtaining a copy
>  of this software and associated documentation files (the "Software"), to deal
>  in the Software without restriction, including without limitation the rights
>  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
>  copies of the Software, and to permit persons to whom the Software is
>  furnished to do so, subject to the following conditions:
>
>  The above copyright notice and this permission notice shall be included in
>  all copies or substantial portions of the Software.
>
>  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
>  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
>  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
>  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
>  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
>  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
>  THE SOFTWARE.
