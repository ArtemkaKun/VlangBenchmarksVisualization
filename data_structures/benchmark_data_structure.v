module data_structures

import time

interface VlangBenchmarkRecord {
	set_benchmark_name(value string)
	set_date(value time.Time)
	set_commit_hash(value string)
	set_commit_message(value string)
	set_result(value string)
	get_benchmark_name() string
	get_date() time.Time
	get_commit_hash() string
	get_commit_message() string
	get_numerical_result() int
	get_measure_unit() string
}
