module data_collector

import vlang_page_parser
import net.http

pub fn get_benchmarks_data(page_address string) string {
	page_html_string := http.get_text(page_address)

	return vlang_page_parser.parse_html(page_html_string)
}
