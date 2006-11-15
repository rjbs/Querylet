use Test::More tests => 4;

BEGIN {
  require_ok('Querylet');
      use_ok('Querylet::Query');
  require_ok('Querylet::Output');
  require_ok('Querylet::Input');
}

diag( "Testing $Querylet::VERSION" );
