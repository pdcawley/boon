Boon: An Ergonomic Command Mode for Emacs
==========================================

Boon is a complete package for modal editing, which is not Evil.

Selling points:
- Ergonomic: common commands are easy to type. (See below)
- Lightweight: ~300 loc for its core.
- Good Emacs integration: integrates with existing Emacs
  infrastructure and takes advantage of it.


Ergonomic Design
----------------

It is largely accepted that modal edition is more ergonomic than using
key-chords.  Boon attempts to make modal editing as comfortable as
possible, by adhering to the following design principles:

- Spacial allocation first, mnemonics second: the allocation of keys
  to commands is based in priority on the locations of keys on the
  keyboard. Whatever is printed on the key cap is a secondary concern.

- Easy finger rolls: common combination should either be left/right
  hand alternation or easy one-hand rolls.

- Use of home row and strong fingers for the most used commands

- Easy navigation: many commands are bound to navigation. This
  facilitates moving around. Because movements double up as
  region-definitions, this design also makes manipulation commands
  more powerful.

- Prefer several two easy keystrokes to one hard-to-reach
  key. hard-to-reach keys are left for rarely used commands.

In command mode, movement keys are bound to the right hand, while text
manipulation is bound to the left hand.


Right-hand.

The leftwards (and upwards) movements are bound to the leftmost
fingers (index and middle finger), while rightwards (and downwards)
movements are bound to the rightmost fingers (ring finger and pinky.)
Additional, unpaired, movements are bound to the middle column
(extended index reach).

Left-hand.

The most common edition commands (cut, paste, parenthesis
manipulation) are bound to the home row. The top row is (mainly) for
searching. The bottom row gives access to regular Emacs stuff (C-x
...) (C-c ...) and registers.


Emacs Integration: Reusable Modules
-----------------------------------

Boon is designed as a stack of layers. Each layer is customizable and
provide reusable components, in full agreement with the Emacs
spirit. This means that even if you disagree with the designed choices
explained above, you may still want to use some parts of Boon. The
structure of Boon is as follows:

1. boon-moves, boon-search: a set of move and search commands. These
   work the same way as standard Emacs commands --- they are merely
   (sometimes) more powerful. Frontends typically bind these commands
   (and more) in boon-moves-map, which is active in 'command mode'.
2. boon-arguments: a set of selectors to define regions. (Equivalent
   of vim 'text objects'.) Selectors include plain regions (words,
   lines, paragraphs, ...), but also region transformers (think:
   exclude borders, just borders, including spaces, foreach,
   etc.). Additionally every move command in boon-moves-map can be
   used as a selector. The system supports multiple-cursors. The
   selectors are regular interactive functions, which means that they
   are easily customized.
3. boon-core: An infrastructure for modal editing. The implementation
   is very much inspired from evil-core, but heavily simplified.
4. boon-main: A set of commands. These are similar to standard Emacs
   commands, but they use the system of selectors described
   above. (For good measure, some random extra commands are thrown
   in.) These commands may be used in combination with a modal system,
   or not. A few commands also switch to insert mode.
5. boon-keys, boon-extras, boon-colemak, boon-qwerty, ...:
   frontends. Those require all the above and provide a mapping of
   moves, selectors and commands onto keys. They may also bind keys
   for other modes, such as helm.

Installation
------------

REQUIREMENTS
- Emacs version >= 24.5
- Qwerty or Colemak layout (workman version partially implemented).

Install Boon (perhaps using
[![MELPA](http://stable.melpa.org/packages/boon-badge.svg)](http://stable.melpa.org/#/boon)),
and add the following to your configuration:

    (require 'boon-colemak)
    ;; (require 'boon-qwerty) ;; for qwerty port (alpha quality)
    (boon-powerline-theme) ;; if you want use powerline with Boon

Then

    (boon-mode) ;; to enable boon everywhere

If you just eval'ed the above (or just did not want to enable boon
everywhere), Boon may not be active in the current buffer. If it is
not activated and you want to try it locally, activate it by

    M-x turn-on-boon-mode

Usage
-----

You can jump-start by reading the
[cheat sheet](https://pdf.yt/d/hSKUThNNSxrNFXkQ) directly, but reading
through the tutorial is highly recommended:

    M-x boon-tutorial

(You'll get the version of the tutorial adapted to the frontend you
selected, qwerty or colemak.)

Configuration
-------------

The main variables to configure are:

boon-select-map, boon-moves-map, boon-command-map, boon-enclosures

Comparison with other modal layers for Emacs
---------------------------------------------

As far as I know, none of the other modal mode care about ergonomics
(beside being modal).

- Evil

  Evil is a (quite) complete vi emulation layer for Emacs.

  In Boon, quite a bit of Emacs structure and user experience is
  retained. Examples: the x key gives the C-x prefix map.  The usual
  Emacs (interactive) arguments are used for text objects. Thus most of
  Boon remains usable even if one does not wish to use modal editing.

  Besides, Emacs is already customizable enough as it is: the core of
  Boon is just 300 lines or so. Figuring out all the ins and outs of
  Evil to do what I want would probably have required more effort than
  implementing Boon.

  Finally, evil use vi bindings (by default at least), which do not
  feature the best ergonomics.

- Fingers https://github.com/fgeller/fingers.el

  Fingers borrows a few ideas from Boon, including the division of work
  between left and right hand. fgeller gives a detailed account of the
  particular differences with Boon. My opinion is that fingers is
  compatible with Boon concepts and could be implemented as a Boon
  'frontend'.

- God-mode https://github.com/chrisdone/god-mode

  God-mode is similar to "sticky modifier keys" in principle. Its
  simplicity allows to quickly get up to speed with it. However, it
  lacks the main benefit of a true modal layer: text operators. (what
  vi fans call a "language for text edition").

- Modal Mode http://retroj.net/modal-mode

  Another modal layer for Emacs, which is also lightweight and aims to
  integrate with Emacs. However, as far as I can see, there is no
  special attention to ergonomics.

- Modal Emacs https://github.com/joelmccracken/modal-emacs

  Modal Emacs does not appear to be complete.

