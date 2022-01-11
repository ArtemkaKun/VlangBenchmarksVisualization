function create_plots(plot_start_day, plot_end_day) {
    original_plot_data.forEach((plot_data, benchmark_name) => {
        let selected_dates = Array();
        let selected_values = Array();

        for (let data_index = 0; data_index < plot_data.dates.length; data_index++) {
            if (new Date(plot_data.dates[data_index]) >= plot_start_day || new Date(plot_data.dates[data_index]) <= plot_start_day) {
                selected_dates.push(plot_data.dates[data_index]);
                selected_values.push(plot_data.dates[data_index]);
            }
        }

        create_plot(benchmark_name, selected_dates, selected_values, plot_data.measure_unit);
    });
}

function create_plot(benchmark_name, dates, values, measure_unit) {
    new Chart(
        benchmark_name,
        {
            type: "line",
            data: {
                labels: dates,
                datasets: [{
                    data: values
                }]
            },
            options: {
                animation: false,
                spanGaps: true,
                scales: {
                    x: {
                        type: 'time',
                        grid: {
                            display: false
                        },
                        time: {
                            unit: 'day',
                            stepSize: 3,
                            displayFormats: {
                                day: 'yyyy-MM-dd'
                            }
                        }
                    },
                    y: {
                        type: 'linear',
                        ticks: {
                            callback: (value) => value + ' ' + measure_unit
                        }
                    }
                },
                elements: {
                    point: {
                        radius: 0
                    }
                },
                plugins: {
                    legend: {
                        display: false,
                    },
                    title: {
                        display: true,
                        text: benchmark_name,
                        font: {
                            size: 36
                        }
                    }
                }
            }
        }
    );
}