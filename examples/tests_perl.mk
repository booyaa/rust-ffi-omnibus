include ${COMMON_TEST_RULES}

${TEST_DIR_${d}}/perl-test: LIB_DIR := ${LIB_DIR_${d}}
${TEST_DIR_${d}}/perl-test: ${d}/src/main.pl ${TEST_DIR_${d}} ${LIB_${d}}
	LD_LIBRARY_PATH=${LIB_DIR} perl $< > $@

.PHONY: perl-test_${d}
perl-test_${d}: EXPECTED := ${d}/expected-output
perl-test_${d}: ${TEST_DIR_${d}}/perl-test
	diff -q ${EXPECTED} $<

perl: perl-test_${d}
