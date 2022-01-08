module data_processor

import data_structures as structures
import math.stats

pub fn get_grouped_benchmarks_data(benchmarks []structures.VlangBenchmarkData) map[string][]structures.VlangBenchmarkData {
	mut benchmark_name_to_benchmark_data_map := map[string][]structures.VlangBenchmarkData{}

	for benchmark_data in benchmarks {
		if (benchmark_data.benchmark_name in benchmark_name_to_benchmark_data_map) == false {
			benchmark_name_to_benchmark_data_map[benchmark_data.benchmark_name] = []structures.VlangBenchmarkData{}
		}

		benchmark_name_to_benchmark_data_map[benchmark_data.benchmark_name] << benchmark_data
	}

	return benchmark_name_to_benchmark_data_map
}

pub fn prepare_statistic_data(grouped_benchmarks_data map[string][]structures.VlangBenchmarkData) []structures.VlangBenchmarkStatisticData {
	mut benchmark_statistic_data_collection := []structures.VlangBenchmarkStatisticData{}

	for name, benchmark_data in grouped_benchmarks_data {
		average := calculate_average_result(benchmark_data)
		median := calculate_median_result(benchmark_data)
		measure_unit := benchmark_data[0].measure_unit

		benchmark_statistic_data_collection << structures.VlangBenchmarkStatisticData{
			benchmark_name: name
			average_result: '${average:.2f} $measure_unit'
			median_result: '$median $measure_unit'
		}
	}

	return benchmark_statistic_data_collection
}

pub fn get_benchmarks_plot_data(grouped_benchmarks_data map[string][]structures.VlangBenchmarkData) map[string]structures.VlangBenchmarkPlotData {
	mut benchmark_plot_data_map := map[string]structures.VlangBenchmarkPlotData{}

	for benchmark_name, benchmark_data in grouped_benchmarks_data {
		mut results_dates := []string{}
		mut results_values := []int{}

		for benchmark_record in benchmark_data {
			results_dates << benchmark_record.date.format()
			results_values << benchmark_record.numerical_result
		}

		benchmark_plot_data_map[benchmark_name] = structures.VlangBenchmarkPlotData{
			dates: results_dates.reverse()
			numerical_result: results_values.reverse()
			measure_unit: benchmark_data[0].measure_unit
		}
	}

	return benchmark_plot_data_map
}

fn calculate_average_result(benchmarks_data_collection []structures.VlangBenchmarkData) f32 {
	mut sum_of_values := 0

	for benchmark_data in benchmarks_data_collection {
		sum_of_values += benchmark_data.numerical_result
	}

	return sum_of_values / f32(benchmarks_data_collection.len)
}

fn calculate_median_result(benchmarks_data_collection []structures.VlangBenchmarkData) int {
	mut benchmark_results := []int{}

	for benchmark_data in benchmarks_data_collection {
		benchmark_results << benchmark_data.numerical_result
	}

	benchmark_results.sort()

	return stats.median(benchmark_results)
}
