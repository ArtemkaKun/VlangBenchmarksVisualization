let original_plot_data = new Map();

function add_plot_data(benchmark_name, dates, values, measure_unit) {
    original_plot_data.set(benchmark_name, { dates: dates, values: values, measure_unit: measure_unit })
}