package dto;

public class ComuDto {

	private String m_id, title, content, create_at, update_at;
	private int post_id, hit;
	
	public ComuDto(String m_id, String title, String content, String create_at, String update_at, int post_id,
			int hit) {
		this.m_id = m_id;
		this.title = title;
		this.content = content;
		this.create_at = create_at;
		this.update_at = update_at;
		this.post_id = post_id;
		this.hit = hit;
	}
	
	
	
	public ComuDto(String m_id, String title, String content) {
		super();
		this.m_id = m_id;
		this.title = title;
		this.content = content;
	}



	public String getM_id() {
		return m_id;
	}
	public String getTitle() {
		return title;
	}
	public String getContent() {
		return content;
	}
	public String getCreate_at() {
		return create_at;
	}
	public String getUpdate_at() {
		return update_at;
	}
	public int getPost_id() {
		return post_id;
	}
	public int getHit() {
		return hit;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setCreate_at(String create_at) {
		this.create_at = create_at;
	}

	public void setUpdate_at(String update_at) {
		this.update_at = update_at;
	}

	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}
	
	
	
}
