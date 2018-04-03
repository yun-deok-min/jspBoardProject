import java.sql.Timestamp;

public class BoardDto {
	private int txt_no;
	private String txt_title;
	private String txt_content;
	private String txt_writer;
	private String txt_pos;
	private String txt_depth;
	private String txt_read_count;
	private Timestamp txt_regdate;
	private String txt_writer_ip;
	public int getTxt_no() {
		return txt_no;
	}
	public void setTxt_no(int txt_no) {
		this.txt_no = txt_no;
	}
	public String getTxt_title() {
		return txt_title;
	}
	public void setTxt_title(String txt_title) {
		this.txt_title = txt_title;
	}
	public String getTxt_content() {
		return txt_content;
	}
	public void setTxt_content(String txt_content) {
		this.txt_content = txt_content;
	}
	public String getTxt_writer() {
		return txt_writer;
	}
	public void setTxt_writer(String txt_writer) {
		this.txt_writer = txt_writer;
	}
	public String getTxt_pos() {
		return txt_pos;
	}
	public void setTxt_pos(String txt_pos) {
		this.txt_pos = txt_pos;
	}
	public String getTxt_depth() {
		return txt_depth;
	}
	public void setTxt_depth(String txt_depth) {
		this.txt_depth = txt_depth;
	}
	public String getTxt_read_count() {
		return txt_read_count;
	}
	public void setTxt_read_count(String txt_read_count) {
		this.txt_read_count = txt_read_count;
	}
	public Timestamp getTxt_regdate() {
		return txt_regdate;
	}
	public void setTxt_regdate(Timestamp txt_regdate) {
		this.txt_regdate = txt_regdate;
	}
	public String getTxt_writer_ip() {
		return txt_writer_ip;
	}
	public void setTxt_writer_ip(String txt_writer_ip) {
		this.txt_writer_ip = txt_writer_ip;
	}
}
