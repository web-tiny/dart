void main(){
  var uri = 'http://example.org/api?foo=some message';
  var encoded = Uri.encodeComponent(uri);
  print(encoded);
  var decoded = Uri.decodeComponent(encoded);
  print(decoded);

  /// Parsing URIs
  var uri2 = Uri.parse('http://example.org:8080/foo/bar#frag');
  print(uri2.scheme); // http
  print(uri2.host); // example.org
  print(uri2.path); // /foo/bar
  print(uri2.fragment); // frag
  print(uri2.origin); // http://example.org:8080

  /// Building URIs
  var uri3 = Uri(
    scheme: 'https',
    host: 'example.com',
    path: '/foo/bar',
    fragment: 'frag'
  );
  print(uri3.toString());
}