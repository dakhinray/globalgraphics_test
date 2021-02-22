Feature: Fests for Global Graphics Software Ltd Technical Exercise

	Scenario Outline: Verify that the implementations work on various inputs
		Given the <implementation> is run with input <m>
		Then the result should be <n>
		Examples:
			| implementation | m | n |
			| impl1          |-1  |0  |
			| impl2          |-1  |0  |
			| impl3          |-1  |0  |
			| impl1          |0  |0  |
			| impl2          |0  |0  |
			| impl3          |0  |0  |
			| impl1          |1  |0  |
			| impl2          |1  |0  |
			| impl3          |1  |0  |
			| impl1          |2  |1  |
			| impl2          |2  |1  |
			| impl3          |2  |1  |
			| impl1          |10  |4  |
			| impl2          |10  |4  |
			| impl3          |10  |5  |
			| impl1          |100  |25  |
			| impl2          |100  |25 |
			| impl3          |100  |25  |
			| impl1          |10000  |1229  |
			| impl2          |10000  |1229  |
			| impl3          |10000  |1229  |
