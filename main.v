import data_collector as data
import data_processor as processor

fn main() {
	benchmarks := data.get_benchmarks_data('https://fast.vlang.io/')
	grouped_benchmarks_by_test := processor.get_grouped_benchmarks_data(benchmarks)
	println(grouped_benchmarks_by_test.len)
}
