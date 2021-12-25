module data_structures

import time

pub interface IVlangBenchmarkRecord {
	set_result(value string)
	get_benchmark_name() string
	get_date() time.Time
	get_commit_hash() string
	get_commit_message() string
	get_numerical_result() int
	get_measure_unit() string
}

struct VlangBenchmarkData {
	benchmark_name string
	date           time.Time
	commit_hash    string
	commit_message string
mut:
	numerical_result int
	measure_unit     string
}
