module vlang_page_parser

import net.html
import data_structures as structures
import time

const (
	table_row_tag                     = 'tr'
	benchmark_date_parsing_error      = 'Something went wrong while parsing benchmark date'
	time_seconds_prefix               = ':00'
	expected_count_of_service_headers = 3
)

pub fn parse_html(html_string string) []structures.VlangBenchmarkData {
	table_rows := get_table_rows(html_string)
	benchmark_names := get_benchmark_names(table_rows[0].children)
	return get_benchmark_data(benchmark_names, table_rows)
}

fn get_table_rows(html_string string) []&html.Tag {
	doc := html.parse(html_string)

	return doc.get_tag(vlang_page_parser.table_row_tag)
}

fn get_benchmark_names(first_table_row_tags []&html.Tag) []string {
	mut benchmark_names := []string{}

	for header_tag_index in vlang_page_parser.expected_count_of_service_headers .. first_table_row_tags.len {
		benchmark_names << first_table_row_tags[header_tag_index].content
	}

	return benchmark_names
}

fn get_benchmark_data(benchmark_names []string, table_rows []&html.Tag) []structures.VlangBenchmarkData {
	mut benchmark_data_collection := []structures.VlangBenchmarkData{}

	for table_row_index in 1 .. table_rows.len {
		table_row_tags := table_rows[table_row_index].children
		benchmark_data_collection << proceed_table_cells(benchmark_names, table_row_tags)
	}

	return benchmark_data_collection
}

fn proceed_table_cells(benchmark_names []string, table_cells []&html.Tag) []structures.VlangBenchmarkData {
	mut benchmark_data_collection := []structures.VlangBenchmarkData{}

	for table_cell_index in vlang_page_parser.expected_count_of_service_headers .. table_cells.len {
		benchmark_name := benchmark_names[table_cell_index - vlang_page_parser.expected_count_of_service_headers]

		benchmark_date := time.parse(table_cells[0].content + vlang_page_parser.time_seconds_prefix) or { // Add seconds prefix, because of benchmark date is in form YYYY-MM-DD HH:MM but Time.parse can only parse YYYY-MM-DD HH:MM:SS. 25.12.2021. Artem Yurchenko
			panic(vlang_page_parser.benchmark_date_parsing_error)
		}

		benchmark_commit_hash := table_cells[1].children[0].content
		benchmark_numerical_result, benchmark_measure_unit := get_value_and_measure_unit(table_cells[table_cell_index].content)

		benchmark_data_collection << structures.VlangBenchmarkData{
			benchmark_name: benchmark_name
			date: benchmark_date
			commit_hash: benchmark_commit_hash
			commit_message: table_cells[2].content
			numerical_result: benchmark_numerical_result
			measure_unit: benchmark_measure_unit
		}
	}

	return benchmark_data_collection
}

fn get_value_and_measure_unit(string_to_parse string) (int, string) {
	mut value_in_string_form := ''
	mut measure_unit := ''

	for char in string_to_parse {
		if char.is_digit() {
			value_in_string_form += char.ascii_str()
		} else {
			measure_unit += char.ascii_str()
		}
	}

	return value_in_string_form.int(), measure_unit.trim_space()
}
