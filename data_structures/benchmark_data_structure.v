module data_structures

import time

pub struct VlangBenchmarkData {
pub:
	benchmark_name   string
	date             time.Time
	commit_hash      string
	commit_message   string
	numerical_result int
	measure_unit     string
}

pub struct VlangBenchmarkPlotData {
pub:
	dates            []string
	numerical_result []int
	measure_unit     string
}

pub struct VlangBenchmarkStatisticData {
pub:
	benchmark_name string
	average_result string
	median_result  string
}
