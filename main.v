import data_collector as data
import data_processor as processor
import vweb

struct App {
	vweb.Context
}

fn main() {
	mut app := &App{}
	app.handle_static('assets', true)
	app.serve_static('/v-logo.png', 'assets/images/v-logo.png')
	app.serve_static('/vbv.png', 'assets/images/vbv.png')
	app.serve_static('/favicon.png', 'assets/images/favicon.png')
	vweb.run(app, 8080)
}

pub fn (mut app App) index() vweb.Result {
	benchmarks := data.get_benchmarks_data('https://fast.vlang.io/')
	grouped_benchmarks_by_test := processor.get_grouped_benchmarks_data(benchmarks)
	average_result_by_test := processor.calculate_average_result(grouped_benchmarks_by_test)
	formated_average_result := processor.format_average_result(average_result_by_test)
	median_result_by_test := processor.calculate_median_result(grouped_benchmarks_by_test)

	benchmarks_plot_data := processor.get_benchmarks_plot_data(grouped_benchmarks_by_test)

	return $vweb.html()
}
