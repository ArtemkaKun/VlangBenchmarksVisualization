module data_collector

import vlang_page_parser as parser
import net.http
import data_structures as structures

pub fn get_benchmarks_data(page_address string) []structures.VlangBenchmarkData {
	page_html_string := http.get_text(page_address)

	return parser.parse_html(page_html_string)
}
