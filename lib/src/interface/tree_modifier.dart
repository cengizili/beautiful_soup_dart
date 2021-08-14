import 'package:html/dom.dart';

import '../bs4_element.dart';

/// Contains methods from [Modifying the tree](https://www.crummy.com/software/BeautifulSoup/bs4/doc/#modifying-the-tree).
/// TODO: set/change tag name, remove attribute, newTag, clear, decompose, wrap, unwrap, smooth
abstract class ITreeModifier {
  /// {@macro bs4element_string}
  set string(String? value);

  /// Adds an element just before the closing tags of the current element.
  ///
  /// If you want to pass [Node] instead [Bs4Element], you can do it via
  /// `bs4element.element.append(node)`.
  void append(Bs4Element element);

  /// Adds elements just before the closing tags of the current element,
  /// in order.
  void extend(List<Bs4Element> element);

  /// Creates a whole new tag.
  void _newTag();

  /// It is just like [append], except the new element does not necessarily
  /// go at the end of its parent’s .[contents]. It’ll be inserted at
  /// whatever numeric position you say, just after the opening tag of the
  /// current element.
  ///
  /// If the position is out of range, throws [RangeError].
  ///
  ///
  /// If you want to pass [Node] instead [Bs4Element], you can do it via
  /// `bs4element.element.insert(index, node)`.
  void insert(int position, Bs4Element element);

  /// Inserts an element immediately before the current element in
  /// the parse tree.
  ///
  /// [ref] specifies an position of an element, where should the insertion
  /// apply.
  ///
  /// If the [ref] is not in the parse tree, throws [RangeError].
  ///
  /// If you want to pass [Node] instead [Bs4Element], you can do it via
  /// `bs4element.element.insertBefore(node, nodeRef)`.
  void insertBefore(Bs4Element element, [Bs4Element? ref]);

  /// Inserts an element immediately following the element in the parse tree.
  ///
  /// Without [ref] argument it acts just like the [append] method.
  ///
  /// [ref] specifies an position of an element, where should the insertion
  /// apply.
  ///
  /// If the [ref] is not in the parse tree, throws [RangeError].
  void insertAfter(Bs4Element element, [Bs4Element? ref]);

  /// Removes the contents of a tag.
  void _clear();

  /// Removes an element from the tree.
  ///
  /// Returns the element that was extracted.
  Bs4Element extract();

  /// Removes a tag from the tree, then completely destroys it and its contents.
  void _decompose();

  /// Removes an element from the tree, and replaces it with [otherElement].
  ///
  /// Returns the element that was replaced.
  ///
  ///
  /// If you want to pass [Node] instead [Bs4Element], you can do it via
  /// `bs4element.element.replaceWith(node)`.
  Bs4Element replaceWith(Bs4Element otherElement);

  /// Wraps an element in the tag you specify. It returns the new wrapper.
  Bs4Element _wrap();

  /// [unwrap] is the opposite of [wrap].
  ///
  /// It replaces a tag with whatever’s inside that tag.
  ///
  /// It’s good for stripping out markup.
  void _unwrap();

  /// Cleans up the parse tree by consolidating adjacent strings.
  void _smooth();
}