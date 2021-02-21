Feature: Fests for Global Graphics Software Ltd Technical Exercise

	Scenario Outline: Verify that the implementations work on various inputs
		Given the <implementation> is run with input <m>
		Then the result should be <n>
		Examples:
			| implementation | m | n |
			| impl1          |0  |0  |
			| impl2          |0  |0  |
			| impl2          |0  |0  |