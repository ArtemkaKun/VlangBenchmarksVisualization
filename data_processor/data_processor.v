module data_processor

import data_structures as structures

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
