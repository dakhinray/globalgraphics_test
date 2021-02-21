from behave import given, then
import subprocess
from steps.test_lib.support import get_app
from hamcrest import assert_that

@given("the {implementation} is run with input {m}")
def step_impl(context, implementation, m):
    result = subprocess.run([get_app(implementation), m], stdout=subprocess.PIPE)
    assert_that(result.returncode == 0, "Program failed expected 0 recieved: {}.".format(result.returncode))
    context.result = result.stdout


@then("the result should be {n:d}")
def step_impl(context, n):
    assert_that(int(context.result) == n, "Wrong result, expected: {}, but recievd {}".format(n,int(context.result)))