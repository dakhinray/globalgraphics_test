from behave import given, then
import subprocess
from steps.test_lib.support import get_app


@given("the {implementation} is run with input {m}")
def step_impl(context, implementation, m):
    result = subprocess.run([get_app(implementation), m], stdout=subprocess.PIPE)
    assert result.returncode == 0
    context.result = result.stdout


@then("the result should be {n:d}")
def step_impl(context, n):
    assert int(context.result) == n