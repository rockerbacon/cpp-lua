#include "assert.h"

using namespace std;
using namespace assertion;

assert_error::assert_error (const char* message) : message(message) {}

const char* assert_error::what (void) const throw() {
	return this->message;
}
