package seulgi.util;

public class Search {
	
	private String option;
	private String keyword;
	
	public Search() {}

	public Search(String option, String keyword) {
		super();
		this.option = option;
		this.keyword = keyword;
	}

	@Override
	public String toString() {
		return "Search [option=" + option + ", keyword=" + keyword + "]";
	}

	public String getOption() {
		return option;
	}

	public void setOption(String option) {
		this.option = option;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
}
