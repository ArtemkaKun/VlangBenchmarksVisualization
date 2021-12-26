import data_collector as data
import data_processor as processor

fn main() {
	benchmarks := data.get_benchmarks_data('https://fast.vlang.io/')
	grouped_benchmarks_by_test := processor.get_grouped_benchmarks_data(benchmarks)
	average_result_by_test := processor.calculate_average_result(grouped_benchmarks_by_test)
	median_result_by_test := processor.calculate_median_result(grouped_benchmarks_by_test)
	println(median_result_by_test)
}
