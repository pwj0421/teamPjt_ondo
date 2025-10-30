package dto;

public class ComuCommentDto {
	
	private String m_id, m_name, comment_content, create_at, update_at;
	private int comment_id, post_id;
	
	public ComuCommentDto(String m_id, String m_name, String comment_content, String create_at, String update_at,
			int comment_id, int post_id) {
		this.m_id = m_id;
		this.m_name = m_name;
		this.comment_content = comment_content;
		this.create_at = create_at;
		this.update_at = update_at;
		this.comment_id = comment_id;
		this.post_id = post_id;
	}

	public String getM_id() {
		return m_id;
	}

	public String getM_name() {
		return m_name;
	}

	public String getComment_content() {
		return comment_content;
	}

	public String getCreate_at() {
		return create_at;
	}

	public String getUpdate_at() {
		return update_at;
	}

	public int getComment_id() {
		return comment_id;
	}

	public int getPost_id() {
		return post_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}

	public void setCreate_at(String create_at) {
		this.create_at = create_at;
	}

	public void setUpdate_at(String update_at) {
		this.update_at = update_at;
	}

	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	
	
	
}
