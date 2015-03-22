/**
 * A little test helper function for building up JSON response bodies
 * from the provided object, for use with pretender.
 *
 * Eg:
 *
 *     server.get('/foo', json(200, { foo: "bar" })
 *
 * This will return a function that accepts the request, and returns
 * a response object as expected by Pretender, with 200 status code,
 * content-type headers set, and '{"foo":"bar"}' as the response body.
 */
export default function(statusCode, attrs) {
  return function(req){
    return [
      statusCode,
      { 'content-type': 'application/json' },
      JSON.stringify( attrs )
    ];
  };
}
