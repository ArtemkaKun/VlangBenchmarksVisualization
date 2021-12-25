module data_structures

import time

pub struct VlangBenchmarkData {
	benchmark_name   string
	date             time.Time
	commit_hash      string
	commit_message   string
	numerical_result int
	measure_unit     string
}
