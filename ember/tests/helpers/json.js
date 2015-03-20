export default function(statusCode, attrs) {
  return function(req){
    return [
      statusCode,
      { 'content-type': 'application/json' },
      JSON.stringify( attrs )
    ];
  };
}
