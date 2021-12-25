module vlang_page_parser

import net.html

pub fn parse_html(html_string string) string {
	doc := html.parse(html_string)
	table_rows := doc.get_tag('tr')

	table_headers := table_rows[0].children
	mut headers := []string{len: table_headers.len, cap: table_headers.len}

	for header_tag_index, header_tag in table_headers {
		headers[header_tag_index] = header_tag.content
	}

	println(headers)

	return ''
}
