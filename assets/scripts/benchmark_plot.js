function create_plot(benchmark_name, dates, values, min_date, max_date, min_value, max_value, measure_unit) {
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
                        min: new Date(min_date).valueOf(),
                        max: new Date(max_date).valueOf(),
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
                        min: min_value,
                        max: max_value,
                        ticks: {
                            callback: function (value, index, ticks) {
                                return value + measure_unit;
                            }
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