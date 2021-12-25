module vlang_page_parser

import net.html
import data_structures
import time

pub fn parse_html(html_string string) string {
	doc := html.parse(html_string)
	table_rows := doc.get_tag('tr')

	headers := get_table_headers(table_rows[0].children)

	mut benchmark_data_collection := []data_structures.VlangBenchmarkData{}

	for table_row_index in 1 .. table_rows.len {
		table_row_tags := table_rows[table_row_index].children

		for table_cell_index in 3 .. table_row_tags.len {
			table_cell := table_row_tags[table_cell_index]
			benchmark_numerical_result, benchmark_measure_unit := get_value_and_measure_unit(table_cell.content)
			benchmark_data_collection << data_structures.VlangBenchmarkData{
				benchmark_name: headers[table_cell_index]
				date: time.parse(table_row_tags[0].content + ':00') or {panic('Something went wrong while parsing benchmark date')}
				commit_hash: table_row_tags[1].children[0].content
				commit_message: table_row_tags[2].content
				numerical_result: benchmark_numerical_result
				measure_unit: benchmark_measure_unit
			}
		}
	}

	println(benchmark_data_collection.len)

	return ''
}

fn get_table_headers(first_table_row_tags []&html.Tag) []string {
	mut headers := []string{len: first_table_row_tags.len, cap: first_table_row_tags.len}

	for header_tag_index, header_tag in first_table_row_tags {
		headers[header_tag_index] = header_tag.content
	}

	return headers
}

fn get_value_and_measure_unit(string_to_parse string) (int, string) {
	mut value_in_string_form := ''
	mut measure_unit := ''

	for char in string_to_parse {
		if char.is_digit() == true {
			value_in_string_form += char.ascii_str()
		} else {
			measure_unit += char.ascii_str()
		}
	}

	return value_in_string_form.int(), measure_unit
}
