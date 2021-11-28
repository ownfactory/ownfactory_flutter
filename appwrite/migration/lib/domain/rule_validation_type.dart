enum RuleValidationType {
  /// Any string value.
  text,

  /// Any integer or float
  numeric,

  /// Any boolean value.
  boolean,

  /// Accept any value.
  wildcard,

  ///	Any valid URL.
  url,

  ///	Any valid email address.
  email,

  ///	Any valid IP v4 or v6 address.
  ip,

  ///	Accept a valid child document.
  /// When using this type you are also required to pass the 'list' parameter with an
  /// array of the collections UID values of the document types you want to accept.
  document,
}
