function create_plots() {
    original_plot_data.forEach((plot_data, benchmark_name) => {
        create_plot(benchmark_name, plot_data.dates, plot_data.values, plot_data.measure_unit);
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