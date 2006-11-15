use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'Querylet',
    AUTHOR              => 'Ricardo SIGNES <rjbs@cpan.org>',
    VERSION_FROM        => 'lib/Querylet.pm',
    ABSTRACT_FROM       => 'lib/Querylet.pm',
    PL_FILES            => {},
    PREREQ_PM => {
        'DBI'            => 1,
        'Filter::Simple' => 0,
        'Test::More'     => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'Querylet-* wafers.csv t/wafers.db' },
);
