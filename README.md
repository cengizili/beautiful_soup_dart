# Beautiful Soup

[![pub package](https://img.shields.io/pub/v/beautiful_soup_dart.svg)](https://pub.dev/packages/beautiful_soup_dart)
![tests](https://github.com/mzdm/beautiful_soup/actions/workflows/main.yml/badge.svg)

[comment]: <> ([![codecov]&#40;https://codecov.io/gh/mzdm/beautiful_soup/branch/master/graph/badge.svg&#41;]&#40;https://codecov.io/gh/mzdm/beautiful_soup&#41;)

Dart native package inspired by Beautiful Soup 4 Python library. Provides easy ways of navigating, searching, and
modifying the HTML tree.

## Usage

A simple usage example:

```dart
import 'package:beautiful_soup_dart/beautiful_soup.dart';

/// 1. parse a document String
BeautifulSoup bs = BeautifulSoup(html_doc_string);
// use BeautifulSoup.fragment(html_doc_string) if you parse a part of html

/// 2. navigate quickly to any element
bs.body!.a!; // get String representation of this element, same as outerHtml
bs.find('p', attrs: {'class': 'story'}); // finds first element with html tag "p" and which has "class" attribute with value "story"
bs.findAll('a', attrs: {'class': true}); // finds all elements with html tag "a" and which have defined "class" attribute with whatever value
bs.find('', customSelector: '#link1'); // find with custom CSS selector (other parameters are ignored)

Bs4Element bs4 = bs.body!.p!; // quickly with tags

/// 3. perform any other actions for the navigated element
bs4.name; // get tag name
bs4.string; // get text
bs4.toString(); // get String representation of this element, same as outerHtml
bs4.innerHtml; // get html elements inside the element
bs4.className; // get class attribute value
bs4['class']; // get class attribute value
bs4['class'] = 'board'; // change class attribute value to 'board'
bs4.children; // get all element's children elements
bs4.replaceWith(otherBs4Element); // replace with other element
... and many more
```

Check `test` folder for more examples.

## Table of Contents

The unlinked titles are not yet implemented.

- [Navigating the tree](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#navigating-the-tree)
    - [Going down](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#going-down)
        - [Navigating using tag names](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#navigating-using-tag-names)
        - [.contents and .children](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#contents-and-children)
        - [.descendants](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#descendants)
        - [.string](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#string)
        - [.strings and .strippedStrings](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#strings-and-stripped-strings)
    - [Going up](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#going-up)
        - [.parent](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#parent)
        - [.parents](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#parents)
    - [Going sideways](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#going-sideways)
        - [.nextSibling and .previousSibling](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#next-sibling-and-previous-sibling)
        - [.nextSiblings and .previousSiblings](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#next-siblings-and-previous-siblings)
    - [Going back and forth](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#going-back-and-forth)
        - [.nextElement and .previousElement]() - returns next/previous Bs4Element
        - [.nextElements and .previousElements]()
        - [.nextParsed and .previousParsed]() - returns next/previous any parsed Node (doc comments, tags, text), to get its data as String use `node.data`
        - [.nextParsedAll and .previousParsedAll]()
- [Searching the tree]()
    - [findFirstAny()]() - returns the top most (first) element of the parse tree, of any tag type
    - [findAll()](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#find-all)
    - [find()](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#find)
    - [findParents() and findParent()]()
    - [findNextSiblings() and findNextSibling()]()
    - [findPreviousSiblings() and findPreviousSibling()]()
    - [findAllNextElements() and findNextElement()]()
    - [findAllPreviousElements() and findPreviousElement()]()
    - [findNextParsedAll() and findNextParsed()]()
    - [findPreviousParsedAll() and findPreviousParsed()]()
- Modifying the tree
    - [Changing tag names and attributes](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#changing-tag-names-and-attributes)
    - [Modifying .string](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#modifying-string)
    - [append()](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#append)
    - [extend()](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#extend)
    - newTag()
    - [insert()](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#insert)
    - [insertBefore() and insertAfter()](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#insert-before-and-insert-after)
    - clear()
    - [extract()](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#extract)
    - decompose()
    - [replaceWith()](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#replace-with)
    - wrap()
    - unwrap()
    - smooth()
- Output
    - prettify()
    - escape()
    - unescape()
    - [getText()](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#get-text)

Other functions from the `Element` from `html package` can be accessed via `bs4element.element`.

## Features and bugs

Please file feature requests and bugs at the [issue tracker](https://github.com/mzdm/beautiful_soup/issues) or feel
free to raise a PR.