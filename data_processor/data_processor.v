module data_processor

import data_structures as structures
import math.stats

pub fn get_grouped_benchmarks_data(benchmarks []structures.VlangBenchmarkData) map[string][]structures.VlangBenchmarkData {
	mut benchmark_name_to_benchmark_data_map := map[string][]structures.VlangBenchmarkData{}

	for benchmark_data in benchmarks {
		if benchmark_name_to_benchmark_data_map.keys().contains(benchmark_data.benchmark_name) == false {
			benchmark_name_to_benchmark_data_map[benchmark_data.benchmark_name] = []structures.VlangBenchmarkData{}
		}

		benchmark_name_to_benchmark_data_map[benchmark_data.benchmark_name] << benchmark_data
	}

	return benchmark_name_to_benchmark_data_map
}

pub fn calculate_average_result(grouped_benchmarks_data map[string][]structures.VlangBenchmarkData) map[string]f32 {
	mut benchmark_name_to_average_result_map := map[string]f32{}

	for benchmark_name, benchmark_data in grouped_benchmarks_data {
		mut sum_of_values := 0

		for benchmark_record in benchmark_data {
			sum_of_values += benchmark_record.numerical_result
		}

		benchmark_name_to_average_result_map[benchmark_name] = sum_of_values / f32(benchmark_data.len)
	}

	return benchmark_name_to_average_result_map
}

pub fn calculate_median_result(grouped_benchmarks_data map[string][]structures.VlangBenchmarkData) map[string]f32 {
	mut benchmark_name_to_average_result_map := map[string]f32{}

	for benchmark_name, benchmark_data in grouped_benchmarks_data {
		mut benchmark_results := []int{}

		for benchmark_record in benchmark_data {
			benchmark_results << benchmark_record.numerical_result
		}

		benchmark_results.sort()
		benchmark_name_to_average_result_map[benchmark_name] = stats.median(benchmark_results)
	}

	return benchmark_name_to_average_result_map
}
