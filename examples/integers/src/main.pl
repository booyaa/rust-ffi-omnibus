#!/usr/bin/env perl
use v5.10;
use strict;
use warnings;
use FFI::Raw;

# useful os choices example https://metacpan.org/pod/FFI#EXAMPLES
# $clib_file = ($^O eq "MSWin32") ? "MSVCRT40.DLL" : "-lc";
# my $lib_path = "../target/debug/";
# https://www.effectiveperlprogramming.com/2011/04/understand-autovivification/
my $lib_path = "";
my $prefix = "lib"; # same for linux, empty for win32
my $extension = ".dylib"; # ".dll" for win32 / ".so" for linux
$lib_path = $lib_path . $prefix . "integers" . $extension;

my $addition = FFI::Raw->new (
    $lib_path, # library
    "addition", # function
    FFI::Raw::int, # return type
    FFI::Raw::int, FFI::Raw::int # argument types
);

say $addition->call(1, 2)