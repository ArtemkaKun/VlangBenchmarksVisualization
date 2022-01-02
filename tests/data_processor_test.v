module tests

import data_structures as structures
import data_processor as proccessor
import math

fn test_calculate_average_result_method() {
	test_cases := {
		'test': [
			structures.VlangBenchmarkData{
				numerical_result: 1
			},
			structures.VlangBenchmarkData{
				numerical_result: 2
			},
			structures.VlangBenchmarkData{
				numerical_result: 3
			},
			structures.VlangBenchmarkData{
				numerical_result: 4
			},
			structures.VlangBenchmarkData{
				numerical_result: 5
			},
			structures.VlangBenchmarkData{
				numerical_result: 5
			},
			structures.VlangBenchmarkData{
				numerical_result: 5
			},
			structures.VlangBenchmarkData{
				numerical_result: 6
			},
			structures.VlangBenchmarkData{
				numerical_result: 7
			},
			structures.VlangBenchmarkData{
				numerical_result: 8
			},
			structures.VlangBenchmarkData{
				numerical_result: 9
			},
			structures.VlangBenchmarkData{
				numerical_result: 10
			},
		]
	}

	average_result := proccessor.calculate_average_result(test_cases)
	assert math.abs(average_result['test'] - 5.41666667) < 0.0001
}
